
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../../register/views/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isObscure = true.obs;
  final formGlobalKey = GlobalKey<FormState>();
  late var dataa;
  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 26,
                  ),
                  Lottie.asset("assets/lotties/login.json", height: 300),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                    // padding: const EdgeInsets.only(top: 11, left: 15, right: 15),
                    child: TextFormField(
                      validator: (phone) {
                        if (phone == null) {
                          return "error";
                        } else if (phone.length < 11 || phone.length > 11) {
                          return 'that is wrong';
                        }
                        
                      },
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: phoneController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFF849CF5),
                        ),
                        hintText: 'phone',
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Color(0xFFE3E3E3))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Color(0xFFE3E3E3))),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        fillColor: Color(0xFFE3EAFD),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    // padding: const EdgeInsets.only(top: 11, left: 15, right: 15),
                    child: Obx(() => TextFormField(
                          validator: (password) {
                            if (password == null) {
                              return 'error';
                            } else if (password.length <= 4) {
                              return 'please enter more than 4 charactor';
                            }
                          },
                          controller: passwordController,
                          obscureText: isObscure.value,
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                              onPressed: (() {
                                isObscure.value = !isObscure.value;
                              }),
                              icon: Icon(
                                isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: const Color(0xFF5053F1),
                              ),
                            ),
                            hintText: 'password',
                            filled: true,
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Color(0xFFE3E3E3))),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Color(0xFFE3E3E3))),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            fillColor: const Color(0xFFE3EAFD),
                          ),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 11, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            print('fff');
                          },
                          child: const Text(
                            'forgot password?',
                            style: TextStyle(color: Color(0xFF5053F1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 50, right: 50),
                    child: InkWell(
                      onTap: (()  {
                        
                      }),
                      child: Container(
                        child: const Center(
                          child: Text(
                            'login',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFF5053F1)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 50, right: 50),
                    child: InkWell(
                      onTap: (() {
                        Get.to( RegisterView());
                      }),
                      child: Container(
                        child: const Center(
                          child: Text(
                            ' register :)',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xFF849CF5)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
