import 'dart:io';
import 'package:talabaty_dashboard/features/add_product/data/models/review_model.dart';
import 'package:talabaty_dashboard/features/add_product/domain/entities/product_entity.dart';

/// Represents the data model for a product, including its details, image, reviews, and statistics.
class ProductModel {
  /// The name of the product.
  final String name;

  /// Unique code identifier for the product.
  final String code;

  /// Description of the product.
  final String discription;

  /// Price of the product.
  final num price;

  /// Local image file for the product (used before upload).
  final File image;

  /// Whether the product is featured or not.
  final bool isFeatured;

  /// Available amount in stock.
  final int amount;

  /// List of reviews for the product.
  final List<ReviewModel> reviews;

  /// URL of the product image (after upload).
  String? imageUrl;

  /// Number of times the product has been sold.
  num sellingCount;

  /// Average rating of the product.
  num avgRating = 0;

  /// Number of ratings the product has received.
  num ratingRount = 0;

  /// Creates a [ProductModel] with the given details.
  ProductModel({
    required this.name,
    required this.reviews,
    required this.code,
    required this.discription,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.amount,
    this.imageUrl,
    this.sellingCount = 0,
    this.avgRating = 0,
    this.ratingRount = 0,
  });

  /// Creates a [ProductModel] from a [ProductEntity].
  /// Converts each [ReviewEntity] to a [ReviewModel].
  factory ProductModel.fromEntity(ProductEntity product) {
    return ProductModel(
      name: product.name,
      reviews: product.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      code: product.code,
      discription: product.discription,
      price: product.price,
      image: product.image,
      isFeatured: product.isFeatured,
      amount: product.amount,
      imageUrl: product.imageUrl,
      avgRating: product.avgRating,
      ratingRount: product.ratingRount,
    );
  }

  /// Converts the [ProductModel] instance to a map for serialization (e.g., for Firestore).
  /// Note: The [image] field is not included as it is a local file reference.
  toMap() {
    return {
      'name': name,
      // Each review is kept as-is; consider calling toMap() on each if needed for serialization.
      'reviews': reviews.map((e) => e).toList(),
      'code': code,
      'discription': discription,
      'price': price,
      'isFeatured': isFeatured,
      'amount': amount,
      'imageUrl': imageUrl,
      'avgRating': avgRating,
      'sellingCount': sellingCount,
      'ratingRount': ratingRount,
    };
  }
}
