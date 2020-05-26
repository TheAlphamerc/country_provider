library country_provider;

import 'dart:convert';
import 'package:country_provider/src/constants.dart';
import 'package:country_provider/src/models/country.dart';
import 'package:country_provider/src/helper/util.dart';
import 'package:http/http.dart';
export 'package:country_provider/src/models/country.dart';

class CountryProvider {

  static Client _client = Client();
  static String _baseUrl = Constants.restCounteriesBaseUri;

  /// Get all countries.
  static Future<List<Country>> getAllCountries() async {
    var response =
        await _client.get("$_baseUrl" + Constants.allCountrySiffixUri);

    if (response.statusCode == 200) {
      var countries = List<Country>.from(
          jsonDecode(response.body).map((x) => Country.fromJson(x)));
      print("Get Country sucessfull");
      return countries;
    }
    throw new Exception(
        "No country found. Please check if https://restcountries.eu is avialable.");
  }

  static Future<List<Country>> getCountriesByName(String name) async {
    if (name != null && name.isNotEmpty) {
      var response =
          await _client.get("$_baseUrl" + Constants.countryByName + name);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(
            jsonDecode(response.body).map((x) => Country.fromJson(x)));
        return countries;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      if (name == null) {
        throw Exception("Country name can not be null or empty");
      }
      return null;
    }
  }

  static Future<Country> getCountryByFullname(String name) async {
    if (name != null && name.isNotEmpty) {
      var response =
          await _client.get("$_baseUrl" + Constants.countryByName + name);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(
            jsonDecode(response.body).map((x) => Country.fromJson(x)));
        return countries.first;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Country name can not be null or empty");
    }
  }

  static Future<Country> getCountryByCode(String code) async {
    if (code != null && code.isNotEmpty) {
      var response =
          await _client.get("$_baseUrl" + Constants.countryByCode + code);

      if (response.statusCode == 200) {
        var country = Country.fromJson(jsonDecode(response.body));
        return country;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Country code can not be null or empty");
    }
  }

  static Future<List<Country>> getCountriesByListOfCodes(
      List<String> codes) async {
    if (codes != null && codes.isNotEmpty) {
      final uri = "$_baseUrl" +
          Constants.countriesByListOfCodes +
          codes.toFormattedString;
      var response = await _client.get(uri);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(jsonDecode(response.body)
            .map((x) => x != null ? Country.fromJson(x) : null));
        return countries;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Country code can not be null or empty");
    }
  }

  static Future<List<Country>> getCountryByCurrencyCode(
      String currencyCode) async {
    if (currencyCode != null && currencyCode.isNotEmpty) {
      final uri = "$_baseUrl" + Constants.countriesByCurrencyCode + currencyCode;
      var response = await _client.get(uri);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(jsonDecode(response.body)
            .map((x) => x != null ? Country.fromJson(x) : null));
        return countries;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Currency code can not be null or empty");
    }
  }

  static Future<List<Country>> getCountriesByLanguageCode(
      List<String> languageCode) async {
    if (languageCode != null && languageCode.isNotEmpty) {
      final uri = "$_baseUrl" +
          Constants.countriesByLanguageCode +
          languageCode.toFormattedString;
      var response = await _client.get(uri);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(jsonDecode(response.body)
            .map((x) => x != null ? Country.fromJson(x) : null));
        return countries;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Language code can not be null or empty");
    }
  }

  static Future<List<Country>> getCountryByCapitalCity(
      String capitalName) async {
    if (capitalName != null && capitalName.isNotEmpty) {
      final uri = "$_baseUrl" + Constants.countriesByCapitalCity + capitalName;
      var response = await _client.get(uri);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(jsonDecode(response.body)
            .map((x) => x != null ? Country.fromJson(x) : null));
        return countries;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Capital can not be null or empty");
    }
  }

  static Future<List<Country>> getCountryByCallingCode(int callingCode) async {
    if (callingCode != null && callingCode > 0) {
      final uri =
          "$_baseUrl" + Constants.countriesByCallingCode + callingCode.toString();
      var response = await _client.get(uri);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(jsonDecode(response.body)
            .map((x) => x != null ? Country.fromJson(x) : null));
        return countries;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Calling code can not be null or empty");
    }
  }

  static Future<List<Country>> getCountriesByContinent(
      String continentName) async {
    if (continentName != null && continentName.isNotEmpty) {
      final uri = "$_baseUrl" + Constants.countriesByRegionalBLoc + continentName;
      var response = await _client.get(uri);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(jsonDecode(response.body)
            .map((x) => x != null ? Country.fromJson(x) : null));
        return countries;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Continent name can not be null or empty");
    }
  }

  static Future<List<Country>> getcountryByRegionalBloc(
      String regiaonBlocName) async {
    if (regiaonBlocName != null && regiaonBlocName.isNotEmpty) {
      final uri = "$_baseUrl" + Constants.countriesByContinent + regiaonBlocName;
      var response = await _client.get(uri);

      if (response.statusCode == 200) {
        var countries = List<Country>.from(jsonDecode(response.body)
            .map((x) => x != null ? Country.fromJson(x) : null));
        return countries;
      }
      throw new Exception(
          "No country found. Please check if https://restcountries.eu is avialable.");
    } else {
      throw Exception("Region bloc name can not be null or empty");
    }
  }
}
