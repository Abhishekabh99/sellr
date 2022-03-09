import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const min = MainAxisSize.min;
const max = MainAxisSize.max;
const mainAxisCenter = MainAxisAlignment.center;
const crossAxisCenter = CrossAxisAlignment.center;
const mainAxisStart = MainAxisAlignment.start;
const crossAxisStart = CrossAxisAlignment.start;

const circleImageUrl =
    "https://1.bp.blogspot.com/-0ZUMPsBahSo/X0vuBttwtWI/AAAAAAAAdwM/_0Nuxi-PWUsgTsLdAmGZqILPiJf7N2bdACLcBGAsYHQ/s1600/best%2Bdp%2Bfor%2Bwhatsapp%2B%25281%2529.jpg";
const imageUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc5jbpqLHAGl2Bj4PFY7wkba_pP3DsR2LlzQ&usqp=CAU";

const spaceV8 = SizedBox(height: 8);
const spaceV12 = SizedBox(height: 12);
const spaceV16 = SizedBox(height: 16);
const spaceV24 = SizedBox(height: 24);

const spaceH8 = SizedBox(width: 8);
const spaceH12 = SizedBox(width: 12);
const spaceH16 = SizedBox(width: 16);
const spaceH24 = SizedBox(width: 24);

void printLog(message) {
  if (kDebugMode) {
    print("$message");
  }
}
