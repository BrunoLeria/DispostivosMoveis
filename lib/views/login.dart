import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterLogo(
                size: 150,
              ),
              Text(
                'Login to Start',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              Text('Welcome! Hey everyone, he is here!'),
              TextButton.icon(
                icon: Icon(FontAwesomeIcons.google),
                label: Text('Login with Google'),
                style: TextButton.styleFrom(
                  primary: Colors.black45,
                  backgroundColor: Colors.white30,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/topics');
                },
              ),
              TextButton(
                  child: Text('Continue as Guest'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white30,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/topics');
                  })
            ],
          ),
        ),
      ),
    );
  }
}

/// A resuable login button for multiple auth methods
class LoginButton extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final String? text;
  final Function loginMethod;

  const LoginButton(
      {Key? key, this.text, this.icon, this.color, required this.loginMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextButton.icon(
        icon: Icon(icon, color: Colors.white),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          primary: color,
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () async {
          var user = await loginMethod();
          if (user != null) {
            Navigator.pushReplacementNamed(context, '/topics');
          }
        },
        label: Expanded(
          child: Text('$text', textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
