part of 'crypto_coin_details_bloc.dart';

@immutable
sealed class CryptoCoinDetailsEvent extends Equatable {}

class LoadCryptoCoinDetails extends CryptoCoinDetailsEvent {
  LoadCryptoCoinDetails({required this.currencyCode});

  final String currencyCode;

  @override
  List<Object> get props => [currencyCode];
}
// Старий підхід створення
// @immutable
// abstract class CryptoCoinDetailsEvent extends Equatable {
//   const CryptoCoinDetailsEvent();

//   @override
//   List<Object> get props => [];
// }

// class LoadCryptoCoinDetails extends CryptoCoinDetailsEvent {
//   const LoadCryptoCoinDetails({required this.currencyCode});

//   final String currencyCode;

//   @override
//   List<Object> get props => super.props..add(currencyCode);
// }
