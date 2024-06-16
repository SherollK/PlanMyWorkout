import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //get collection of notes
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');


  //CREATE: add a new note
  Future<void> addNote(String note){
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }
    
  //READ: get a note from database
  Stream<QuerySnapshot> getNotesStream(){
    final notesStream = 
      notes.orderBy('timestamp', descending: false).snapshots();
    return notesStream;
    
  }

  //UPDATE: update a note
  Future<void> updateNote(String docId, String newNote){
    return notes.doc(docId).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

  //DELETE: delete a note
  Future<void> deleteNote(String docId){
    return notes.doc(docId).delete();
  }
}