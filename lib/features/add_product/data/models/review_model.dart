import 'package:talabaty_dashboard/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String productName;
  final String image;
  final int rating;
  final String date;
  final String reviewDescrition;

  ReviewModel({
    required this.productName,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescrition,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      productName: reviewEntity.productName,
      image: reviewEntity.image,
      rating: reviewEntity.rating,
      date: reviewEntity.date,
      reviewDescrition: reviewEntity.reviewDescrition,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      productName: json['productName'],
      image: json['image'],
      rating: json['rating'],
      date: json['date'],
      reviewDescrition: json['reviewDescrition'],
    );
  }

  toJson() => {
    'productName': productName,
    'image': image,
    'rating': rating,
    'date': date,
    'reviewDescrition': reviewDescrition,
  };
}
