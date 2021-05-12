class Constants {
  /// Below are described the REST endpoints available that you can use to search for countries.
  static String restCounteriesBaseUri = "https://restcountries.eu/rest/v2/";
  static String allCountrySiffixUri = "all?";
  static String countryByName = "name/";
  static String countryByFullname = "?fullText=true";
  static String countryByCode = "alpha/";
  static String countriesByListOfCodes = "alpha?codes=";
  static String countriesByCurrencyCode = "currency/";
  static String countriesByLanguageCode = "lang/";
  static String countriesByCapitalCity = "capital/";
  static String countriesByCallingCode = "callingcode/";
  static String countriesByContinent = "region/";
  static String countriesByRegionalBLoc = "regionalbloc/";
}
