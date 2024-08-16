import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dr_go/modules/userPages/BookingsPage.dart';
import 'package:dr_go/modules/userPages/HomePage.dart';
import 'package:dr_go/shared/cubit/user_cubit/user_cubit.dart';
import 'package:dr_go/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/cubit/user_cubit/user_states.dart';

class UserLayout extends StatefulWidget {
  const UserLayout({super.key});

  @override
  State<UserLayout> createState() => _UserLayoutState();
}

class _UserLayoutState extends State<UserLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(context),
      child: BlocConsumer<UserCubit,UserStates>(
        listener: (context,state){},
        builder: (context,state){
          UserCubit cubit = UserCubit.get(context);
          var screenWidth = MediaQuery.of(context).size.width;
          var screenHeight = MediaQuery.of(context).size.height;
          return Scaffold(
            body: cubit.pages[cubit.value],
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
                itemCount: 4,
                gapWidth: 0,
                height: 70,
                shadow: BoxShadow(
                    offset: Offset(0, 0),
                    color: heavyGreyColor,
                    blurRadius: 15
                ),
                scaleFactor: 0.2,
                rightCornerRadius: 20,
                leftCornerRadius: 20,
                gapLocation: GapLocation.center,
                tabBuilder: (int index, bool isActive) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        cubit.navItemsImages[index],
                        width: 30,
                        color: isActive ? mainColor : heavyGreyColor,
                      ),
                      Text(cubit.navItemsTitles[index], style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: isActive ? FontWeight.w700 : FontWeight.w600, fontSize: 15, color: isActive ? mainColor : heavyGreyColor),),
                    ],
                  );
                },
                activeIndex: cubit.value,
                onTap: (value) => { cubit.changePage(value)}
            ),
          );
        },
      ),
    );
  }
}
