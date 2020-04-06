import 'package:flutter/material.dart';

enum QuantityType { Grams, KiloGrams, Liters, Piece }

class GroceryItem {
  final String title;
  final String brand;
  final String moreInfo;
  final String quantity;
  final QuantityType quantityType;

  GroceryItem({
    @required this.title,
    this.brand,
    this.moreInfo,
    this.quantity,
    this.quantityType: QuantityType.Grams,
  });

  String get quantitySuffix => quantityType == QuantityType.Grams
      ? 'g'
      : quantityType == QuantityType.KiloGrams
          ? 'kg'
          : quantityType == QuantityType.Liters ? 'L' : '';
}
