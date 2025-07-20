import 'package:equatable/equatable.dart';

/// Entidade User - representa um usuário no domínio da aplicação
class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? profileImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profileImage,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        profileImage,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phone: $phone, profileImage: $profileImage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
