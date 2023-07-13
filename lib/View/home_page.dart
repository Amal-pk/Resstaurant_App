import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/Controller/home_controller.dart';
import 'package:restaurant_app/Model/resaurant_model.dart';
import 'package:restaurant_app/View/Widget/address.dart';
import 'package:restaurant_app/View/Widget/cuisine_type.dart';
import 'package:restaurant_app/View/Widget/restaurant_name.dart';
import 'package:restaurant_app/View/restaurant_details.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Restaurant",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: const [
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.restaurant.length,
          itemBuilder: (context, index) {
            final Restaurant restaurant = controller.restaurant[index];
            return InkWell(
              onTap: () {
                Get.to(() => RestaurantDetails(restaurant: restaurant,));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        restaurant.photograph,
                        fit: BoxFit.fill,
                      ),
                    ),
                    RestaurantName(restaurant: restaurant),
                    CuisineType(restaurant: restaurant),
                    Address(restaurant: restaurant)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
