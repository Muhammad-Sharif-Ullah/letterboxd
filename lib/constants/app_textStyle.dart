import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static final TextStyle onBoardingText = GoogleFonts.openSans(
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  );
  static final TextStyle loginTitle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  );
  static final TextStyle loginSubtitle = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 13),
  );

  static final TextStyle mixText = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 9, color: Color(0xFFE9A6A6)),
  );
  static final TextStyle hello = GoogleFonts.openSans(
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  );

  static final TextStyle drawerAvatarTitle = GoogleFonts.openSans(
    textStyle: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFFE9A6A6)),
  );
  static final TextStyle drawerAvatarSubTItle = GoogleFonts.robotoSlab(
    textStyle: const TextStyle(fontSize: 12, color: Color(0xFF8F8E9B)),
  );
  static final TextStyle outlineButtonText = GoogleFonts.robotoSlab(
    textStyle: const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
  );

  static final TextStyle elevatedText = GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: Colors.black,
    ),
  );
  static final ButtonStyle elevatedBTN = ElevatedButton.styleFrom(
    primary: const Color(0xFFE9A6A6),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );

  /// Drawer Tile TextStyle const Color(0xFF82818D),
  static final TextStyle drawerTileTextInactive = GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
      color: Color(0xFF82818D),
    ),
  );
  static final TextStyle drawerTileTextActive = GoogleFonts.openSans(
    textStyle: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  /// Outlined Button Style
  static final ButtonStyle followerOutlineButton = OutlinedButton.styleFrom(
    primary: const Color(0xFF9C4A8B),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    side: const BorderSide(
      color: Color(0xFF9C4A8B),
    ),
    textStyle: AppStyle.outlineButtonText.copyWith(color: Colors.white),
  );

  // Profile
  static final TextStyle profileName = GoogleFonts.openSans(
    textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  );
  AppStyle._();
}
