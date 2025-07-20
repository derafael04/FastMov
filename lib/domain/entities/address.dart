import 'package:equatable/equatable.dart';

/// Entidade Address - representa um endereço no domínio da aplicação
class Address extends Equatable {
  final String id;
  final String street;
  final String number;
  final String? complement;
  final String neighborhood;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final bool isDefault;

  const Address({
    required this.id,
    required this.street,
    required this.number,
    this.complement,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    this.isDefault = false,
  });

  @override
  List<Object?> get props => [
        id,
        street,
        number,
        complement,
        neighborhood,
        city,
        state,
        zipCode,
        country,
        isDefault,
      ];

  /// Retorna o endereço formatado
  String get formattedAddress {
    final complementText = complement?.isNotEmpty == true ? ', $complement' : '';
    return '$street, $number$complementText - $neighborhood, $city - $state, $zipCode';
  }

  @override
  String toString() {
    return 'Address(id: $id, street: $street, number: $number, complement: $complement, neighborhood: $neighborhood, city: $city, state: $state, zipCode: $zipCode, country: $country, isDefault: $isDefault)';
  }
}
