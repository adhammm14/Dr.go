import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../shared/style/colors.dart';
import 'NotificationsPage.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({super.key});

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
          child: Text("Bookings", style: TextStyle(fontFamily: "Hoves", fontWeight: FontWeight.w700, fontSize: 28),),
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
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 100),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Your appointment is coming after", style: TextStyle(fontFamily: "Hoves", fontWeight: FontWeight.w600, fontSize: 14, color: whiteColor)),
                        Text("2 Days", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w700, fontSize: 50, color: whiteColor)),
                      ],
                    ),
                  ),
                  Positioned(
                    left: -50,
                      bottom: -55,
                      child: SvgPicture.asset("assets/icons/alarm.svg", color: whiteColor, width: 200,)
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("Upcoming", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: heavyGreyColor, fontSize: 20),),
            SizedBox(height: 20,),
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: lightGreyColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: mainColor,
                          child: Center(
                              child: SvgPicture.asset("assets/icons/calender.svg", color: whiteColor, width: 40,)
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/calender.svg"),
                                SizedBox(width: 10,),
                                Text("Monday 12th Aug", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: blackColor, fontSize: 17),),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/circle-outline.svg"),
                                SizedBox(width: 10,),
                                Text("6:00 pm", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: blackColor, fontSize: 17),),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/map-linear.svg"),
                                SizedBox(width: 10,),
                                Text("El-Safa Street - Dist..", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: blackColor, fontSize: 17),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: (){},
                            color: heavyGreyColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Text("View", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w700, color: whiteColor, fontSize: 20),),
                          ),
                          MaterialButton(
                            onPressed: (){},
                            color: errorColor,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Text("Cancel", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w700, color: whiteColor, fontSize: 20),),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
