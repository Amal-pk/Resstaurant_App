import 'package:flutter/material.dart';
import 'package:restaurant_app/Model/resaurant_model.dart';

class Address extends StatelessWidget {
  const Address({
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
          const Icon(
            Icons.location_on,
            color: Colors.grey,
          ),
          Text(
            restaurant.address,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
