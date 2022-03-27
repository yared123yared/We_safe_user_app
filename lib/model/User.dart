import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
class User extends Equatable {
  final String fName;
  final String phone;
  final String password;
  final String role;
  final String imageUrl;

  const User({
    required this.fName,
    required this.phone,
    required this.password,
    required this.role,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [fName, phone, password, role, imageUrl];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        fName: json['FullName'],
        phone: json['Phone'],
        password: json['Password'],
        role: json['Role'],
        imageUrl: json['Picture']);
  }

  @override
  String toString() => 'User { Phone: $phone, Fname: $fName, Role: $role }';
}
