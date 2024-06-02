import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../Utils/theme_helper.dart';
import '../Utils/util.dart';
import 'Essentials.dart';

class CommonWid {
  static Widget myBottomSheet(
      {required BuildContext context,
      required String header,
      required Widget child,
      double? height}) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(
          color: PrimaryColors().white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: height ?? (Essentials.height(context) * 0.9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0))),
                  ),
                ],
              ),
              Essentials.heightSpacer(Essentials.height(context) / 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  myText(header,
                      fontSize: Essentials.mSize,
                      context: context,
                      fontWeight: FontWeight.w500),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              Essentials.heightSpacer(Essentials.height(context) / 20),
              Expanded(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget myDialog(
    BuildContext context,
    String title,
    Widget myDialogWidget, {
    Widget? myContentWidget,
    TextAlign titleAlignment = TextAlign.left,
    TextAlign contentAlignment = TextAlign.left,
  }) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.blue,
      icon: Align(
        alignment: Alignment.topRight,
        child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close, color: PrimaryColors().white)),
      ),
      title: myText(
        title,
        context: context,
        fontSize: Essentials.mSize,
        fontWeight: FontWeight.w600,
        textColor: PrimaryColors().white,
        textAlign: titleAlignment,
      ),
      content: myContentWidget ?? const SizedBox.shrink(),
      actions: myDialogWidget != null ? <Widget>[myDialogWidget] : [],
    );
  }

  static Widget buildIncrement({
    required BuildContext context,
    required int incrementValue,
    required ValueChanged<int> onChanged,
    bool isOnceSelected = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        height: 48,
        width: 110,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: PrimaryColors().grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (!isOnceSelected) {
                  onChanged(incrementValue + 1);
                }
              },
              child: Icon(
                Icons.add,
                size: 15,
                color: PrimaryColors().black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: myText(
                '$incrementValue',
                context: context,
                fontSize: Essentials.rSize,
                fontWeight: FontWeight.w700,
                textColor: PrimaryColors().black,
              ),
            ),
            InkWell(
              onTap: () {
                if (!isOnceSelected && incrementValue > 0) {
                  onChanged(incrementValue - 1);
                }
              },
              child: Icon(
                Icons.remove,
                size: 15,
                color: PrimaryColors().black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget myTextField(
    String label,
    BuildContext context,
    String hinttext,
    TextEditingController controller,
    int maxline,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: myText(
            label,
            context: context,
            textColor: PrimaryColors().black,
            fontSize: Essentials.rSize,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            controller: controller,
            maxLines: maxline,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: PrimaryColors().grey),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: PrimaryColors().grey),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: hinttext,
              hintStyle: TextStyle(
                  color: PrimaryColors().grey, fontSize: Essentials.sSize),
            ),
          ),
        ),
      ],
    );
  }
}
