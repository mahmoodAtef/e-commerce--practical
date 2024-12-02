import 'package:equatable/equatable.dart';
import 'package:online_store/src/modules/cart/data/models/cart.dart';

class Order extends Equatable {
  final int id;
  final Cart cart;
  final  OrderStatus status;
  final DateTime orderDate;

 const Order({
    required this.id,
    required this.cart,
    required this.status,
    required this.orderDate
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      cart: Cart.fromJson(json['cart']),
      status: json['status'],
      orderDate: json['order_date']
    );
  }

  @override
  List<Object?> get props => [
    id,
    cart,
    status,
    orderDate
  ];
}
enum OrderStatus {
  pending,
  delivering,
  delivered,
  canceled,
}