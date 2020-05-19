part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 136,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, bottom: 16),
                child: Text("Lest's Begin!",
                    style: blackTextFont.copyWith(fontSize: 20)),
              ),
              Container(
                  width: 250,
                  height: 46,
                  margin: EdgeInsets.only(top: 70, bottom: 19),
                  child: RaisedButton(
                      child: Text(
                        "Let's Begin!",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      color: mainColor,
                      onPressed: () {
                        context.bloc<PageBloc>().add(GoToLoginPage());
                      })),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account? ",
                      style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Sign In",
                      style: blueTextFont,
                    )
                  ])
            ],
          ),
        ));
  }
}
//test
