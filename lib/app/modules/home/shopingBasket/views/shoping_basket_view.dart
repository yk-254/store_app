import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gradient_elevated_button/gradient_elevated_button.dart';
import 'package:store_app/app/data/models/vars.dart';
import 'package:store_app/public/theme/theme.dart';

import '../controllers/shoping_basket_controller.dart';

class ShopingBasketView extends GetView {
  const ShopingBasketView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Shopping Basket',
            style: TextStyle(fontWeight: FontWeight.bold, color: themeVar.colorScheme.secondary),
          ),
          centerTitle: true,
          backgroundColor: themeVar.scaffoldBackgroundColor,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: GetBuilder(
              id: 'shopBasket',
              init: ShopingBasketController(),
              builder: (controller) {
                return Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: shopList.length,
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), offset: Offset(0, 3), blurRadius: 5, spreadRadius: 2, blurStyle: BlurStyle.normal)],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.amber),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/${shopList.elementAt(index)['photo']}.jpg',
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    shopList.elementAt(index)['name'],
                                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 13),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '${shopList.elementAt(index)['price'].toString()}\$',
                                    style: const TextStyle(color: Colors.lightBlue, fontSize: 11),
                                  ),
                                  SizedBox(height: 5),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 11),
                                child: Row(
                                  children: [
                                    button(() {
                                      if (shopList.elementAt(index)['orders'].value > 0) {
                                        shopList.elementAt(index)['orders'].value--;
                                        total.value-= (shopList.elementAt(index)['price'].value) as int;
                                      }  if (shopList.elementAt(index)['orders'].value == 0) {
                                        shopList.removeAt(index);
                                      }
                                      controller.update(['shopBasket']);
                                    }, Icons.minimize),
                                    SizedBox(width: 3),
                                    Text(
                                      '${shopList.elementAt(index)['orders'].value.toString()}',
                                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                                    ),
                                    SizedBox(width: 3),
                                    button(() {
                                      shopList.elementAt(index)['orders'].value++;
                                      total.value += (shopList.elementAt(index)['price'].value) as int;
                                      controller.update(['shopBasket']);
                                    }, Icons.add)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  shopList.removeAt(index);
                                  controller.update(['shopBasket']);
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xff4cd1fd),
                                          Color(0xff3bc4fc),
                                          Color(0xff25b8fa),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(
                                    Icons.delete_sharp,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      height: Get.height / 8.5,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total', style: TextStyle(fontWeight: FontWeight.bold, color: themeVar.colorScheme.secondary, fontSize: 16)),
                              Text('${total.value}\$', style: const TextStyle(color: Colors.lightBlue, fontSize: 16)),
                            ],
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
                              child: const Text("Checkout"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        ));
  }

  InkWell button(ontap, icon) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
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
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}
