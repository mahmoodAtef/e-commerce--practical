import 'package:equatable/equatable.dart';
import 'package:online_store/src/modules/auth/data/models/address.dart';
import 'package:online_store/src/modules/cart/data/models/order_item.dart';
import 'package:online_store/src/modules/store/data/models/product.dart';

enum UserRole { admin, customer, merchant }

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String profilePicture;
  final List<Address> addresses;
  final List<Product> wishlist;
  final List<CartItem> cart;
  final List<Order> orders;
  final UserRole role;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.profilePicture,
    required this.addresses,
    required this.wishlist,
    required this.cart,
    required this.orders,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      profilePicture: json['profilePicture'],
      addresses: List<Address>.from(json['addresses'].map((x) => Address.fromJson(x))),
      wishlist: List<Product>.from(json['wishlist'].map((x) => Product.fromJson(x))),
      cart: List<CartItem>.from(json['cart'].map((x) => CartItem.fromJson(x))),
      orders: List<Order>.from(json['orders'].map((x) => Order.fromJson(x))),
      role: UserRole.values.firstWhere((e) => e.toString() == 'UserRole.${json['role']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'profilePicture': profilePicture,
      'addresses': List<dynamic>.from(addresses.map((x) => x.toJson())),
      'wishlist': List<dynamic>.from(wishlist.map((x) => x.toJson())),
      'cart': List<dynamic>.from(cart.map((x) => x.toJson())),
      'orders': List<dynamic>.from(orders.map((x) => x.toJson())),
      'role': role.toString().split('.').last,
    };
  }

  @override
  List<Object> get props => [id, name, email, phone, role];
}