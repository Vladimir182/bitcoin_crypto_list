import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.onPrimaryFixedVariant,
        title: Text('Crypto Currencies List'),
      ),
      body: BlocBuilder<CryptoListBloc, CryptoListState>(
        bloc: _cryptoListBloc,
        builder: (context, state) {
          if (state is CryptoListLoaded) {
            return ListView.separated(
              padding: EdgeInsets.only(top: 20),
              itemCount: state.coinsList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final coinName = state.coinsList[index];
                return CryptoCoinTile(coin: coinName);
              },
            );
          }
          if (state is CryptoListLoadingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong', style: TextStyle(fontSize: 26)),
                  Text(
                    'Please try ageing later',
                    style: TextStyle(color: Colors.white38, fontSize: 20),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.yellow,
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
