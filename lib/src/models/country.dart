import 'dart:convert';

class Country {
  ///  Country name
  Name? name;

  /// s  Top Level Domain
  List<String>? topLevelDomain;

  /// s Alpha2 Code
  String? alpha2Code;

  ///  Alpha3 Code
  String? alpha3Code;

  ///  Calling Code
  List<String>? callingCodes;

  ///  Capital City
  List<String>? capital;

  ///  Alt spelling
  List<String>? altSpellings;

  ///  Region
  String? region;

  ///  Sub region
  String? subregion;

  ///  Population
  int? population;

  ///  Latlng(Latitude and Longitude)
  List<double>? latlng;

  ///  Demonym
  String? demonym;

  /// area of country
  double? area;
  // double? gini;

  /// Timezone exists in country
  List<String>? timezones;

  /// List of country border
  List<String>? borders;

  /// Native name of country
  String? nativeName;

  /// Country code
  String? numericCode;

  /// Country's currency
  Map<String, Currency>? currencies;

  /// Country's language'
  // List<Language>? languages;
  Translations? translations;
  String? flag;
  List<RegionalBloc>? regionalBlocs;

  ///   Cioc(International Olympic Committee Code)
  String? cioc;

  Country({
    this.name,
    this.topLevelDomain,
    // this.alpha2Code,
    // this.alpha3Code,
    this.callingCodes,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.population,
    this.latlng,
    this.demonym,
    this.area,
    // this.gini,
    this.timezones,
    this.borders,
    this.nativeName,
    this.numericCode,
    this.currencies,
    // this.languages,
    this.translations,
    this.flag,
    this.regionalBlocs,
    this.cioc,
  });

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json['name'] != null ? new Name.fromJson(json['name']) : null,
        topLevelDomain: json.getList("topLevelDomain"),
        // alpha2Code: json.get("alpha2Code"),
        // alpha3Code: json.get("alpha3Code"),
        callingCodes: json.getList("callingCodes"),
        capital: json['capital'] != null
            ? json['capital'].cast<String>() ?? null
            : null,
        altSpellings: json.getList("altSpellings"),
        region: json.get("region"),
        subregion: json.get("subregion"),
        population: json.get("population"),
        latlng: json.getList("latlng"),
        demonym: json.get("demonym"),
        area: json.get("area"),
        // gini: json.get("gini"),
        timezones: json.getList("timezones"),
        borders: json.getList("borders"),
        nativeName: json.get("nativeName"),
        numericCode: json.get("numericCode"),
        currencies: json
            .get("currencies")
            ?.map<String, Currency>((key, value) =>
                MapEntry<String, Currency>(key, Currency.fromJson(value)))
            .cast<String, Currency>(),
        // languages: json.getList("languages", converter: Language.fromJson),
        translations: Translations.fromJson(json.get("translations")),
        flag: json.get("flag"),
        regionalBlocs:
            json.getList("regionalBlocs", converter: RegionalBloc.fromJson),
        cioc: json.get("cioc"),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "topLevelDomain": topLevelDomain,
        "alpha2Code": alpha2Code,
        "alpha3Code": alpha3Code,
        "callingCodes": callingCodes,
        "capital": capital,
        "altSpellings": altSpellings,
        "region": region,
        "subregion": subregion,
        "population": population,
        "latlng": latlng,
        "demonym": demonym,
        "area": area,
        // "gini": gini,
        "timezones": timezones,
        "borders": borders,
        "nativeName": nativeName,
        "numericCode": numericCode,
        "currencies": currencies,
        // "languages": languages,
        "translations": translations,
        "flag": flag,
        "regionalBlocs": regionalBlocs,
        "cioc": cioc,
      };
}

class Currency {
  // String? code;
  String? name;
  String? symbol;

  Currency({
    // this.code,
    this.name,
    this.symbol,
  });

  factory Currency.fromRawJson(String str) =>
      Currency.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static Currency fromJson(Object json) => Currency(
        // code: json.get("code"),
        name: json.get("name"),
        symbol: json.get("symbol"),
      );

