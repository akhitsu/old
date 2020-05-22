part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: mainColor,
          ),
          SafeArea(
              child: Container(
            color: backColor,
          )),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: <Widget>[
              MoviePage(),
              Center(
                child: Text("Cart"),
              ),
              Center(
                child: Text("Pending"),
              ),
              Center(
                child: Text("Setting"),
              ),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    selectedItemColor: mainColor,
                    unselectedItemColor: unselectedColor,
                    currentIndex: bottomNavBarIndex,
                    onTap: (index) {
                      setState(() {
                        bottomNavBarIndex = index;
                        pageController.jumpToPage(index);
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                          title: Text("Home",
                              style: GoogleFonts.raleway(
                                  fontSize: 10, fontWeight: FontWeight.w600)),
                          icon: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            height: 30,
                            child: Image.asset((bottomNavBarIndex == 0)
                                ? "assets/home_active.png"
                                : "assets/home_inactive.png"),
                          )),
                      BottomNavigationBarItem(
                          title: Text("Cart",
                              style: GoogleFonts.raleway(
                                  fontSize: 10, fontWeight: FontWeight.w600)),
                          icon: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            height: 30,
                            child: Image.asset((bottomNavBarIndex == 1)
                                ? "assets/cart_active.png"
                                : "assets/cart_inactive.png"),
                          )),
                      BottomNavigationBarItem(
                          title: Text("Pending",
                              style: GoogleFonts.raleway(
                                  fontSize: 10, fontWeight: FontWeight.w600)),
                          icon: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            height: 30,
                            child: Image.asset((bottomNavBarIndex == 2)
                                ? "assets/pending_active.png"
                                : "assets/pending_inactive.png"),
                          )),
                      BottomNavigationBarItem(
                          title: Text("Setting",
                              style: GoogleFonts.raleway(
                                  fontSize: 10, fontWeight: FontWeight.w600)),
                          icon: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            height: 30,
                            child: Image.asset((bottomNavBarIndex == 3)
                                ? "assets/setting_active.png"
                                : "assets/setting_inactive.png"),
                          ))
                    ]),
              ))
        ],
      ),
    );
  }
}
