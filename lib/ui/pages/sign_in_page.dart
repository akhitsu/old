part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "FabStore",
                    style: blackTextFont.copyWith(fontSize: 36),
                  ),
                ),
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"))),
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isEmailValid = EmailValidator.validate(text);
                    });
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email Address",
                      hintText: "Email Address"),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      isPasswordValid = text.length >= 6;
                    });
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      hintText: "Password"),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Forgot Password? ",
                      style: blueTextFont.copyWith(fontSize: 12),
                    ),
                    Text(
                      "Get Now",
                      style: yellowTextFont.copyWith(fontSize: 12),
                    )
                  ],
                ),
                Container(
                    width: 250,
                    height: 46,
                    margin: EdgeInsets.only(top: 70, bottom: 19),
                    child: isSigningIn
                        ? SpinKitWave(color: mainColor)
                        : RaisedButton(
                            child: Text(
                              "Sign In",
                              style: whiteTextFont.copyWith(fontSize: 16),
                            ),
                            color: isEmailValid && isPasswordValid
                                ? mainColor
                                : Color(0XFFE4E4E),
                            onPressed: isEmailValid && isPasswordValid
                                ? () async {
                                    setState(() {
                                      isSigningIn = true;
                                    });

                                    SignInSignUpResult result =
                                        await AuthServices.signIn(
                                            emailController.text,
                                            passwordController.text);

                                    if (result.user == null) {
                                      setState(() {
                                        isSigningIn = false;
                                      });

                                      Flushbar(
                                        duration: Duration(seconds: 4),
                                        flushbarPosition: FlushbarPosition.TOP,
                                        backgroundColor: Color(0xFFFF5C83),
                                        message: result.message,
                                      )..show(context);
                                    }
                                  }
                                : null)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account yet? ",
                        style:
                            greyTextFont.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Sign Up",
                        style: blueTextFont,
                      )
                    ])
              ],
            )),
      ),
    );
  }
}
