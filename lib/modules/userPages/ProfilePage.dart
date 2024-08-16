import 'package:dr_go/modules/userPages/NotificationsPage.dart';
import 'package:dr_go/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../shared/style/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text("Profile", style: leftTitlePage,),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                  context,
                  PageTransition(
                      child: NotificationsPage(),
                      type: PageTransitionType.rightToLeft
                  ));
            },
            icon: SvgPicture.asset("assets/icons/bell.svg", color: mainColor, width: 35,),
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: Column(),
    );
  }
}
