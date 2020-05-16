part of 'shared.dart';

const double defaultMargin = 24;
Color mainColor = Color(0xFF2E97FB);
Color accentColor3 = Color(0xFFADADAD); //greey
Color accentColor2 = Color(0xFFF9B72E);

TextStyle blackTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);
TextStyle whiteTextFont = GoogleFonts.raleway()
    .copyWith(color: Colors.white, fontWeight: FontWeight.w500);
TextStyle blueTextFont = GoogleFonts.raleway()
    .copyWith(color: mainColor, fontWeight: FontWeight.w500);
TextStyle greyTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor3, fontWeight: FontWeight.w500);
TextStyle yellowTextFont = GoogleFonts.raleway()
    .copyWith(color: accentColor2, fontWeight: FontWeight.w500);
TextStyle whiteNumberFont =
    GoogleFonts.openSans().copyWith(color: Colors.white);
