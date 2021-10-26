import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sobre'), backgroundColor: Colors.blue),
      body: Center(
        child: Text(
            'Este aplicativo está sendo desenvolvido por Bruno, para disciplina de dispositivos móveis ensinada pelo professor Diego. Este aplicativo tem inspiração no curso desenvolvido pelo canal no YouTube Fireship.io. Mais informações acesse https://fireship.io/courses/flutter-firebase.'),
      ),
    );
  }
}
