import 'package:interface_coin_api/src/models/crypto_coin_model.dart';

abstract class ICoinApi {
  Future<List<CryptoCoinModel>> getCryptoCoins();
  Future<CryptoCoinModel> getCryptoCoinDetail();
}
