import 'dart:convert';

class Country {
  ///  Country name
  String? name;

  /// s  Top Level Domain
  List<String>? topLevelDomain;

  /// s Alpha2 Code
  String? alpha2Code;

  ///  Alpha3 Code
  String? alpha3Code;

  ///  Calling Code
  List<String>? callingCodes;

  ///  Capital City
  String? capital;

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
  double? gini;

  /// Timezone exists in country
  List<String>? timezones;

  /// List of country border
  List<String>? borders;

  /// Native name of country
  String? nativeName;

  /// Country code
  String? numericCode;

  /// Country's currency
  List<Currency>? currencies;

  /// Country's language'
  List<Language>? languages;
  Translations? translations;
  String? flag;
  List<RegionalBloc>? regionalBlocs;

  ///   Cioc(International Olympic Committee Code)
  String? cioc;

  Country({
    this.name,
    this.topLevelDomain,
    this.alpha2Code,
    this.alpha3Code,
    this.callingCodes,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.population,
    this.latlng,
    this.demonym,
    this.area,
    this.gini,
    this.timezones,
    this.borders,
    this.nativeName,
    this.numericCode,
    this.currencies,
    this.languages,
    this.translations,
    this.flag,
    this.regionalBlocs,
    this.cioc,
  });

  factory Country.fromRawJson(String str) => Country.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Country.fromJson(Map<String, dynamic?> json) => Country(
        name: json["name"] == null ? null : json["name"],
        topLevelDomain: json["topLevelDomain"] == null
            ? null
            : List<String>.from(json["topLevelDomain"].map((x) => x)),
        alpha2Code: json["alpha2Code"] == null ? null : json["alpha2Code"],
        alpha3Code: json["alpha3Code"] == null ? null : json["alpha3Code"],
        callingCodes: json["callingCodes"] == null
            ? null
            : List<String>.from(json["callingCodes"].map((x) => x)),
        capital: json["capital"] == null ? null : json["capital"],
        altSpellings: json["altSpellings"] == null
            ? null
            : List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"] == null ? null : json["region"],
        subregion: json["subregion"] == null ? null : json["subregion"],
        population: json["population"] == null ? null : json["population"],
        latlng: json["latlng"] == null
            ? null
            : List<double>.from(json["latlng"].map((x) => x)),
        demonym: json["demonym"] == null ? null : json["demonym"],
        area: json["area"] == null ? null : json["area"],
        gini: json["gini"] == null ? null : json["gini"].toDouble(),
        timezones: json["timezones"] == null
            ? null
            : List<String>.from(json["timezones"].map((x) => x)),
        borders: json["borders"] == null
            ? null
            : List<String>.from(json["borders"].map((x) => x)),
        nativeName: json["nativeName"] == null ? null : json["nativeName"],
        numericCode: json["numericCode"] == null ? null : json["numericCode"],
        currencies: json["currencies"] == null
            ? null
            : List<Currency>.from(
                json["currencies"].map((x) => Currency.fromJson(x))),
        languages: json["languages"] == null
            ? null
            : List<Language>.from(
                json["languages"].map((x) => Language.fromJson(x))),
        translations: json["translations"] == null
            ? null
            : Translations.fromJson(json["translations"]),
        flag: json["flag"] == null ? null : json["flag"],
        regionalBlocs: json["regionalBlocs"] == null
            ? null
            : List<RegionalBloc>.from(
                json["regionalBlocs"].map((x) => RegionalBloc.fromJson(x))),
        cioc: json["cioc"] == null ? null : json["cioc"],
      );

