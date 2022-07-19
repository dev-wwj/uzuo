import 'package:flutter/material.dart';
import '../common/gloal.dart';
export 'gloal.dart';


/**
 * TextStyle
 */
final TextStyle TextStyleTitle = TextStyle(fontSize: 16, color: Color_Text_Normal);

final TextStyle TextStyleTitleBold = TextStyle(fontSize: 17, color: Color_Text_Normal, fontWeight: FontWeight.bold);

final TextStyle TextStyleLarge = TextStyle(fontSize: 19, color: Color_Text_Normal);

final TextStyle TextStyleMediumContent = TextStyle(fontSize: 15, color: Color_Text_Content);

final TextStyle TextStyleLittleContent = TextStyle(fontSize: 14, color: Color_Text_Content);

final TextStyle TextStyleHintNormal = TextStyle(fontSize: 16, color: Color_Text_Hint);

final TextStyle TextStyleNormal = TextStyle(fontSize: 16, color: Color_Text_Hint);

final TextStyle TextStyleH5 =  TextStyle(fontSize: 32, color: Color_Text_Normal, fontWeight: FontWeight.w700);

final TextStyle TextStyleH6White =  TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.w700);

final TextStyle TextStyleH7WhiteTransparent =  TextStyle(fontSize: 41, color: Color(0x2FFFFFFF), fontWeight: FontWeight.w700);

final TextStyle TextStyle17White =  TextStyle(fontSize: 17, color: Colors.white);



/**
 * ButtonStyle
 */
final ButtonStyle TextButtonStyleNormal = ButtonStyle(overlayColor:MaterialStateProperty.all(Color_Shadow_Gray));
