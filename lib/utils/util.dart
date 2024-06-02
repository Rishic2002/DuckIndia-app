import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/theme_helper.dart';
import 'Essentials.dart';
import 'functions.dart';

round_btn(
    {required scolor,
    required icon,
    final Function()? onPress,
    double isize = 21.0,
    double size = 29,
    icolor = Colors.black}) {
  return InkWell(
    onTap: onPress,
    highlightColor: Colors.transparent,
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: scolor,
        borderRadius:
            BorderRadius.circular(50.0), // Optional: round the corners
      ),
      child: Icon(
        icon,
        color: icolor,
        size: isize,
      ),
    ),
  );
}

add_btn(scolor, context, label, {Function()? onSave}) {
  return Container(
    height: 28,
    width: 28,
    decoration: BoxDecoration(
      color: scolor,
      borderRadius: BorderRadius.circular(50.0), // Optional: round the corners
    ),
    child: IconButton(
      icon: const Icon(
        Icons.add,
        color: Colors.black,
      ),
      onPressed: onSave,
      color: PrimaryColors().white,
      // Set the icon color to white
      iconSize: 22.0,
      splashColor: Colors.grey,
      padding: const EdgeInsets.all(3.0),
    ),
  );
}

outlined_number(scolor, value) {
  return Stack(
    children: [
      const Icon(Icons.notifications),
      Positioned(
        right: 0,
        top: 0,
        child: Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
            color: scolor,
            shape: BoxShape.circle,
          ),
          constraints: const BoxConstraints(
            minWidth: 23,
            minHeight: 23,
          ),
          child: Text(
            value,
            style: TextStyle(
              color: PrimaryColors().white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}

followerTile(image, name, username, follow, {required BuildContext context}) {
  var color = ThemeColor(context);
  return Column(children: [
    const SizedBox(
      height: 12,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            image,
            height: 40,
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myText(name, context: context, fontWeight: FontWeight.w500),
              const SizedBox(
                height: 3,
              ),
              myText(username, context: context, fontWeight: FontWeight.w300)
            ],
          ),
        ]),
        GestureDetector(
          child: Container(
              padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 7, bottom: 7),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: (follow) ? Colors.grey : Colors.blue,
                    width: 1.0,
                  ),
                  color: (follow) ? color['primary'] : Colors.blue,
                  borderRadius: BorderRadius.circular(50)),
              child: myText(
                context: context,
                (follow) ? "Remove" : " Follow ",
              )),
        )
      ],
    ),
    const SizedBox(
      height: 16,
    ),
    Container(
      height: 0.35,
      color: const Color.fromARGB(255, 155, 155, 155),
    )
  ]);
}

myCommentTile(
    {required BuildContext context,
    required var image,
    required var title,
    required var comment,
    var onTap,
    var numberOfDislikes,
    var communityName,
    var creationTime,
    var numberOfLikes,
    bool noPadding = false}) {
  bool isDark = IsDarkTheme(context);
  return Padding(
      padding: noPadding
          ? EdgeInsets.zero
          : const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 34,
          width: 34,
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(image.toString()),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontSize: Essentials.mSize,
                      color: isDark ? PrimaryColors().white : Colors.black,
                    ),
                    children: [
              TextSpan(
                text: title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: " $comment",
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
              WidgetSpan(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 9),
                      child: Column(children: [
                        if (numberOfLikes != null)
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                if (creationTime != null)
                                  myText(getTimeAgo(creationTime),
                                      context: context),
                                Essentials.widthSpacer(8),
                                myText("-", context: context),
                                Essentials.widthSpacer(8),
                                if (communityName != null)
                                  GestureDetector(
                                    onTap: onTap,
                                    child: Row(
                                      children: [
                                        myText("c/${communityName.toString()}",
                                            textColor: Colors.blueAccent,
                                            context: context),
                                      ],
                                    ),
                                  ),
                              ]),
                        const SizedBox(
                          height: 3,
                        )
                      ]))),
            ])))
      ]));
}

Widget circleCheckbox({
  bool selectedOption = false,
}) {
  bool isChecked = selectedOption;

  return StatefulBuilder(
    builder: (context, setState) {
      return InkWell(
        onTap: () {
          setState(() {
            isChecked = !isChecked;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 12),
          width: 18.0,
          height: 18.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2.0,
              color: isChecked ? Colors.blue : Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: isChecked
                ? Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue,
                    ),
                  )
                : Container(),
          ),
        ),
      );
    },
  );
}

