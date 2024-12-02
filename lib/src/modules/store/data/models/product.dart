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








enum OrderStatus { pending, delivering, delivered }

class Order extends Equatable {
  final Cart cart;
  final OrderStatus status;

  const Order({
    required this.cart,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      cart: Cart.fromJson(json['cart']),
      status: OrderStatus.values.firstWhere((e) => e.toString() == 'OrderStatus.${json['status']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cart': cart.toJson(),
      'status': status.toString().split('.').last,
    };
  }

  @override
  List<Object> get props => [cart, status];
}


class Cart extends Equatable {
  final int id;
  final int userId;
  final List<CartItem> items;
  final double totalPrice;

  const Cart({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalPrice,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      items: List<CartItem>.from(json['items'].map((x) => CartItem.fromJson(x))),
      totalPrice: json['totalPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'items': List<dynamic>.from(items.map((x) => x.toJson())),
      'totalPrice': totalPrice,
    };
  }

  @override
  List<Object> get props => [id, userId, items, totalPrice];
}