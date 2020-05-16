part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign IN Page'),
      ),
      body: Center(
          child: RaisedButton(
              child: Text('Sign IN'),
              onPressed: () {
                AuthServices.signIn('blogakhitsu@gmail.com', '123456');
              })),
    );
  }
}