groupTile(
    {required String image,
    required String name,
    required String username,
    required BuildContext context}) {
  return Column(children: [
    const SizedBox(
      height: 12,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            image,
            height: 40,
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myText(name, context: context, fontWeight: FontWeight.w500),
              const SizedBox(
                height: 3,
              ),
              myText(username, context: context, fontWeight: FontWeight.w300)
            ],
          ),
        ]),
        Container(
          child: circleCheckbox(),
        )
      ],
    ),
    const SizedBox(
      height: 16,
    ),
    Container(
      height: 0.35,
      color: const Color.fromARGB(255, 155, 155, 155),
    )
  ]);
}

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

Text myText(
  data, {
  required context,
  decoration,
  Key? key,
  bool softwrap = true,
  textColor,
  double? fontSize,
  fontWeight,
  double? height,
  TextOverflow? overflow,
  TextAlign? textAlign,
  FontStyle? fontStyle,
  TextDirection? textDirection,
  int? maxLines,
}) {
  bool IsDark = IsDarkTheme(context);
  final Color = (textColor != null)
      ? textColor
      : IsDark
          ? PrimaryColors().white
          : Colors.black;
  return Text(
    data,
    key: key,
    softWrap: softwrap,
    //textScaleFactor: 1,
    textAlign: textAlign,
    style: TextStyle(
        fontStyle: fontStyle,
        color: Color,
        fontSize: fontSize,
        //  overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        height: height,
        decoration: decoration),
    overflow: overflow,
    maxLines: maxLines,
  );
}

RichText myRichText(data,
    {required context,
    decoration,
    textColor,
    Key? key,
    List<TextSpan>? textSpans,
    double? fontSize,
    FontWeight? fontWeight,
    double? height,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    bool isHeader = false}) {
  bool isDark = IsDarkTheme(context);
  final Color color = (textColor != null)
      ? textColor!
      : isDark
          ? PrimaryColors().white
          : Colors.black;
  return RichText(
    key: key,
    textScaleFactor: 1,
    textAlign: textAlign ?? TextAlign.start,
    textDirection: textDirection,
    overflow: overflow ?? TextOverflow.ellipsis,
    text: TextSpan(
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: height,
        fontFamily: isHeader ? "firasans" : "poppins",
        decoration: decoration,
      ),
      children: textSpans,
    ),
  );
}

ThemeColor(context) {
  return IsDarkTheme(context)
      ? {
          "primary": Colors.black,
          "third": const Color.fromARGB(255, 52, 52, 52),
          "secondary": const Color.fromARGB(255, 21, 21, 21)
        }
      : {
          "primary": PrimaryColors().white,
          "third": PrimaryColors().white,
          "secondary": const Color.fromARGB(255, 232, 232, 232)
        };
}

IsDarkTheme(context, {bool listen = true}) {
  // final themeModel = Provider.of<ThemeModel>(context, listen: false);
  // return themeModel.isDarkTheme;
  return false;
}

Widget myCheckbox(
    String title, bool value, Function(bool?) onChanged, BuildContext context) {
  return SizedBox(
    height: 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          shape: const CircleBorder(),
          value: value,
          onChanged: onChanged as void Function(bool?)?,
        ),
        myText(
          title,
          fontSize: Essentials.mSize,
          fontWeight: FontWeight.w400,
          textColor: PrimaryColors().black,
          context: context,
        ),
      ],
    ),
  );
}

