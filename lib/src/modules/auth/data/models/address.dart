
import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String addressDetails;
  final Location location;

  const Address({
    required this.addressDetails,
    required this.location,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressDetails: json['addressDetails'],
      location: Location.fromJson(json['location']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addressDetails': addressDetails,
      'location': location.toJson(),
    };
  }

  @override
  List<Object> get props => [addressDetails, location];
}

class Location extends Equatable {
  final double latitude;
  final double longitude;

  const Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  List<Object> get props => [latitude, longitude];
}