import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
// import 'package:equatable/equatable.dart';

class CryptoCoinDetail extends CryptoCoin {
  const CryptoCoinDetail({
    required super.name,
    required super.priceInUSD,
    required super.image,
    // required this.toSymbol,
    // required this.lastUpdate,
    required this.hight24Hour,
    required this.low24Hours,
  });

  final double hight24Hour;
  final double low24Hours;

  // @override
  // List<Object?> get props => [image, price, hightPrice, lowPrice];
  @override
  List<Object?> get props => super.props..addAll([hight24Hour, low24Hours]);
}
