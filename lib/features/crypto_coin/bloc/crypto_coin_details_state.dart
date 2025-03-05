part of 'crypto_coin_details_bloc.dart';

@immutable
sealed class CryptoCoinDetailsState extends Equatable {}

class CryptoCoinDetailInitial extends CryptoCoinDetailsState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsLoading extends CryptoCoinDetailsState {
  @override
  List<Object?> get props => [];
}

class CryptoCoinDetailsLoaded extends CryptoCoinDetailsState {
  CryptoCoinDetailsLoaded({required this.coinDetails});

  final CryptoCoinDetail coinDetails;

  @override
  List<Object?> get props => [coinDetails];
}

class CryptoCoinDetailsLoadingFailure extends CryptoCoinDetailsState {
  CryptoCoinDetailsLoadingFailure({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
