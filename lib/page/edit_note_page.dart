import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../db/notes_database.dart';
import '../model/note.dart';
import '../widget/note_form_widget.dart';
import 'package:file_picker/file_picker.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);

  @override
  State<AddEditNotePage> createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;
  late String imagePath;
  late String audioPath;

  @override
  void initState() {
    super.initState();

    isImportant = widget.note?.isImportant ?? false;
    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
    imagePath = widget.note?.imagePath ?? '';
    audioPath = widget.note?.audioPath ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            isImportant: isImportant,
            number: number,
            title: title,
            description: description,
            onChangedImportant: (isImportant) =>
                setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: isFormValid ? null : Colors.grey.shade700,
            ),
            onPressed: addOrUpdateNote,
            child: const Text('Salvar'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromARGB(255, 24, 148, 86),
            ),
            onPressed: () async {
              final imagePicker = ImagePicker();
              final pickedImage =
                  await imagePicker.pickImage(source: ImageSource.gallery);
              if (pickedImage != null) {
                final newImagePath = pickedImage.path;
                setState(() {
                  imagePath = newImagePath;
                });
              }
            },
            child: const Text('Seleccionar foto'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue, // Customize the button's color
            ),
            onPressed: () async {
              final audioPickerResult = await FilePicker.platform.pickFiles(
                type: FileType.audio,
                allowMultiple: false,
              );

              if (audioPickerResult != null &&
                  audioPickerResult.files.isNotEmpty) {
                final audioFile = audioPickerResult.files.first;
                setState(() {
                  audioPath = audioFile.path!;
                });
              }
            },
            child: const Text('Seleccionar Audio'),
          ),
        ],
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
      imagePath: imagePath,
      audioPath: audioPath,
    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
      imagePath: imagePath,
      audioPath: audioPath,
    );

    await NotesDatabase.instance.create(note);
  }
}
