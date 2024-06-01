import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/app/data/models/user.dart';
import 'package:store_app/public/theme/theme.dart';

import '../controllers/store_controller.dart';

class StoreView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          id: 'up',
          init: StoreController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Column(
                      children: AnimateList(
                    interval: 400.ms,
                    effects: [FadeEffect(duration: 300.ms)],
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                              child: ClipOval(
                                child: Image.asset(
                                  user!.profilePhoto,
                                  fit: BoxFit.fill,
                                ),
                              )),
                          SizedBox(width: 6),
                          Text(
                            ' hi ${user!.name}',
                            style: TextStyle(fontWeight: FontWeight.bold, color: themeVar.colorScheme.secondary),
                          ),
                          Expanded(child: SizedBox()),
                          Lottie.asset('assets/lotties/shopping.json', width: 70)
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.white,
                                ),
                                child: const SearchBar(
                                  overlayColor: MaterialStatePropertyAll(Colors.white),
                                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                                  elevation: MaterialStatePropertyAll(0),
                                  leading: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'search product',
                                  hintStyle: MaterialStatePropertyAll(TextStyle(color: Color.fromARGB(129, 0, 0, 0))),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 35,
                            // width: 65,
                            child: GradientElevatedButton(
                              onPressed: () {},
                              style: GradientElevatedButton.styleFrom(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff4cd1fd),
                                    Color(0xff3bc4fc),
                                    Color(0xff25b8fa),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              child: const Text("search"),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                        child: Image.asset(
                          'assets/images/banner.jpg',
                          fit: BoxFit.contain,
                        ),
                      ).animate().slide(duration: Duration(seconds: 2)),
                      const SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Popular Products :)',
                          style: TextStyle(fontWeight: FontWeight.bold, color: themeVar.colorScheme.secondary, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: controller.products.length,
                          // shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var onh = false.obs;
                            return InkWell(
                              onTap: () {},
                              onHover: (value) {
                                onh.value = value;
                              },
                              child: Obx(() => AnimatedContainer(
                                    duration: Duration(seconds: 1),
                                    margin: const EdgeInsets.only(right: 10),
                                    // height: 50,
                                    width: onh.value ? 150 : 130,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 140,
                                          width: double.infinity,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.amber),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.asset(
                                              'assets/images/${controller.products.elementAt(index)['photo']}.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller.products.elementAt(index)['name'],
                                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13),
                                                  ),
                                                  SizedBox(height: 3),
                                                  Text(
                                                    '${controller.products.elementAt(index)['price'].toString()}\$',
                                                    style: const TextStyle(color: Colors.lightBlue, fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controller.addProduct(index);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    gradient: const LinearGradient(
                                                      colors: [
                                                        Color(0xff4cd1fd),
                                                        Color(0xff3bc4fc),
                                                        Color(0xff25b8fa),
                                                      ],
                                                      begin: Alignment.bottomCenter,
                                                      end: Alignment.topCenter,
                                                    ),
                                                  ),
                                                  height: 25,
                                                  width: 25,
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Best selers',
                          style: TextStyle(fontWeight: FontWeight.bold, color: themeVar.colorScheme.secondary, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListView.builder(
                        itemCount: controller.selers.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                              height: 75,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/${controller.selers.elementAt(index)['photo']}.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              controller.selers.elementAt(index)['name'],
                                              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              width: 200,
                                              child: Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                softWrap: true,
                                                style: TextStyle(color: Colors.grey, fontSize: 11),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: RatingBar.builder(
                                      initialRating: controller.selers.elementAt(index)['rate'],
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 15,
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      ignoreGestures: true,
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 14,
                      )
                    ],
                  )),
                ),
              ),
            );
          }),
    );
  }
}
