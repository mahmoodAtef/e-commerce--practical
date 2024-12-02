import 'package:equatable/equatable.dart';
import 'package:online_store/src/modules/cart/data/models/order_item.dart';


class Product extends Equatable {
  final String name;
  final String description;
  final double price;
  final double afterDiscountPrice;
  final int categoryId;
  final List<String> images;
  final int stockQuantity;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.afterDiscountPrice,
    required this.categoryId,
    required this.images,
    required this.stockQuantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      afterDiscountPrice: json['afterDiscountPrice'].toDouble(),
      categoryId: json['categoryId'],
      images: List<String>.from(json['images']),
      stockQuantity: json['stockQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'afterDiscountPrice': afterDiscountPrice,
      'categoryId': categoryId,
      'images': images,
      'stockQuantity': stockQuantity,
    };
  }

  @override
  List<Object> get props => [name, description, price, afterDiscountPrice, categoryId, images, stockQuantity];
}


