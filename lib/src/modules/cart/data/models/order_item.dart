import 'package:equatable/equatable.dart';
import 'package:online_store/src/modules/store/data/models/product.dart';

class CartItem extends Equatable {
  final int id;
  final int productId;
  final int quantity;

  const CartItem({
    required this.id,
    required this.productId,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
    };
  }

  @override
  List<Object> get props => [id, productId, quantity];
}