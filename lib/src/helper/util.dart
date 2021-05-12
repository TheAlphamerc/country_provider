import 'package:country_provider/src/country_provider_impl.dart';

extension formattedString on List<String> {
  String? get toFormattedString {
    String? formattedText;
    this.forEach((val) {
      formattedText =
          formattedText == null ? val + ';' : formattedText! + val + ";";
    });
    return formattedText;
  }
}

extension formatFilterUri on CountryFilter? {
  String get toFormattedUri {
    if (this == null) {
      return '';
    }
    String uri = "?fields=";
    if (this!.isName) {
      uri = uri + "name;";
    }
    if (this!.isCapital) {
      uri = uri + "capital;";
    }
    if (this!.isAltSpellings) {
      uri = uri + "altSpellings;";
    }
    if (this!.isAlpha2Code) {
      uri = uri + "alpha2Code;";
    }
    if (this!.isAlpha3Code) {
      uri = uri + "alpha3Code;";
    }
    if (this!.isCallingCode) {
      uri = uri + "callingCodes;";
    }
    if (this!.isRegion) {
      uri = uri + "region;";
    }
    if (this!.isDemonym) {
      uri = uri + "demonym;";
    }
    if (this!.isTimeZone) {
      uri = uri + "timezones;";
    }
    if (this!.isBorders) {
      uri = uri + "borders;";
    }
    if (this!.isCurrency) {
      uri = uri + "currencies;";
    }
    if (this!.isLanguage) {
      uri = uri + "languages;";
    }
    if (this!.isLatLong) {
      uri = uri + "latlng;";
    }
    if (this!.isTranslation) {
      uri = uri + "translations;";
    }
    if (this!.isFlag) {
      uri = uri + "flag;";
    }
    return uri;
  }
}
