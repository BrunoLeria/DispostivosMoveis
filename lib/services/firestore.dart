import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart'; //RxDart extends the capabilities of Dart Streams and StreamControllers.
import 'package:demo/services/services.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all documments from the topics collection
  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics'); //reference to the topics collection
    var snapshot = await ref
        .get(); //get() returns a QuerySnapshot object. Not for realtime updates.
    var data = snapshot.docs
        .map((s) => s.data()); //map() returns a List of Maps. Yep that's it.
    var topics = data
        .map((d) => Topic.fromJson(d)); //map() returns a List of Topic objects.
    return topics.toList(); //toList() returns a List of Topic objects.
  }

  /// Retrieves a single quiz document
  Future<Quiz> getQuiz(String quizId) async {
    var ref =
        _db.collection('quizzes').doc(quizId); //reference to the quiz document
    var snapshot = await ref.get(); //get() returns a DocumentSnapshot object.
    return Quiz.fromJson(snapshot.data() ??
        {}); //data() returns a Map. fromJson() returns a Quiz object.
  }

  /// Listens to current user's report document in Firestore
  Stream<Report> streamReport() {
    return AuthService().userStream.switchMap((user) {
      //switchMap() returns a Stream<T>, you can start whit a stream of user objects and switch to a stream of report objects.
      if (user != null) {
        //if user is not null
        var ref = _db.collection('reports').doc(user
            .uid); //reference to the user's report document. user.uid is the user's id.
        return ref.snapshots().map((doc) => Report.fromJson(doc
            .data()!)); //snapshots() returns a Stream<DocumentSnapshot> object. map() returns a Stream<T> object. fromJson() returns a Report object.
      } else {
        return Stream.fromIterable([
          Report()
        ]); //if user is null, return a Stream<Report> object with a default Report object.
      }
    });
  }
}
