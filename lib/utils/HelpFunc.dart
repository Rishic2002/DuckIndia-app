
import 'package:flutter/cupertino.dart';

import 'Essentials.dart';

class HelperFunctions {

  List<Map<String,dynamic>> allTags = [];

  static List<Widget> getSpacedChildren({required List<Widget> items,double space=10,bool column=false}){
    if(items.isEmpty){
      return items;
    }
    return List.generate(items.length * 2 - 1, (index) {
      if (index.isEven) {
        return items[index ~/ 2]; 
      } else {
        return  column?Essentials.heightSpacer(space):Essentials.widthSpacer(space);
      }
    });
  }


}