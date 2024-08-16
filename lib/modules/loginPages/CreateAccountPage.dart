import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_go/shared/cubit/login_cubit/login_states.dart';
import 'package:dr_go/shared/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/cubit/login_cubit/login_cubit.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(context),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){},
        builder: (context,state){
          LoginCubit cubit = LoginCubit.get(context);
          var screenWidth = MediaQuery.of(context).size.width;
          var screenHeight = MediaQuery.of(context).size.height;
          return Scaffold(
            backgroundColor: whiteColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 70,),
                      Center(child: Text("Create Account", style: TextStyle(fontSize: 30, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w700), textAlign: TextAlign.center,)),
                      Center(child: Text("Fill your informations to create account.", style: TextStyle(fontSize: 15, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500), textAlign: TextAlign.center)),
                      SizedBox(height: 60,),
                      Text("Name", style: TextStyle(fontSize: 17, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: nameController,
                        cursorColor: semiGreyColor,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                              color: heavyGreyColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                              color: heavyGreyColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: errorColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              RegExp(r'[0-9!@#$%^&*+=/?]').hasMatch(value)) {
                            return "Please Enter Valid Name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25,),
                      Text("Email", style: TextStyle(fontSize: 17, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: emailController,
                        cursorColor: semiGreyColor,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                              color: heavyGreyColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                              color: heavyGreyColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: errorColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[^@]+@\.$')
                                  .hasMatch(value.trimRight())) {
                            return "Please Enter Valid Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25,),
                      Text("Password", style: TextStyle(fontSize: 17, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600),),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: passController,
                        cursorColor: semiGreyColor,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                              color: heavyGreyColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                              color: heavyGreyColor,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1,
                              color: errorColor,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value.length < 8) {
                            return "Please Enter More than 8 Characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              value: cubit.agree,
                              onChanged: (v){
                                  cubit.changeAgree(v!);
                                  },
                              activeColor: mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
                              ),
                              side: BorderSide(
                                color: heavyGreyColor, // Custom border color
                                width: 2.0, // Border thickness
                              ),
                            ),
                          ),
                          Text("Agree With", style: TextStyle(fontSize: 17, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500),),
                          TextButton(
                            onPressed: (){},
                            child: Text("Terms & Condition", style: TextStyle(fontSize: 17, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: mainColor),),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              overlayColor: MaterialStateProperty.all(mainColor.withOpacity(0.1)),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      MaterialButton(
                        onPressed: (){},
                        color: mainColor,
                        elevation: 0,
                        minWidth: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        child: Text("Create Account", style: TextStyle(fontFamily: "Hoves Expanded", fontWeight: FontWeight.w700, color: whiteColor, fontSize: 25),),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?", style: TextStyle(fontSize: 17, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w500),),
                          SizedBox(width: 3,),
                          TextButton(
                            onPressed: (){},
                            child: Text("Sign In", style: TextStyle(fontSize: 17, fontFamily: "Hoves Expanded", fontWeight: FontWeight.w600, color: mainColor),),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              overlayColor: MaterialStateProperty.all(mainColor.withOpacity(0.1)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
