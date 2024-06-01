import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';
import 'package:store_app/app/data/models/user.dart';
import 'package:store_app/public/theme/theme.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff3b02e),
        body: Column(
          children: [
            Expanded(
              flex: 2,
                child: Image.asset(
              user!.profilePhoto,
              fit: BoxFit.fill,
            )),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(25),
              decoration:  BoxDecoration(
                  color: themeVar.scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80),)),
              child: Center(
                  child: Column(
                children: [
                  Text(
                    'Name : ${user!.name}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: themeVar.colorScheme.secondary,
                        fontSize: 25),
                  ),
                  const SizedBox(height: 10,),
                   Text(
                    'Location : ${user!.location}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 179, 178, 178),
                        fontSize: 15),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    'Phone : ${user!.phone}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: themeVar.colorScheme.secondary,
                        fontSize: 20),
                  ),
                  const SizedBox(height: 10,),
                   Text(
                    'Age : ${user!.age} years Old',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 179, 178, 178),
                        fontSize: 15),
                  ),
                   const SizedBox(height: 10,),
                  Text(
                    'Gender : ${user!.gender}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: themeVar.colorScheme.secondary,
                        fontSize: 20),
                  ),
                ],
              )),
            ))
          ],
        ).animate().scale(duration: Duration(seconds: 2)));
  }
}