  Map<String, dynamic> toJson() => {
        // "code": code,
        "name": name,
        "symbol": symbol,
      };
}

class Language {
  String? iso6391;
  String? iso6392;
  String? name;
  String? nativeName;

  Language({
    this.iso6391,
    this.iso6392,
    this.name,
    this.nativeName,
  });

  factory Language.fromRawJson(String str) =>
      Language.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static Language fromJson(Object json) => Language(
        iso6391: json.get("iso639_1"),
        iso6392: json.get("iso639_2"),
        name: json.get("name"),
        nativeName: json.get("nativeName"),
      );

  Map<String, dynamic> toJson() => {
        "iso639_1": iso6391,
        "iso639_2": iso6392,
        "name": name,
        "nativeName": nativeName,
      };
}

class RegionalBloc {
  String? acronym;
  String? name;
  List<dynamic>? otherAcronyms;
  List<dynamic>? otherNames;

  RegionalBloc({
    this.acronym,
    this.name,
    this.otherAcronyms,
    this.otherNames,
  });

  factory RegionalBloc.fromRawJson(String str) =>
      RegionalBloc.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static RegionalBloc fromJson(Object json) => RegionalBloc(
        acronym: json.get("acronym"),
        name: json.get("name"),
        otherAcronyms: json.get("otherAcronyms"),
        otherNames: json.get("otherNames"),
      );

  Map<String, dynamic> toJson() => {
        "acronym": acronym,
        "name": name,
        "otherAcronyms": otherAcronyms,
        "otherNames": otherNames,
      };
}

class Translations {
  String? de;
  String? es;
  String? fr;
  String? ja;
  String? it;
  String? br;
  String? pt;
  String? nl;
  String? hr;
  String? fa;

  Translations({
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.br,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
  });

  factory Translations.fromRawJson(String str) =>
      Translations.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static Translations fromJson(Object json) => Translations(
        de: json.get("de"),
        es: json.get("es"),
        fr: json.get("fr"),
        ja: json.get("ja"),
        it: json.get("it"),
        br: json.get("br"),
        pt: json.get("pt"),
        nl: json.get("nl"),
        hr: json.get("hr"),
        fa: json.get("fa"),
      );

  Map<String?, dynamic> toJson() => {
        "de": de,
        "es": es,
        "fr": fr,
        "ja": ja,
        "it": it,
        "br": br,
        "pt": pt,
        "nl": nl,
        "hr": hr,
        "fa": fa,
      };
}

class Name {
  String? common;
  String? official;

  Name({
    this.common,
    this.official,
  });

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['common'] = this.common;
    data['official'] = this.official;

    return data;
  }
}

extension MapExt on Object? {
  T? get<T>(String key) {
    final self = this;
    if (self is! Map) {
      throw ArgumentError(
          "Trying to extract key $key from an object that's not a map!  Is ${this.runtimeType}");
    } else {
      final value = self[key];
      if (value == null) {
        // throw ArgumentError(
        //     "Invalid type $T for key $key. Found ${value?.runtimeType}");
        return null;
      }
      return value;
    }
  }

  List<T> getList<T>(String key, {T converter(Object input)?}) {
    final self = this;
    if (self is! Map) {
      throw ArgumentError(
          "Trying to extract key $key from an object that's not a map!  Is ${this.runtimeType}");
    } else {
      final value = self[key];
      if (value == null) {
        return <T>[];
      } else if (value is! Iterable) {
        // throw ArgumentError(
        //     "Invalid Iterable<$T> key $key. Found ${value?.runtimeType}");
        print("Invalid Iterable<$T> key $key. Found ${value?.runtimeType}");
        return <T>[];
      } else {
        return value.map((item) {
          if (item is T) {
            return item;
          } else if (converter != null) {
            assert(item is Object,
                "Item within list for key $key must be non-null, but was ${item?.runtimeType}");
            return converter(item as Object);
          } else {
            throw ArgumentError(
                'Found invalid item for key $key.  Sound have been $T but was ${value.runtimeType}');
          }
        }).toList();
      }
    }
  }
}
