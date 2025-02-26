import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/model/crypto_coin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD',
    );
    // final data = response.data as Map<String, dynamic>;
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
  }
}
