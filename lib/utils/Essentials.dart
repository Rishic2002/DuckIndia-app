// ignore_for_file: unnecessary_import

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Utils/constants.dart';
import '../Utils/functions.dart';
import '../Utils/theme_helper.dart';
import '../Utils/util.dart';

class Essentials {
  static double commonPadding = 10;
  static double sSize = 12;
  static double pSize = 13;
  static double rSize = 14;
  static double nSize = 15;
  static double mSize = 16;
  static double lSize = 18;
  static double sHeader = 20;
  static double mHeader = 22;
  static double aHeader = 24;
  static double bHeader = 25;

  static const yellowColor = Color.fromARGB(255, 244, 176, 28);
  static const Color primaryColor = Color(0xff57c75f);
  static const Color pinkColor = Color(0xffDF43A3);

  static networkPlaceHolder() {
    return (_, __) {
      return Center(child: getProgressBar(size: 15));
    };
  }

  static errorPlaceHolder() {
    return (_, __, ___) {
      return const SizedBox.shrink();
    };
  }
  // static AppBar tempAppBar(BuildContext context, String title,
  //     {List<Widget>? actions,
  //       centerTitle = true,
  //       double fontSize = 18,
  //       Widget? leading,
  //       Widget? titleWidget,
  //       Color? iconColor,
  //       Color? titleColor,
  //       Color? backgroundColor,
  //       bool showEditButton = false,
  //       bool showBackButton = true}) {
  //   Widget logoImage = SizedBox(
  //     height: 25,
  //     width: 25,
  //     child: Image.asset(
  //       ImageConstant.logo,
  //       fit: BoxFit.cover,
  //     ),
  //   );
  //   Widget titleText = titleWidget ??
  //       myText(title,
  //           context: context,
  //           fontSize: fontSize,
  //           textColor: titleColor ?? PrimaryColors().white);
  //
  //   List<Widget> appBarActions = [];
  //
  //   if (showEditButton) {
  //     // Add edit button if the flag is true
  //     appBarActions.add(
  //       Container(
  //         margin: const EdgeInsets.all(12),
  //         child: InkWell(
  //           onTap: () {},
  //           child: SvgPicture.asset(
  //             ImageConstant.add_icon,
  //             height: 16,
  //             width: 16,
  //             color: PrimaryColors().white,
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  //   if (actions != null) {
  //     appBarActions.addAll(actions);
  //   }
  //   return AppBar(
  //     backgroundColor:
  //     backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
  //
  //     automaticallyImplyLeading: false,
  //     leading: showBackButton
  //         ? InkWell(
  //         onTap: () {
  //           Navigator.pop(context);
  //         },
  //         child: Container(
  //           margin: const EdgeInsets.all(12),
  //           child: SvgPicture.asset(
  //             ImageConstant.add_icon,
  //             color: iconColor ?? PrimaryColors().white,
  //           ),
  //         ))
  //         : leading,
  //     titleSpacing: 0,
  //     elevation: 0,
  //     title: titleText,
  //     centerTitle: centerTitle,
  //     actions: appBarActions,
  //   );
  // }

