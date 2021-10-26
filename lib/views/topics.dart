import 'package:flutter/material.dart';

import '/components/components.dart';

class TopicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Topics'), backgroundColor: Colors.blue),
      body: Center(),
      bottomNavigationBar: AppBottomNav(),
    );
  }
}
