import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../db/notes_database.dart';
import '../model/note.dart';
import '../page/edit_note_page.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  Future<void> _initiatePhoneCall(String phoneNumber) async {
    final phoneCallUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneCallUrl)) {
      await launch(phoneCallUrl);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('No se pudo realizar la llamada telefónica.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(note.createdTime),
                      style: const TextStyle(color: Colors.white38),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      note.description,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    if (note.imagePath != null && note.imagePath != "")
                      Image.file(File(note.imagePath!),
                          height: 200, width: 200),
                    if (note.imagePath == "") Text(''),
                    ElevatedButton(
                      onPressed: () {
                        if (note.audioPath.isNotEmpty) {
                          Source compai = UrlSource(note.audioPath);
                          AudioPlayer().play(compai);
                        }
                      },
                      child: const Text('Reproducir audio'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _initiatePhoneCall(note.number.toString());
                        // Navigate to the note registration page with pre-filled data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddEditNotePage(
                              note: Note(
                                number: note.number,
                                title: note.title,
                                description: note.description,
                                createdTime: DateTime.now(),
                                imagePath: note.imagePath,
                                audioPath: note.audioPath,
                                isImportant: note.isImportant,
                                phoneNumber: note.phoneNumber,
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Text('Iniciar llamada y registrar nota'),
                    ),
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(note: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await NotesDatabase.instance.delete(widget.noteId);

          Navigator.of(context).pop();
        },
      );
}
