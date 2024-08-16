import 'package:dr_go/shared/style/colors.dart';
import 'package:dr_go/shared/style/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: BackButton(
          color: blackColor,
        ),
        title: Text("Notifications", style: centerTitlePage,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: heavyGreyColor, fontSize: 20),),
            SizedBox(height: 20,),
            successNotification(context),
            SizedBox(height: 20,),
            rescheduleNotification(context),
            SizedBox(height: 20,),
            cancelledNotification(context)
          ],
        ),
      ),
    );
  }
  
  Widget successNotification(context){
    return Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: heavyGreyColor,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                ),
                Center(
                    child: SvgPicture.asset("assets/icons/calender.svg", color: whiteColor, width: 40,)
                ),
                Positioned(
                    right: 20,
                    bottom: 20,
                    child: Container(
                      width: 10,
                      height: 10,
                      color: whiteColor,
                    )
                ),

                Positioned(
                    right: 15,
                    bottom: 15,
                    child: SvgPicture.asset("assets/icons/success-circle.svg", color: successColor, width: 20,)
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Appointment Success", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: blackColor, fontSize: 18),),
                    Text("1h", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500, color: heavyGreyColor, fontSize: 17),),
                  ],
                ),
                SizedBox(height: 5,),
                Expanded(child: Text("Congratulations! your appointment is confirmed. We’re looking forward to meeting with you.", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500, color: blackColor, fontSize: 15),)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rescheduleNotification(context){
    return Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: heavyGreyColor,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                ),
                Center(
                    child: SvgPicture.asset("assets/icons/calender.svg", color: whiteColor, width: 40,)
                ),
                Positioned(
                    right: 20,
                    bottom: 20,
                    child: Container(
                      width: 10,
                      height: 10,
                      color: whiteColor,
                    )
                ),

                Positioned(
                    right: 15,
                    bottom: 15,
                    child: SvgPicture.asset("assets/icons/schedule-circle.svg", color: lightGreyColor, width: 20,)
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Appointment Reschedule", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: blackColor, fontSize: 18),),
                    Text("1h", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500, color: heavyGreyColor, fontSize: 17),),
                  ],
                ),
                SizedBox(height: 5,),
                Expanded(child: Text("Your appointment reschedule to new date. Go to Appointments page to see more details!", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500, color: blackColor, fontSize: 15),)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cancelledNotification(context){
    return Container(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: heavyGreyColor,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                ),
                Center(
                    child: SvgPicture.asset("assets/icons/calender.svg", color: whiteColor, width: 40,)
                ),
                Positioned(
                    right: 20,
                    bottom: 20,
                    child: Container(
                      width: 10,
                      height: 10,
                      color: whiteColor,
                    )
                ),

                Positioned(
                    right: 15,
                    bottom: 15,
                    child: SvgPicture.asset("assets/icons/cancel-circle.svg", color: errorColor, width: 20,)
                ),
              ],
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Appointment Cancelled", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: blackColor, fontSize: 18),),
                    Text("1h", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500, color: heavyGreyColor, fontSize: 17),),
                  ],
                ),
                SizedBox(height: 5,),
                Expanded(child: Text("Your appointment is cancelled successfully. Please fell free book new appointment anytime.", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500, color: blackColor, fontSize: 15),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}