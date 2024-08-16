import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../style/colors.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit(this.context) : super(LoginInitialState());

  final BuildContext context;

  static LoginCubit get(context) => BlocProvider.of(context);

  bool hidden = true;
  bool agree = false;
  String gender = "";

  void changeAgree(bool newValue){
    agree = newValue;
    emit(ChangeAgreeState());
  }

  // void registerAccount(String nameController, String emailController, String passController) {
  //   emit(SignUpLoadingState());
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //       email: emailController,
  //       password: passController
  //   )
  //       .then((value) {
  //     print("User with email: ${value.user!.email} and id: ${value.user!.uid} Added Successfully");
  //     createAccount(uId: value.user!.uid, name: nameController, email: emailController);
  //     emit(SignUpSuccessfullyState());
  //     // Navigator.push(context, MaterialPageRoute(builder: (context)=> SelectPage()));
  //   }).catchError((error) {
  //     if(error.toString().contains("[firebase_auth/email-already-in-use] The email address is already in use by another account.")){
  //       showError("The email address is already in use.");
  //     }
  //     emit(LoginInitialState());
  //   });
  // }
  //
  // void createAccount(
  //     {required String uId, required String name, required String email}) {
  //   UserModel userModel = UserModel(image: gender == "male" ? "male.png" : "female.png" ,uId: uId, name: name, email: email.trimRight(), gender: gender,school: "$school");
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uId)
  //       .set(userModel.toMap())
  //       .then((value) {
  //     print("User Added");
  //     emit(SignUpDataSuccessfullyState());
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginPage()), (Route<dynamic> route) => false);
  //   }).catchError((error) {
  //     print("error: $error");
  //   });
  // }
  //
  // void loginAccount(TextEditingController emailController,TextEditingController passController){
  //   emit(LoginLoadingState());
  //   FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trimRight(),
  //       password: passController.text
  //   ).then((value)
  //   {
  //     print("user with ${value.user!.email} Signin Successfully Success");
  //     CacheHelper.putStringData(key: "uId", value: value.user!.uid);
  //     emit(LoginSuccessfullyState());
  //     Future.delayed(const Duration(seconds: 40));
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const HomeLayout()), (Route<dynamic> route) => false);
  //     emit(HomePageState());
  //   }).catchError(
  //           (error){
  //         if(error.toString() == "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted."){
  //           showError("Email or password not correct.");
  //           emit(LoginInitialState());
  //         }else if(error.toString() == "[firebase_auth/network-request-failed] Network error (such as timeout, interrupted connection or unreachable host) has occurred."){
  //           showError("Check your internet connection.");
  //           emit(LoginInitialState());
  //         }else if(error.toString() == "[firebase_auth/wrong-password] The password is invalid or the user does not have a password."){
  //           showError("Password is not correct.");
  //           emit(LoginInitialState());
  //         }else if(error.toString() == "[firebase_auth/too-many-requests] Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later."){
  //           showError("Password is not correct. You can reset it now!");
  //           emit(LoginInitialState());
  //         }
  //         print("error: $error");
  //       });
  // }
  //
  // Future<void> resetPassword(String email) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginPage()), (Route<dynamic> route) => false);
  //
  //   } catch (e) {
  //     showError("$e");
  //   }
  // }

  void showError(String text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 60,
          decoration: BoxDecoration(
              color: errorColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Error!",
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontFamily: "LeagueSpartan"),
                ),
                Text(text),
              ],
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  void changeHidden(){
    hidden = !hidden;
    emit(ChangeButtonIconState());
  }

}