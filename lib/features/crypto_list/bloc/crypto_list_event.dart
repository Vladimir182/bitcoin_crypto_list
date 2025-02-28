part of 'crypto_list_bloc.dart';

@immutable
sealed class CryptoListEvent extends Equatable {}

final class LoadCryptoList extends CryptoListEvent {
  final Completer<void>? completer;

  LoadCryptoList([this.completer]);

  @override
  List<Object?> get props => [completer];
}
