import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/services/firestore.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  final FirestoreService firestoreService = FirestoreService(); //firestor

  final TextEditingController textController =
      TextEditingController(); //text controller for the note

  //open a dialog to add a new note
  void openNoteBox({String? docId}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //button to save the note
          ElevatedButton(
              onPressed: () {
                if (docId == null) {
                  firestoreService
                      .addNote(textController.text); //add a new note
                } else {
                  firestoreService.updateNote(
                      docId, textController.text); //update the exixting note
                }

                textController.clear(); //clear the text field
                Navigator.pop(context); //close the dialog
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.green.shade400),
                foregroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.background),
              ),
              child: const Text("Add"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        titleTextStyle: TextStyle(
            fontSize: 18, color: Theme.of(context).colorScheme.primary),
        title: const Text("Workout Plan"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        backgroundColor: Colors.green.shade400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          //if we have data, get all the docs
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;
            //display as a list
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                //get each individual doc
                DocumentSnapshot document = notesList[index];
                String docId = document.id;

                //get note from each doc
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                //display as a list tile
                return Padding(
                  padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                  ),
                  child: ListTile(
                  tileColor: Colors.green.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: Text(
                    noteText,
                    style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    IconButton(
                      onPressed: () => openNoteBox(docId: docId),
                      icon: const Icon(Icons.edit),
                      color: Theme.of(context).colorScheme.background,
                    ),
                    IconButton(
                      onPressed: () => firestoreService.deleteNote(docId),
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.background,
                    ),
                    ],
                  ),
                  ),
                );                 
              },
            );
          } else {
            return const Text("Add your workout plan!");
          }
        },
      ),
    );
  }
}
