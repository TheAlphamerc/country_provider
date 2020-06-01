# country_provider Flutter Plugin ![Twitter URL](https://img.shields.io/twitter/url?style=social&url=https%3A%2F%2Ftwitter.com%2Fthealphamerc) [![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/country_provider?style=social)](https://github.com/login?return_to=%2FTheAlphamerc%country_provider)  ![GitHub forks](https://img.shields.io/github/forks/TheAlphamerc/country_provider?style=social) 

[![pub package](https://img.shields.io/pub/v/country_provider?color=blue)](https://pub.dev/packages/country_provider)  ![GitHub last commit](https://img.shields.io/github/last-commit/Thealphamerc/country_provider) ![GitHub pull requests](https://img.shields.io/github/issues-pr/TheAlphamerc/country_provider) ![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/Thealphamerc/country_provider)   ![GitHub issues](https://img.shields.io/github/issues-raw/Thealphamerc/country_provider) ![GitHub closed issues](https://img.shields.io/github/issues-closed-raw/thealphamerc/country_provider) [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/Thealphamerc/country_provider) 


Country Provider is a flutter library wrapper around the API provided by REST Countries https://restcountries.eu (Get information about countries via a RESTful API)


## Download App ![GitHub All Releases](https://img.shields.io/github/downloads/Thealphamerc/country_provider/total?color=green)
<a href="https://github.com/TheAlphamerc/country_provider/releases/download/v1.0.1/app-release.apk"><img src="https://playerzon.com/asset/download.png" width="200"></img></a>

## Getting Started
### 1. Add library to your pubspec.yaml

```yaml

dependencies:
  country_provider: ^0.0.1

```

### 2. Import library in dart file

```dart
import 'package:country_provider/country_provider.dart';
```

## Note

Each method return a `List` of [`Country`](https://github.com/TheAlphamerc/country_provider/blob/master/lib/src/models/country.dart).

## Usage

- Get all countries.

```dart
// Get all countries
List<Country> countries = await CountryProvider.getAllCountries();
```

- Search by country name. It can be the native name or partial name.

```dart
// Search by country name
List<Country> result = await CountryProvider.getCountriesByName("Ameri");
```

If partial name, this method could return a list of countries. Else a List of one element.

- Search by country full name.

```dart
// Search by country full name
Country result = await CountryProvider.getCountryByFullname("India")?.first;
```

-  Search by ISO 3166-1 2-letter or 3-letter country code.

```dart
// Search by list of ISO 3166-1 2-letter or 3-letter country codes
Country result = await CountryProvider.getCountryByCode("Ind")?.first;
```

-  Search by list of ISO 3166-1 2-letter or 3-letter country codes.

```dart
// Search by list of ISO 3166-1 2-letter or 3-letter country codes
List<Country> result = CountryProvider.getCountriesByListOfCodes(["Ind", "col", "ru"]);
```

- Search by ISO 4217 currency code.

```dart
// Search by ISO 4217 currency code
List<Country> result = await CountryProvider.getCountryByCurrencyCode("Inr")
```

- Search by ISO 639-1 language code.

```dart
// Search by ISO 639-1 language code
List<Country> result = await CountryProvider.getCountriesByLanguageCode(["Hin","en",]);
```

-  Search by capital city.

```csharp
// Search by capital city
var result = await CountryProvider.getCountryByCapitalCity("Delhi");
```

You can use `var` instead of explicit types. I use explicit types to show you the return type of each method.

- Search by calling code.

```dart
// Search by calling code
List<Country> result = await CountryProvider.getCountryByCallingCode(91);
```

-  Search by continent: Africa, Americas, Asia, Europe, Oceania.

```dart
//  Search by continent: Africa, Americas, Asia, Europe, Oceania
List<Country> result = await CountryProvider.getcountryByRegionalBloc("Asia");
```

- Search by regional bloc: EU, EFTA, CARICOM, AU, USAN, EEU, AL, ASEAN , CAIS, CEFTA , NAFTA , SAARC.

```dart
//  Search by regional bloc
List<Country> result = await CountryProvider.getCountriesByContinent("ASEAN");
```

**EU** (European Union), **EFTA** (European Free Trade Association), **CARICOM** (Caribbean Community), **PA** (Pacific Alliance), **AU** (African Union), **USAN** (Union of South American Nations), **EEU** (Eurasian Economic Union), **AL** (Arab League), **ASEAN** (Association of Southeast Asian Nations), **CAIS** (Central American Integration System), **CEFTA** (Central European Free Trade Agreement), **NAFTA** (North American Free Trade Agreement), **SAARC** (South Asian Association for Regional Cooperation).

## Apply filters

To get filtered country data pass [CountryFilter](https://github.com/TheAlphamerc/country_provider/blob/master/lib/src/models/countryFilter.dart) model as argument in search countries method.

```dart
// Get all countries name only 
var countries = await CountryProvider.getAllCountries(filter: CountryFilter(isName: true));
List<string> countriesInSpanish = countries.map((e) => e.name).toList();

// Get all countries name only in Spanish
var countries = await CountryProvider.getAllCountries(filter: CountryFilter(isName: true));
List<string> countriesInSpanish = countries.map((e) => e.translations.es).toList();

// Get Europe countries in French language
var europeCountries = await CountryProvider.getcountryByRegionalBloc("Europe",filter: CountryFilter(isName: true));
List<string> europeCountriesInFrench = europeCountries.map((e) => e.translations.fr).toList();

// Get all countries name with their capital city only
var countries = await CountryProvider.getAllCountries(filter: CountryFilter(isName: true,isCapital:true));

// Get all countries name with country code and their capital city only
var countries = await CountryProvider.getAllCountries(filter: CountryFilter(isName: true,isCapital:true,isAlpha2Code:true,isAlpha3Code: true));


// Fell free to aplly filters 🤓
```

Default language for country name is English, but you can also get the name in other languages such as: `de`(German language),  `es`(Spanish language), `fr`(French language),  `ja`(Japanese language), `it`(Italian language), `br`(Breton language), `pt`(Portuguese language), `nl`(Dutch language), `hr`(Croatian language) and `fa`(Persian language).


## Country class

```dart
class Country
{	  
    // Get Country name
    String name;

    // Gets  Top Level Domain
    List<String> topLevelDomain;
    
    // Gets Alpha2 Code
    String alpha2Code;
    
    // Gets Alpha3 Code
    String alpha3Code;
    
    // Gets Calling Code
    List<String> callingCodes;
    
    // Gets Capital City
    String capital;
    
    // Get AltSpelling
    List<String> altSpellings;
    
    // Get Region
    String region;
    
    // Get SubDomain
    String subregion;
    
    // Get Population
    int population;
    
    // Get Latlng(Latitude and Longitude)
    List<double> latlng;
    
    // Get Demonym
    String demonym;
    
    // Get Area
    double area;
    
    // Get Gini
    double gini;
    
    // Get Timezone
    List<String> timezones;
    
    // Get Borders
    List<String> borders;
    
    // Get Native Name
    String nativeName;
    
    // Get Numeric Code
    String numericCode;
    
    // Get Currencies
    List<Currency> currencies;
    
     // Get Languages
    List<Language> languages;
    
    // Gets Translations
    Translations translations;
    
    // Get Flag
    String flag;
    
    // Get Regional Blocs
    List<RegionalBloc> regionalBlocs;
    
    // Get  Cioc(International Olympic Committee Code)
    String cioc;
}
```
## CountryFilter Class 
``` dart
class CountryFilter{
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
```

## Credits

Thanks to Fayder Florez for developing [REST Countries API](https://github.com/fayder/restcountries).


## Flutter plugins
Plugin Name        | Stars        
:-------------------------|-------------------------
|[Empty widget](https://github.com/TheAlphamerc/empty_widget) |![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/empty_widget?style=social)
|[Add Thumbnail](https://github.com/TheAlphamerc/flutter_plugin_add_thumbnail) |![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_plugin_add_thumbnail?style=social)
|[Filter List Widget](https://github.com/TheAlphamerc/flutter_plugin_filter_list) |![GitHub stars](https://img.shields.io/github/stars/Thealphamerc/flutter_plugin_filter_list?style=social)


## Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request.

## Created & Maintained By

[Sonu Sharma](https://github.com/TheAlphamerc) ([Twitter](https://www.twitter.com/TheAlphamerc)) ([Youtube](https://www.youtube.com/user/sonusharma045sonu/))
([Insta](https://www.instagram.com/_sonu_sharma__))  ![Twitter Follow](https://img.shields.io/twitter/follow/thealphamerc?style=social)

> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> * [PayPal](https://www.paypal.me/TheAlphamerc/)





