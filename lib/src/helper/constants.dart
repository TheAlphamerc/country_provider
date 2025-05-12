class Constants {
  /// Below are described the REST endpoints available that you can use to search for countries.
  static const String restCountriesBaseUri = "https://restcountries.com/v3.1/";
  static const String allCountrySiffixUri = "all?";
  static const String countryByName = "name/";
  static const String countryByFullname = "?fullText=true";
  static const String countryByCode = "alpha/";
  static const String countriesByListOfCodes = "alpha?codes=";
  static const String countriesByCurrencyCode = "currency/";
  static const String countriesByLanguageCode = "lang/";
  static const String countriesByCapitalCity = "capital/";
  static const String countriesByCallingCode = "callingcode/";
  static const String countriesByContinent = "region/";
  static const String countriesByRegionalBLoc = "regionalbloc/";
}
