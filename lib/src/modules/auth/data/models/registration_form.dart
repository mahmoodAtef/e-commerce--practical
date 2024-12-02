import 'package:equatable/equatable.dart';

class RegistrationForm extends Equatable {
  final String email;
  final String password;
  final String name;

  const RegistrationForm({
    required this.email,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'name': name,
  };

  @override
  List<Object?> get props => [email, password, name];
}