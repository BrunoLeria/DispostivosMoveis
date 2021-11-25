import 'package:demo/views/topics/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demo/services/services.dart';
import 'package:demo/components/components.dart';
import 'package:demo/views/topics/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      //Widget that builds itself based on the latest snapshot of interaction with a Future.
      future: FirestoreService().getTopics(), //Future to listen to.
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            drawer: TopicDrawer(topics: topics),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0), //Padding between the cards.
              crossAxisSpacing: 10.0, //horizontal spacing
              crossAxisCount: 2, //Number of items per row.
              children: topics
                  .map((topic) => TopicItem(topic: topic))
                  .toList(), //List of widgets to display. The number of widgets in the list will be equal to the crossAxisCount.
            ),
            bottomNavigationBar: const AppBottomNav(),
          );
        } else {
          return const Text('No topics found in Firestore. Check database');
        }
      },
    );
  }
}
