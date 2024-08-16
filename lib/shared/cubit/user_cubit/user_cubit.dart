import 'package:dr_go/modules/userPages/ChatPage.dart';
import 'package:dr_go/modules/userPages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../modules/userPages/BookingsPage.dart';
import '../../../modules/userPages/HomePage.dart';
import '../../style/colors.dart';
import 'user_states.dart';

class UserCubit extends Cubit<UserStates>{
  UserCubit(this.context) : super(UserInitialState());

  final BuildContext context;

  static UserCubit get(context) => BlocProvider.of(context);

  int value = 0;

  List<String> navItemsImages = [
    "assets/icons/home-bold.svg",
    "assets/icons/calendar-bold.svg",
    "assets/icons/chat-bold.svg",
    "assets/icons/user-bold.svg"
  ];

  List<String> navItemsTitles = [
    "Home",
    "Bookings",
    "Chat",
    "Profile"
  ];

  List pages = [
    HomePage(),
    BookingsPage(),
    ChatPage(),
    ProfilePage(),
  ];

  void changePage(int newValue){
    value = newValue;
    emit(ChangedPageSuccessfullyState());
  }
}