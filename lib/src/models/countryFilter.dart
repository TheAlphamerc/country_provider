part of '../country_provider_impl.dart';

class CountryFilter {
  bool isName;
  bool isCapital;
  bool isRegion;
  bool isAlpha2Code;
  bool isAlpha3Code;
  bool isDemonym;
  bool isTimeZone;
  bool isCallingCode;
  bool isBorders;
  bool isAltSpellings;
  bool isCurrency;
  bool isLanguage;
  bool isLatLong;
  bool isTranslation;
  bool isFlag;

  CountryFilter({
    this.isName = false,
    this.isCapital = false,
    this.isRegion = false,
    this.isAlpha2Code = false,
    this.isAlpha3Code = false,
    this.isDemonym = false,
    this.isTimeZone = false,
    this.isCallingCode = false,
    this.isBorders = false,
    this.isAltSpellings = false,
    this.isCurrency = false,
    this.isLanguage = false,
    this.isLatLong = false,
    this.isTranslation = false,
    this.isFlag = false,
  });
}
