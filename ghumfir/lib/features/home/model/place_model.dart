// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlaceModel {
  final int id;
  final String name;
  final String location;
  final String photo;
  PlaceModel({
    required this.id,
    required this.name,
    required this.location,
    required this.photo,
  });

  PlaceModel copyWith({
    int? id,
    String? name,
    String? location,
    String? photo,
  }) {
    return PlaceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'location': location,
      'photo': photo,
    };
  }

  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      location: map['location'] as String,
      photo: map['photo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceModel.fromJson(String source) =>
      PlaceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlaceModel(id: $id, name: $name, location: $location, photo: $photo)';
  }

  @override
  bool operator ==(covariant PlaceModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.location == location &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ location.hashCode ^ photo.hashCode;
  }
}
