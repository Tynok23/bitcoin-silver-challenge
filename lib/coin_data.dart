import 'package:http/http.dart' as http;
import 'dart:convert';


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '8C301C89-03B4-45FB-928D-24CCEF5F471D';

// const bitcoinAverageURL =
//     'https://apiv2.bitcoinaverage.com/indices/global/ticker';


class CoinData {



  //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future getCoinData( String selectedCurrency) async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    // String requestURL = '$bitcoinAverageURL/BTC$selectedCurrency';
    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';

    http.Response response = await http.get(Uri.parse(requestURL));


    if (response.statusCode == 200) {

      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];

      return lastPrice;
    } else {

      print(response.statusCode);

      throw 'Problem with the get request';
    }
  }
}


//https:rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=8C301C89-03B4-45FB-928D-24CCEF5F471D