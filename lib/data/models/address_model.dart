import '../../domain/entities/address.dart';

/// Model para Address - responsável pela serialização/deserialização
class AddressModel extends Address {
  const AddressModel({
    required super.id,
    required super.street,
    required super.number,
    super.complement,
    required super.neighborhood,
    required super.city,
    required super.state,
    required super.zipCode,
    required super.country,
    super.isDefault = false,
  });

  /// Cria AddressModel a partir de JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as String,
      street: json['street'] as String,
      number: json['number'] as String,
      complement: json['complement'] as String?,
      neighborhood: json['neighborhood'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zip_code'] as String,
      country: json['country'] as String,
      isDefault: json['is_default'] as bool? ?? false,
    );
  }

  /// Converte AddressModel para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'number': number,
      'complement': complement,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'country': country,
      'is_default': isDefault,
    };
  }

  /// Cria AddressModel a partir de Address entity
  factory AddressModel.fromEntity(Address address) {
    return AddressModel(
      id: address.id,
      street: address.street,
      number: address.number,
      complement: address.complement,
      neighborhood: address.neighborhood,
      city: address.city,
      state: address.state,
      zipCode: address.zipCode,
      country: address.country,
      isDefault: address.isDefault,
    );
  }

  /// Converte para Address entity
  Address toEntity() {
    return Address(
      id: id,
      street: street,
      number: number,
      complement: complement,
      neighborhood: neighborhood,
      city: city,
      state: state,
      zipCode: zipCode,
      country: country,
      isDefault: isDefault,
    );
  }

  /// Cria uma cópia com campos alterados
  AddressModel copyWith({
    String? id,
    String? street,
    String? number,
    String? complement,
    String? neighborhood,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      street: street ?? this.street,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
