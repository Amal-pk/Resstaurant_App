import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/Controller/home_controller.dart';
import 'package:restaurant_app/Model/resaurant_model.dart';
import 'package:restaurant_app/View/Widget/address.dart';
import 'package:restaurant_app/View/Widget/cuisine_type.dart';
import 'package:restaurant_app/View/Widget/map.dart';
import 'package:restaurant_app/View/Widget/restaurant_name.dart';

class RestaurantDetails extends StatelessWidget {
  RestaurantDetails({super.key, required this.restaurant});
  final Restaurant restaurant;
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Visibility(
          visible: controller.restaurant.isNotEmpty,
          replacement: Center(
            child: LottieBuilder.asset("assets/image/animation_lk11xmol.json"),
          ),
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(restaurant.photograph),
                          fit: BoxFit.contain),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                      ),
                    ),
                  ),
                ],
              ),
              RestaurantName(restaurant: restaurant),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  restaurant.neighborhood.name,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              CuisineType(restaurant: restaurant),
              Address(restaurant: restaurant),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time_filled,
                      color: Colors.grey,
                    ),
                    Text(
                      "Thursday ${restaurant.operatingHours.thursday}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Raiting & Review",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    restaurant.reviews.first.rating.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              restaurant.reviews[index].name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        Text(
                          restaurant.reviews[index].comments,
                          maxLines:
                              controller.isReadMore.value == true ? 10 : 3,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                controller.readMore();
                              },
                              child: const Text(
                                "Readmore",
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text(restaurant.reviews[index].date.name)
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.black,
                    thickness: .5,
                  ),
                  itemCount: restaurant.reviews.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, right: 10),
                child: Row(
                  children: [
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        MapView.openMap(
                            restaurant.latlng.lat, restaurant.latlng.lng);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.directions),
                          Text("Go"),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
