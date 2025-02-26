import 'package:flutter/material.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _criptoCoinsList;

  @override
  void initState() {
    _loadCriptoCoinsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
        title: Text('Crypto Currencies List'),
      ),
      body:
          (_criptoCoinsList == null)
              ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.yellow,
                  color: Colors.blue,
                ),
              )
              : ListView.separated(
                padding: EdgeInsets.only(top: 20),
                itemCount: _criptoCoinsList!.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final coinName = _criptoCoinsList![index];
                  return CryptoCoinTile(coin: coinName);
                },
              ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     setState(() {});
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  Future<void> _loadCriptoCoinsList() async {
    _criptoCoinsList = await GetIt.I<CryptoCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