  Map<String, dynamic?> toJson() => {
        "name": name == null ? null : name,
        "topLevelDomain": topLevelDomain == null
            ? null
            : List<dynamic>.from(topLevelDomain!.map((x) => x)),
        "alpha2Code": alpha2Code == null ? null : alpha2Code,
        "alpha3Code": alpha3Code == null ? null : alpha3Code,
        "callingCodes": callingCodes == null
            ? null
            : List<dynamic>.from(callingCodes!.map((x) => x)),
        "capital": capital == null ? null : capital,
        "altSpellings": altSpellings == null
            ? null
            : List<dynamic>.from(altSpellings!.map((x) => x)),
        "region": region == null ? null : region,
        "subregion": subregion == null ? null : subregion,
        "population": population == null ? null : population,
        "latlng":
            latlng == null ? null : List<dynamic>.from(latlng!.map((x) => x)),
        "demonym": demonym == null ? null : demonym,
        "area": area == null ? null : area,
        "gini": gini == null ? null : gini,
        "timezones": timezones == null
            ? null
            : List<dynamic>.from(timezones!.map((x) => x)),
        "borders":
            borders == null ? null : List<dynamic>.from(borders!.map((x) => x)),
        "nativeName": nativeName == null ? null : nativeName,
        "numericCode": numericCode == null ? null : numericCode,
        "currencies": currencies == null
            ? null
            : List<dynamic>.from(currencies!.map((x) => x.toJson())),
        "languages": languages == null
            ? null
            : List<dynamic>.from(languages!.map((x) => x.toJson())),
        "translations": translations == null ? null : translations!.toJson(),
        "flag": flag == null ? null : flag,
        "regionalBlocs": regionalBlocs == null
            ? null
            : List<dynamic>.from(regionalBlocs!.map((x) => x.toJson())),
        "cioc": cioc == null ? null : cioc,
      };
}

class Currency {
  String? code;
  String? name;
  String? symbol;

  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  factory Currency.fromRawJson(String str) =>
      Currency.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Currency.fromJson(Map<String, dynamic?> json) => Currency(
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
        symbol: json["symbol"] == null ? null : json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "name": name == null ? null : name,
        "symbol": symbol == null ? null : symbol,
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

  factory Language.fromJson(Map<String, dynamic?> json) => Language(
        iso6391: json["iso639_1"] == null ? null : json["iso639_1"],
        iso6392: json["iso639_2"] == null ? null : json["iso639_2"],
        name: json["name"] == null ? null : json["name"],
        nativeName: json["nativeName"] == null ? null : json["nativeName"],
      );

  Map<String, dynamic?> toJson() => {
        "iso639_1": iso6391 == null ? null : iso6391,
        "iso639_2": iso6392 == null ? null : iso6392,
        "name": name == null ? null : name,
        "nativeName": nativeName == null ? null : nativeName,
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

  factory RegionalBloc.fromJson(Map<String, dynamic?> json) => RegionalBloc(
        acronym: json["acronym"] == null ? null : json["acronym"],
        name: json["name"] == null ? null : json["name"],
        otherAcronyms: json["otherAcronyms"] == null
            ? null
            : List<dynamic>.from(json["otherAcronyms"].map((x) => x)),
        otherNames: json["otherNames"] == null
            ? null
            : List<dynamic>.from(json["otherNames"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "acronym": acronym == null ? null : acronym,
        "name": name == null ? null : name,
        "otherAcronyms": otherAcronyms == null
            ? null
            : List<dynamic>.from(otherAcronyms!.map((x) => x)),
        "otherNames": otherNames == null
            ? null
            : List<dynamic>.from(otherNames!.map((x) => x)),
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

  factory Translations.fromJson(Map<String?, dynamic?> json) => Translations(
        de: json["de"] == null ? null : json["de"],
        es: json["es"] == null ? null : json["es"],
        fr: json["fr"] == null ? null : json["fr"],
        ja: json["ja"] == null ? null : json["ja"],
        it: json["it"] == null ? null : json["it"],
        br: json["br"] == null ? null : json["br"],
        pt: json["pt"] == null ? null : json["pt"],
        nl: json["nl"] == null ? null : json["nl"],
        hr: json["hr"] == null ? null : json["hr"],
        fa: json["fa"] == null ? null : json["fa"],
      );

  Map<String?, dynamic?> toJson() => {
        "de": de == null ? null : de,
        "es": es == null ? null : es,
        "fr": fr == null ? null : fr,
        "ja": ja == null ? null : ja,
        "it": it == null ? null : it,
        "br": br == null ? null : br,
        "pt": pt == null ? null : pt,
        "nl": nl == null ? null : nl,
        "hr": hr == null ? null : hr,
        "fa": fa == null ? null : fa,
      };
}
