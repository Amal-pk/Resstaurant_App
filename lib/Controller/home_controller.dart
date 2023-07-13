import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:restaurant_app/Constant/costant.dart';
import 'package:restaurant_app/Model/resaurant_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    log("HomePage");
    restaurants();
    super.onInit();
  }

  RxBool isReadmore = false.obs;
  RxList<Restaurant> restaurant = <Restaurant>[].obs;
  restaurants() async {
    var url = api;

    try {
      var resp = await get(
        Uri.parse(url),
      );
      var restaurantModel = RestaurantModel.fromJson(jsonDecode(resp.body));
      restaurant.clear();
      restaurant.addAll(restaurantModel.restaurants);
      update();
    } catch (e) {
      print(e.toString());
    } finally {
      // isLoading.value = false;
    }
    update();

    update();
  }
}
