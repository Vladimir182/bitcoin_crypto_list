import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/model/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _criptoCoinsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
        title: Text('Crypto Currencies List'),
      ),
      body:
          (_criptoCoinsList == null)
              ? SizedBox()
              : ListView.separated(
                itemCount: _criptoCoinsList!.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final coinName = _criptoCoinsList![index];
                  return CryptoCoinTile(coin: coinName);
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _criptoCoinsList = await CryptoCoinsRepository().getCoinsList();
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
