import 'package:flutter/material.dart';
import 'package:restaurant_app/Model/resaurant_model.dart';

class CuisineType extends StatelessWidget {
  const CuisineType({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 11,
            backgroundColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Center(
                child: FittedBox(
                  child: Icon(
                    Icons.restaurant_menu_outlined,
                    color: Colors.grey[100],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            restaurant.cuisineType,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
