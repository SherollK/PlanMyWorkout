import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get the current user's UID
  String? get currentUserId => _auth.currentUser?.uid;

  // Reference to the user-specific notes collection
  CollectionReference get userNotes {
    final userId = currentUserId;
    if (userId == null) {
      throw Exception("User not logged in");
    }
    return FirebaseFirestore.instance.collection('users').doc(userId).collection('notes');
  }

  // CREATE: add a new note
  Future<void> addNote(String note, String details) {
    return userNotes.add({
      'note': note,
      'details': details,
      'timestamp': Timestamp.now(),
    });
  }

  // READ: get a note from database
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
      userNotes.orderBy('timestamp', descending: false).snapshots();
    return notesStream;
  }

  // UPDATE: update a note
  Future<void> updateNote(String docId, String newNote, String newDetails) {
    return userNotes.doc(docId).update({
      'note': newNote,
      'details': newDetails,
      'timestamp': Timestamp.now(),
    });
  }

  // DELETE: delete a note
  Future<void> deleteNote(String docId) {
    return userNotes.doc(docId).delete();
  }
}
