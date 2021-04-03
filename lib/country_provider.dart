library country_provider;

import 'dart:convert';
import 'package:country_provider/src/constants.dart';
import 'package:country_provider/src/models/country.dart';
import 'package:country_provider/src/helper/util.dart';
import 'package:http/http.dart';

import 'src/models/countryFilter.dart';
export 'src/models/countryFilter.dart';
export 'package:country_provider/src/models/country.dart';

class CountryProvider {
  static Client _client = Client();
  static String _baseUrl = Constants.restCounteriesBaseUri;

  /// Get information about countries
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> countries = await CountryProvider.getAllCountries();
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///  }
  /// }
  /// ``
  static Future<List<Country>> getAllCountries({CountryFilter filter}) async {
    var uri =
        "$_baseUrl" + Constants.allCountrySiffixUri + filter.toFormattedUri;
    print(uri);
    var response = await _client.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      var countries = List<Country>.from(
          jsonDecode(response.body).map((x) => Country.fromJson(x)));
      print("Get Country sucessfull");
      return countries;
    }
    throw new Exception(
        "No country found. Please check if https://restcountries.eu is avialable.");
  }

  /// Search by country name
  ///
  /// You can pass incomplete country name
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> result = await CountryProvider.getCountriesByName("Ameri")
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```

  static Future<List<Country>> getCountriesByName(String name,
      {CountryFilter filter}) async {
    if (name != null && name.isNotEmpty) {
      var uri =
          "$_baseUrl" + Constants.countryByName + name + filter.toFormattedUri;
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by country full name: `India`, `Cambodia`, `Canada`
  /// ```dart
  /// Future<Country> getCountry(String name){
  ///  try{
  ///    Country result = await CountryProvider.getCountryByFullname("India")?.first;
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<Country> getCountryByFullname(String name,
      {CountryFilter filter}) async {
    if (name != null && name.isNotEmpty) {
      var uri = "$_baseUrl" +
          Constants.countryByName +
          name +
          Constants.countryByFullname +
          "&&" +
          (filter.toFormattedUri != ""
              ? filter.toFormattedUri.substring(1, filter.toFormattedUri.length)
              : '');
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by list of ISO 3166-1 2-letter or 3-letter country codes: `Ind`, `Col`, `ru`
  /// ```dart
  /// Future<Country> getCountry(String name){
  ///  try{
  ///    Country result = await CountryProvider.getCountryByCode("Ind")?.first;
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<Country> getCountryByCode(String code,
      {CountryFilter filter}) async {
    if (code != null && code.isNotEmpty) {
      var uri =
          "$_baseUrl" + Constants.countryByCode + code + filter.toFormattedUri;
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by list of ISO 3166-1 2-letter or 3-letter country codes: `["Ind", "col", "ru"]`
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> result = CountryProvider.getCountriesByListOfCodes(["Ind", "col", "ru"]);
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<List<Country>> getCountriesByListOfCodes(List<String> codes,
      {CountryFilter filter}) async {
    if (codes != null && codes.isNotEmpty) {
      final uri = "$_baseUrl" +
          Constants.countriesByListOfCodes +
          codes.toFormattedString +
          "&&" +
          (filter.toFormattedUri != ""
              ? filter.toFormattedUri.substring(1, filter.toFormattedUri.length)
              : '');
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by ISO 4217 currency code: `Inr`, `Aud`, `Bmd`, `Usd`, `Eur`, `Gbp`
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> result = await CountryProvider.getCountryByCurrencyCode("Inr")
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<List<Country>> getCountryByCurrencyCode(String currencyCode,
      {CountryFilter filter}) async {
    if (currencyCode != null && currencyCode.isNotEmpty) {
      final uri = "$_baseUrl" +
          Constants.countriesByCurrencyCode +
          currencyCode +
          filter.toFormattedUri;
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by ISO 639-1 language code: `jpn`, `en`, `hin`, `ru`,
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> result = await CountryProvider.getCountriesByLanguageCode(["Hin","en",]);
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<List<Country>> getCountriesByLanguageCode(
      List<String> languageCode,
      {CountryFilter filter}) async {
    if (languageCode != null && languageCode.isNotEmpty) {
      final uri = "$_baseUrl" +
          Constants.countriesByLanguageCode +
          languageCode.toFormattedString +
          filter.toFormattedUri;
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by capital city: `Tokyo`, `Rome`, `Bankok`, `London`, `Kampla`
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> result = await CountryProvider.getCountryByCapitalCity("Delhi");
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<List<Country>> getCountryByCapitalCity(String capitalName,
      {CountryFilter filter}) async {
    if (capitalName != null && capitalName.isNotEmpty) {
      final uri = "$_baseUrl" +
          Constants.countriesByCapitalCity +
          capitalName +
          filter.toFormattedUri;

      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by calling code: `91`, `61`, `55`, `855`, `81`
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> result = await CountryProvider.getCountryByCallingCode(91);
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<List<Country>> getCountryByCallingCode(int callingCode,
      {CountryFilter filter}) async {
    if (callingCode != null && callingCode > 0) {
      final uri = "$_baseUrl" +
          Constants.countriesByCallingCode +
          callingCode.toString() +
          filter.toFormattedUri;
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by continent: `Africa`, `Americas`, `Asia`, `Europe`, `Oceania`.
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> result = await CountryProvider.getcountryByRegionalBloc("Asia");
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<List<Country>> getCountriesByContinent(String continentName,
      {CountryFilter filter}) async {
    if (continentName != null && continentName.isNotEmpty) {
      final uri = "$_baseUrl" +
          Constants.countriesByRegionalBLoc +
          continentName +
          filter.toFormattedUri;
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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

  /// Search by regional bloc: `EU`, `EFTA`, `CARICOM`, `AU`, `USAN`, `EEU`, `AL`, `ASEAN` , `CAIS`, `CEFTA` , `NAFTA` , `SAARC`.
  /// ```dart
  /// Future<List<Country>> getCountry(String name){
  ///  try{
  ///    List<Country> result = await CountryProvider.getCountriesByContinent("ASEAN");
  ///    return result;
  ///   } catch(error) {
  ///    print(error);
  ///    return null;
  ///  }
  /// }
  /// ```
  static Future<List<Country>> getcountryByRegionalBloc(String regiaonBlocName,
      {CountryFilter filter}) async {
    if (regiaonBlocName != null && regiaonBlocName.isNotEmpty) {
      final uri = "$_baseUrl" +
          Constants.countriesByContinent +
          regiaonBlocName +
          filter.toFormattedUri;
      print(uri);
      var response = await _client.get(Uri.parse(uri));

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
