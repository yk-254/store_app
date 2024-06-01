import 'package:get/get.dart';
import 'package:store_app/app/modules/home/views/home_view.dart';
import 'package:store_app/app/modules/login/bindings/login_binding.dart';
import 'package:store_app/app/modules/login/view/login_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/favorites/bindings/favorites_binding.dart';
import '../modules/home/favorites/views/favorites_view.dart';
import '../modules/home/offers/bindings/offers_binding.dart';
import '../modules/home/offers/views/offers_view.dart';
import '../modules/home/profile/bindings/profile_binding.dart';
import '../modules/home/profile/views/profile_view.dart';
import '../modules/home/shopingBasket/bindings/shoping_basket_binding.dart';
import '../modules/home/shopingBasket/views/shoping_basket_view.dart';
import '../modules/home/store/bindings/store_binding.dart';
import '../modules/home/store/views/store_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
        GetPage(
          name: _Paths.FAVORITES,
          page: () => const FavoritesView(),
          binding: FavoritesBinding(),
        ),
        GetPage(
          name: _Paths.OFFERS,
          page: () => const OffersView(),
          binding: OffersBinding(),
        ),
        GetPage(
          name: _Paths.SHOPING_BASKET,
          page: () => const ShopingBasketView(),
          binding: ShopingBasketBinding(),
        ),
        GetPage(
          name: _Paths.STORE,
          page: () => StoreView(),
          binding: StoreBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () =>  RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