Widget myTextFormField(
    {required context,
    required controller,
    required label,
    suffixIcon,
    prefixIcon,
    int maxlines = 1,
    margin = true,
    obscureText = false,
    String? hintText}) {
  bool IsDark = IsDarkTheme(context);
  return Container(
    margin: EdgeInsets.zero,
    child: TextFormField(
      maxLines: maxlines,
      obscureText: obscureText,
      controller: controller,
      cursorColor: const Color.fromARGB(255, 145, 145, 145),
      style: TextStyle(
          color:
              IsDark ? const Color.fromARGB(255, 145, 145, 145) : Colors.black),
      decoration: InputDecoration(
        // fillColor: PrimaryColors().white,
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        prefixIcon: (prefixIcon != null)
            ? Padding(
                padding: const EdgeInsets.only(right: 9),
                child: Icon(
                  prefixIcon,
                ),
              )
            : null,
        labelText: label,

        labelStyle: TextStyle(
            color: IsDark
                ? const Color.fromARGB(255, 145, 145, 145)
                : Colors.black,
            fontSize: Essentials.rSize,
            fontWeight: FontWeight.w300,
            letterSpacing: .15),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 25,
          minHeight: 25,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: PrimaryColors().grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PrimaryColors().grey),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PrimaryColors().grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

// Widget myRoundIconBtn(
//     {required context,
//     double iconSize = 18,
//     iconColor = Colors.black,
//     color = null,
//     double height = 28,
//     double width = 28,
//     required icon,
//     Function()? onPress}) {
//   return Container(
//     height: height,
//     width: width,
//     decoration: BoxDecoration(
//       color: (color != null) ? color : ThemeColor(context)['third'],
//       borderRadius: BorderRadius.circular(50.0), // Optional: round the corners
//     ),
//     child: IconButton(
//       icon: myIcon(
//         size: iconSize,
//         context: context,
//         icon: icon,
//         color: iconColor,
//       ),
//       onPressed: onPress,
//       color: PrimaryColors().white,
//       // Set the icon color to white
//       iconSize: 22.0,
//       splashColor: const Color.fromARGB(255, 116, 116, 116),
//       padding: const EdgeInsets.all(3.0),
//     ),
//   );
// }

Widget myPageLoading(
    {value,
    double size = 40,
    double height = 400,
    double strokeWidth = 4,
    color = Colors.green}) {
  return Container(
    height: height,
    child: Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          value: value,
          color: color,
        ),
      ),
    ),
  );
}

// Widget SentimentGauge(BuildContext context, {required double likes,required double dislikes,required double height,required double width}) {
//   double totalReactions = likes + dislikes;
//   double meter = (totalReactions!=0)?(((likes)/(totalReactions))*100):50;
//   print(meter);
//   return Container(
//     height: height,
//     width: width,
//     child: Center(
//       child: SfRadialGauge(
//         axes: <RadialAxis>[
//           RadialAxis(
//             showLabels: false,
//             showAxisLine: false,
//             showTicks: false,
//             minimum: 0,
//             maximum: 100,
//             startAngle: 180,
//             endAngle: 360,
//             ranges: <GaugeRange>[
//               GaugeRange(
//                 startValue: 0,
//                 endValue: 16.5,
//                 color: Color.fromARGB(255, 135, 175, 164),
//                 // Orange
//                 sizeUnit: GaugeSizeUnit.factor,
//                 startWidth: 0.65,
//                 endWidth: 0.65,
//               ),
//               GaugeRange(
//                 startValue: 16.5,
//                 endValue: 33,
//                 color: Color.fromARGB(255, 85, 136, 117),
//                 // Orange Yellow
//                 sizeUnit: GaugeSizeUnit.factor,
//                 startWidth: 0.65,
//                 endWidth: 0.65,
//               ),
//               GaugeRange(
//                 startValue: 33,
//                 endValue: 49.5,
//                 color: Color.fromARGB(255, 54, 113, 95),
//                 // Amber
//                 sizeUnit: GaugeSizeUnit.factor,
//                 startWidth: 0.65,
//                 endWidth: 0.65,
//               ),
//               GaugeRange(
//                 startValue: 49.5,
//                 endValue: 66,
//                 color: Color.fromARGB(255, 36, 94, 78),
//                 // Maize
//                 sizeUnit: GaugeSizeUnit.factor,
//                 startWidth: 0.65,
//                 endWidth: 0.65,
//               ),
//               GaugeRange(
//                 startValue: 66,
//                 endValue: 82.5,
//                 color: Color.fromARGB(255, 26, 68, 57),
//                 // Yellow
//                 sizeUnit: GaugeSizeUnit.factor,
//                 startWidth: 0.65,
//                 endWidth: 0.65,
//               ),
//               GaugeRange(
//                 startValue: 82.5,
//                 endValue: 99,
//                 color: Color.fromARGB(255, 15, 39, 33),
//                 // Cream
//                 sizeUnit: GaugeSizeUnit.factor,
//                 startWidth: 0.65,
//                 endWidth: 0.65,
//               ),
//             ],
//             pointers: <GaugePointer>[
//               NeedlePointer(needleStartWidth: 0.5,needleEndWidth: 4,value: meter,knobStyle: KnobStyle(borderWidth: 0.12,borderColor: myColors.themeText(context),color: myColors.themeText(context)),needleColor: myColors.themeText(context),),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget noDataMsg(context, {required msg, double fontSize = 14}) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          "assets/notFound.svg",
          height: 100,
          width: 100,
        ),
        Essentials.heightSpacer(30),
        myText(msg,
            fontSize: fontSize, textAlign: TextAlign.center, context: context),
      ],
    ),
  );
}

