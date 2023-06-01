import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard(
      {super.key,
      required this.name,
      required this.shopName,
      required this.price,
      required this.imgURL});

  final String name;
  final String shopName;
  final String price;
  final String imgURL;

  // ShopCard({required this.name, required this.price, required this.shopName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 170,
          padding: const EdgeInsets.all(12),
          color: Colors.grey[100],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 60,
                        child: Image.network(imgURL),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                name,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  shopName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Text('\$ ' + price.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
