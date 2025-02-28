import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.image,
  });

  final String name;
  final double priceInUSD;
  final String image;

  @override
  List<Object?> get props => [name, priceInUSD, image];
}
