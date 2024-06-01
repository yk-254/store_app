import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  List<Map<String, dynamic>> formfield = [
    {
      "title": 'Name',
      "onChange": "",
      "type": [FilteringTextInputFormatter(RegExp(r'[a-zA-Zآ-ی ]'), allow: true)],
    },
    {
      "title": 'Age',
      "onChange": "",
      "type": [
        FilteringTextInputFormatter.digitsOnly,
      ]
    },
    {
      "title": "phone",
      "onChange": "",
      "type": [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
      ]
    },
    {
      "title": "Password",
      "onChange": "",
      "type": [
        FilteringTextInputFormatter.deny(''),
      ]
    },
    {
      "title": "gender",
      "onChange": "",
      "type": [FilteringTextInputFormatter.deny('1-9')]
    }
  ];
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF849CF5),
      body: Center(
        child: SingleChildScrollView(
          child: GetBuilder(
              init: RegisterController(),
              builder: (controller) {
                return Column(
                  children: [
                    Lottie.asset("assets/lotties/register.json",width: 300, height: 300,frameRate: FrameRate.max),
                    Form(
                      key: globalKey,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: formfield.length,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: formfield[i]["title"],
                                    enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: Color(0xFFE3E3E3))),
                                    focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: Color(0xFFE3E3E3))),
                                    filled: true,
                                    fillColor: Colors.white),
                                inputFormatters: formfield[i]["type"],
                                validator: (value) {
                                  if (value == '') {
                                    return "error";
                                  }
                                },
                                onChanged: (value) {
                                  formfield[i]["onChange"] = value;
                                },
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                        onTap: (() {
                          if (globalKey.currentState!.validate()) {
                            controller.registering({
                              "name": formfield[0]["onChange"],
                              "age": formfield[1]["onChange"],
                              "phone": formfield[2]["onChange"],
                              "pass": formfield[3]["onChange"],
                              "gender": formfield[4]["onChange"]
                            });
                          }
                        }),
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFF5053F1)),
                            height: 40,
                            width: Get.width / 3,
                            child: const Center(
                                child: Text(
                              'register',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            )))),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: (() {
                          Get.back();
                        }),
                        child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFF5053F1)),
                            height: 40,
                            width: Get.width / 3,
                            child: const Center(
                                child: Text(
                              'login',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            )))),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
