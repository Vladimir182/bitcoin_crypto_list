import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';

const String _baseUrl = 'https://min-api.cryptocompare.com';
const String _cryptoCurrencies =
    'BTC,ETH,BNB,ADA,SOL,XRP,DOT,DOGE,AVAX,LTC,LINK,BCH,XLM,UNI,LUNA,ALGO,MATIC,VET,ATOM,XTZ';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    try {
      final response = await dio.get(
        '$_baseUrl/data/pricemultifull?fsyms=$_cryptoCurrencies&tsyms=USD',
      );
      // final data = response.data as Map<String, dynamic>;
      if (response.statusCode == 200) {
        final dataRaw = response.data['RAW'] as Map<String, dynamic>;
        final cryptoCoinList =
            dataRaw.entries.map((e) {
              final dataUSD = (e.value as Map<String, dynamic>)['USD'];
              final price = dataUSD['PRICE'];
              final img = dataUSD['IMAGEURL'];
              return CryptoCoin(
                name: e.key,
                priceInUSD: price,
                image: 'https://www.cryptocompare.com/$img',
              );
            }).toList();

        return cryptoCoinList;
      } else {
        throw Exception('Помилка при отриманні даних: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Помилка: $e');
    }
  }
}