  static PreferredSizeWidget myAppBar(
    BuildContext context,
    String? title, {
    List<Widget>? actions,
    bool showLogo = false,
    bool backButton = true,
    Color appbarcolor = Colors.transparent,
    Color Textcolor = Colors.white,
    Color Iconcolor = Colors.white,
    bool applyGradient = true,
    FontWeight fontWeight = FontWeight.bold,
    bool showText = true,
    bool showNotifications = false,
    Widget? bottomsheetwidget,
    bool isHeader = false,
    Widget? mywidget,
    Widget? leading,
    bool showProfile = false,
    bool centertitle = false,
    bool showChatButton = false,
    bool showSearchButton = false,
  }) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: applyGradient
            ? BoxDecoration(
                gradient: PrimaryColors().mainGradient,
              )
            : BoxDecoration(
                color: appbarcolor,
              ),
        child: AppBar(
          centerTitle: centertitle,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          title: myText(
            title ?? '',
            context: context,
            fontSize: Essentials.lSize,
            textColor: Textcolor,
            fontWeight: fontWeight,
          ),
          automaticallyImplyLeading: false,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (backButton)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 32,
                    width: 32,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 23,
                          color: Iconcolor,
                        ),
                      ),
                    ),
                  ),
                ),
              if (backButton) SizedBox(width: 8),
              if (showProfile)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const OtherUserScreen(),
                        //   ),
                        // );
                      },
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.pngguru.in/storage/uploads/images/Rishabh%20pant%20indian%20cricket%20player%20free%20png_1669451098_1688557580.webp'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText("Rishi Chhabra",
                              context: context,
                              textColor: PrimaryColors().white,
                              fontSize: Essentials.mSize,
                              fontWeight: FontWeight.w500),
                          myText("Manager",
                              context: context,
                              textColor: PrimaryColors().white,
                              fontSize: Essentials.rSize),
                        ],
                      ),
                    ),
                  ],
                ),
              if (showLogo)
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const Team(),
                    //   ),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset(ImageConstant.clubLogo,
                        height: 40, width: 40),
                  ),
                ),
              if (showLogo) SizedBox(width: 8),
              // if (showText)
              //   Padding(
              //     padding: const EdgeInsets.only(left: 8.0),
              //     child: myText(
              //       title ?? '',
              //       context: context,
              //       fontSize: Essentials.lSize,
              //       textColor: Textcolor,
              //       fontWeight: fontWeight,
              //     ),
              //   )
            ],
          ),
          actions: [
            if (mywidget != null) mywidget,
            if (showNotifications)
              InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const NotificationScreen(),
                    //   ),
                    // );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/notifications.svg",
                    width: 25,
                  )),
            if (showNotifications) SizedBox(width: 8),
            if (showChatButton)
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const MessageScreen(),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.chat_bubble_outline_outlined,
                    color: Iconcolor,
                    size: 30.0,
                  ),
                ),
              ),
            if (showSearchButton)
              GestureDetector(
                onTap: () {
                  Essentials.showCustomBottomSheet(
                      context: context,
                      child: SizedBox(child: bottomsheetwidget));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    color: Iconcolor,
                    size: 30.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Widget myDivider({double size = 3, double margin = 8}) {
    return Container(
      margin: EdgeInsets.all(margin),
      color: Colors.grey,
      height: size,
    );
  }

  static Widget getProgressBar({double size = 50}) {
    return Center(
      child: SpinKitThreeBounce(
        color: primaryColor,
        size: size,
      ),
    );
  }

  static looseFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static SizedBox heightSpacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  static SizedBox widthSpacer(double width) {
    return SizedBox(
      width: width,
    );
  }

  static Widget myCustomButton(
      {required BuildContext context,
      required String text,
      double width = 400,
      double textPadding = 8,
      double circleRadius = 4,
      Color color = Colors.white,
      Color buttonColor = Colors.blue,
      VoidCallback? onTap,
      FontWeight? fontweight,
      double? fontSize}) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(circleRadius),
          ),
          child: Padding(
            padding: EdgeInsets.all(textPadding),
            child: Center(
              child: myText(text,
                  context: context,
                  fontWeight: fontweight,
                  fontSize: fontSize,
                  textColor: color),
            ),
          ),
        ),
      ),
    );
  }

  static BoxDecoration shadowDecoration({
    // Border? myborder,
    // BorderRadius? myborderradius,
    double opacity = 0.05,
    Color color = Colors.grey,
  }) {
    return BoxDecoration(
      // color: color,
      // border: myborder,
      // borderRadius: myborderradius,
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(opacity),
          spreadRadius: 5,
          blurRadius: 9,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  static BoxDecoration chatScreenDecor({
    Border? myborder,
    BorderRadius? myborderradius,
    double opacity = 0.3,
    Color color = Colors.grey,
    Color boxshadowcolor = Colors.grey,
  }) {
    return BoxDecoration(
      color: color,
      border: myborder,
      borderRadius: myborderradius,
      boxShadow: [
        BoxShadow(
          color: boxshadowcolor.withOpacity(opacity),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  static BoxDecoration cardShadowDecoration( //used for the home cards

      {
    double opacity = 0.1,
    Color color = Colors.grey,
  }) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(opacity),
          spreadRadius: 6,
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
      color: PrimaryColors().white,
    );
  }

  static launchURL({required BuildContext context, required String url}) async {
    Uri uri = Uri.parse(url);
    await canLaunchUrl(uri)
        ? await launchUrl(uri)
        : CustomSnackBar()
            .basicSnackbar(context, 'Error occurred while launching ths url');
  }

  static showCustomBottomSheet(
      {required BuildContext context, required Widget child}) {
    showModalBottomSheet(
        enableDrag: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        backgroundColor: PrimaryColors().white,
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (context) {
          return child;
        });
  }
}
