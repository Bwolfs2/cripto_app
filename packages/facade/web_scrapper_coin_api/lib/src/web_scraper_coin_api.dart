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

    var list = <CryptoCoinModel>[];
    if (await webScraper.loadWebPage('')) {
      List<Map<String, dynamic>> elements = webScraper.getElement('table tr td', []);
      for (var i = 1; i < 110; i += 11) {
        list.add(
          CryptoCoinModel(
              name: elements[i + 1]['title'],
              value: double.parse((elements[i + 2]['title']).replaceAll(',', '').replaceAll('\$', '')),
              percent: elements[i + 3]['title'],
              postion: elements[i]['title']),
        );
        // print('$i - Postion :${elements[i]['title']} Name: ${elements[i + 1]['title']} Price: ${elements[i + 2]['title']} 24h: ${elements[i + 3]['title']} 7d: ${elements[i + 4]['title']} MarketCap: ${elements[i + 5]['title']} Volume(24): ${elements[i + 6]['title']} CirculationSuply: ${elements[i + 7]['title']} Last7Days: ${elements[i + 8]['title']}');
      }
    }
    return list;
  }
}
