import 'package:interface_coin_api/src/models/crypto_coin_model.dart';
import 'package:interface_coin_api/interface_coin_api.dart';
import 'package:web_scraper/web_scraper.dart';

class WebScraperCoinApi extends ICoinApi {
  @override
  Future<CryptoCoinModel> getCryptoCoinDetail() {
    throw UnimplementedError();
  }

  @override
  Future<List<CryptoCoinModel>> getCryptoCoins() async {
    final webScraper = WebScraper('https://coinmarketcap.com/');
    if (await webScraper.loadWebPage('')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('body', ['table']);
      print(elements);
    }

    return [];
  }
}