Widget myDivider(context, {double height = 1}) {
  return Container(
    height: height,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(color: PrimaryColors().grey),
  );
}

Widget myDottedDivider() {
  return const DottedLine(
    direction: Axis.horizontal,
    alignment: WrapAlignment.center,
    lineLength: double.infinity,
    lineThickness: 0.5,
    dashLength: 4.0,
    dashColor: Colors.black,
    dashGapLength: 4.0,
    dashGapColor: Colors.transparent,
  );
}

Widget textPill(String title, Color backgroundColor, Color textColor,
    Color borderColor, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 1),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: myText(title,
            fontSize: Essentials.pSize, context: context, textColor: textColor),
      ),
    ),
  );
}

Widget myCachedNetworkImage(BuildContext context,
    {url,
    double? height = 220,
    double width = double.infinity,
    bool noImageBuilder = false}) {
  return CachedNetworkImage(
    height: height,
    width: width,
    imageUrl: url,
    fit: BoxFit.contain,
    progressIndicatorBuilder: (context, url, downloadProgress) {
      return Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      );
    },
    errorWidget: (context, url, error) {
      return const Icon(Icons.error);
    },
    imageBuilder: noImageBuilder
        ? null
        : (context, imageProvider) {
            return Image(
              image: imageProvider,
              fit: BoxFit.cover,
            );
          },
  );
}

Widget CircleContainer(
  String imagePath,
  double size, {
  double stackSize = 35,
  bool stacked = false,
  String stackimagePath = '',
  double stackPadding = 4,
  double padding = 4,
  Color color = Colors.white,
}) {
  return Stack(
    children: [
      Container(
        padding: EdgeInsets.all(padding),
        margin: EdgeInsets.all(padding),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        width: size,
        height: size,
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.cover,
          placeholder: Essentials.networkPlaceHolder(),
          errorWidget: Essentials.errorPlaceHolder(),
        ),
      ),
      if (stacked)
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2),
              ),
              width: stackSize,
              height: stackSize,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: stackimagePath,
                  fit: BoxFit.cover,
                  placeholder: Essentials.networkPlaceHolder(),
                  errorWidget: Essentials.errorPlaceHolder(),
                ),
                // Image.network(
                //   stackimagePath,
                //   fit: BoxFit.cover,
                // ),
              ),
            )),
    ],
  );
}

Widget myCircleAvatar(
    Widget? widget, double size, Color bordercolor, Color? mycolor,
    {verified = false, double tickMargin = 4.0}) {
  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      ClipOval(
        child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size),
              border: Border.all(color: bordercolor),
              color: mycolor,
            ),
            child: widget),
      ),
      if (verified)
        Container(
          margin: EdgeInsets.all(tickMargin),
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Icon(
            Icons.verified,
            color: PrimaryColors().white,
            size: 16.0,
          ),
        ),
    ],
  );
}

Widget myRoundTextBtn(BuildContext context,
    {color = Colors.blue, required label, width = null, required onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      padding: const EdgeInsets.only(left: 11, right: 11, top: 4, bottom: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 1.0,
        ),
        color: color,
        borderRadius: BorderRadius.circular(50),
      ),
      child: myText(
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
        context: context,
        label,
      ),
    ),
  );
}

// myContainer(context, {child, double radius = 12, double opacity = .3}) {
//   return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(radius),
//           color: myColors.themeBlueGrey(context).withOpacity(opacity)),
//       padding: EdgeInsets.all(12),
//       child: child);
// }
