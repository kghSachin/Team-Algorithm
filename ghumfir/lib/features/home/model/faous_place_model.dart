// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class FamousPlaceModel {
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final int rating;
  final String review;
  final List<String> photo;
  FamousPlaceModel({
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.review,
    required this.photo,
  });

  FamousPlaceModel copyWith({
    String? name,
    String? description,
    double? latitude,
    double? longitude,
    int? rating,
    String? review,
    List<String>? photo,
  }) {
    return FamousPlaceModel(
      name: name ?? this.name,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'rating': rating,
      'review': review,
      'photo': photo,
    };
  }

  factory FamousPlaceModel.fromMap(Map<String, dynamic> map) {
    return FamousPlaceModel(
      name: map['name'] as String,
      description: map['description'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      rating: map['rating'] as int,
      review: map['review'] as String,
      photo: List<String>.from(
        (map['photo'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FamousPlaceModel.fromJson(String source) =>
      FamousPlaceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FamousPlaceModel(name: $name, description: $description, latitude: $latitude, longitude: $longitude, rating: $rating, review: $review, photo: $photo)';
  }

  @override
  bool operator ==(covariant FamousPlaceModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.name == name &&
        other.description == description &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.rating == rating &&
        other.review == review &&
        listEquals(other.photo, photo);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        rating.hashCode ^
        review.hashCode ^
        photo.hashCode;
  }
}
