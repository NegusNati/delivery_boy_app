// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../utills/dimensions.dart';

import '../../widgets/big_text.dart';
import 'app_icon.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({
    Key? key,
    required this.appIcon,
    required this.bigText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.Width20,
          top: Dimensions.Height15,
          bottom: Dimensions.Height15),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 5),color: Colors.grey.withOpacity(0.12),
            )
          ]
        ),
      child: Row(
        
        children: [appIcon,SizedBox( width: Dimensions.Width15,), bigText]),
    );
  }
}
