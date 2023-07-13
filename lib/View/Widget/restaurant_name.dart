import 'package:flutter/material.dart';
import 'package:restaurant_app/Model/resaurant_model.dart';

class RestaurantName extends StatelessWidget {
  const RestaurantName({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            restaurant.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(10)),
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
          )
        ],
      ),
    );
  }
}
