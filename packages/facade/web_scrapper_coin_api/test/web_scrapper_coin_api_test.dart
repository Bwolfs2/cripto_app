import 'package:flutter_test/flutter_test.dart';
import 'package:web_scrapper_coin_api/src/web_scraper_coin_api.dart';

void main() {
  test('adds one to input values', () async {
    final webScraperCoinApi = WebScraperCoinApi();
    var list = await webScraperCoinApi.getCryptoCoins();
    expect(list.length, greaterThanOrEqualTo(10));
  });
}
