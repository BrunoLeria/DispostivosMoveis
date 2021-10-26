import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text('Guest'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('seuemail@gmail.com',
                style: Theme.of(context).textTheme.headline3),
            Spacer(),
            TextButton(
                child: Text('logout'),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                }),
            Spacer()
          ],
        ),
      ),
    );
  }
}
