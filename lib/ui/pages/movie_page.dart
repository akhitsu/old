part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //note : Header
        Container(
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.fromLTRB(defaultMargin, 50, defaultMargin, 30),
            child: BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
              if (userState is UserLoaded) {
                return Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Pendapatan Hari Ini: ",
                            style: whiteTextFont.copyWith(fontSize: 18)),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color(0xFF54AAF9),
                          ),
                          child: Text("IDR",
                              style: whiteTextFont.copyWith(fontSize: 16)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Kasir : " + (userState.user.name),
                            style: whiteTextFont.copyWith(fontSize: 18)),
                        Text(
                          "Lokasi : " + (userState.user.lokasi),
                          style: whiteTextFont.copyWith(fontSize: 18),
                        ),
                      ],
                    )
                  ],
                );
              } else {}
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            })),
      ],
    );
  }
}
