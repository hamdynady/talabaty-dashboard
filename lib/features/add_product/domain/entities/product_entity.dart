import 'dart:io';
import 'package:talabaty_dashboard/features/add_product/domain/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String discription;
  final num price;
  final File image;
  final bool isFeatured;
  final int amount;
  final List<ReviewEntity> reviews;
  num avgRating = 0;
  num ratingRount = 0;
  String? imageUrl;

  ProductEntity({
    required this.name,
    required this.reviews,
    required this.code,
    required this.discription,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.amount,
    this.imageUrl,
    this.avgRating = 0,
    this.ratingRount = 0,
  });
}
