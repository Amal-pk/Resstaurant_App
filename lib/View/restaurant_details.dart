import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/Controller/home_controller.dart';
import 'package:restaurant_app/Model/resaurant_model.dart';
import 'package:restaurant_app/View/Widget/address.dart';
import 'package:restaurant_app/View/Widget/cuisine_type.dart';
import 'package:restaurant_app/View/Widget/restaurant_name.dart';

class RestaurantDetails extends StatelessWidget {
  RestaurantDetails({super.key, required this.restaurant});
  final Restaurant restaurant;
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.network(restaurant.photograph),
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
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
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
                      maxLines: controller.isReadmore.value == true ? 10 : 3,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              controller.isReadmore.value =
                                  !controller.isReadmore.value;
                            },
                            child: const Text(
                              "Readmore",
                              style: TextStyle(
                                color: Colors.grey,
                                decoration: TextDecoration.underline,
                              ),
                            ))
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black,
                thickness: .5,
              ),
              itemCount: restaurant.reviews.length,
            ),
          )
        ],
      ),
    );
  }
}
