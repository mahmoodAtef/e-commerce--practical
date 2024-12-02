import 'package:online_store/src/modules/cart/data/models/order_item.dart';

class Cart {
   List<CartItem> items;
   late double total;

  Cart({required this.items}) {
    total = 0;

    // for (var item in items) {
    //   total += item.product.price * item.quantity;
    // }
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      items: List<CartItem>.from(json['items'].map((x) => CartItem.fromJson(x))),
    );
  }
}