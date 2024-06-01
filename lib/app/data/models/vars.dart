import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_app/app/modules/home/favorites/views/favorites_view.dart';
import 'package:store_app/app/modules/home/offers/views/offers_view.dart';
import 'package:store_app/app/modules/home/profile/views/profile_view.dart';
import 'package:store_app/app/modules/home/shopingBasket/views/shoping_basket_view.dart';
import 'package:store_app/app/modules/home/store/views/store_view.dart';

var pagesIndex = 2.obs;
RxInt total = 0.obs;
List pages = [
  ProfileView(),
  ShopingBasketView(),
  StoreView(),
].obs;
var shopList = [].obs;
final box = GetStorage();
