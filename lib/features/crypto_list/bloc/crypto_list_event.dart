part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListEvent {}

final class LoadCryptoList extends CryptoListEvent {
  final Completer<void>? completer;

  LoadCryptoList([this.completer]);
}
