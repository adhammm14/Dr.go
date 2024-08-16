import 'package:dr_go/modules/userPages/NotificationsPage.dart';
import 'package:dr_go/shared/style/colors.dart';
import 'package:dr_go/shared/style/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: Text("Home", style: leftTitlePage,),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: mainColor
              ),
            ),
            SizedBox(height: 20,),
            Text("Upcoming Booking", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: blackColor, fontSize: 20),),
            SizedBox(height: 20,),
            Text("You don’t have any upcoming bookings. Book one now!", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500, color: blackColor, fontSize: 20),textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Center(
              child: MaterialButton(
                onPressed: (){},
                color: mainColor,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Text("Book Now!", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w700, color: whiteColor, fontSize: 20),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
