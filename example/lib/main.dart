import 'package:country_provider/country_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Search Country Plugin Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Country>? _countryList;
  CountryFilter filter = CountryFilter();
  bool isLoading = false;

  void _searchCountry(int index) async {
    try {
      Navigator.pop(context);
      isLoading = true;
      setState(() {});
      switch (index) {
        case 0:
          _countryList =
              await CountryProvider.getAllCountries(filter: CountryFilter());
          break;
        case 1:
          _countryList = await CountryProvider.getCountriesByName("Ameri",
              filter: CountryFilter(isName: true));
          break;
        case 2:
          _countryList = [
            await CountryProvider.getCountryByFullname("India",
                filter: CountryFilter())
          ];
          break;
        case 3:
          _countryList = [
            await CountryProvider.getCountryByCode("Ind",
                filter: CountryFilter())
          ];
          break;
        case 4:
          _countryList = await CountryProvider.getCountriesByListOfCodes(
              ["Ind", "col", "ru"],
              filter: CountryFilter());
          break;
        case 5:
          _countryList = await CountryProvider.getCountryByCurrencyCode("Inr",
              filter: CountryFilter());
          break;
        case 6:
          _countryList = await CountryProvider.getCountriesByLanguageCode([
            "Hin",
            "en",
          ], filter: CountryFilter());
          break;
        case 7:
          _countryList = await CountryProvider.getCountryByCapitalCity("Delhi",
              filter: CountryFilter());
          break;
        case 8:
          _countryList = await CountryProvider.getCountryByCallingCode(91,
              filter: CountryFilter());
          break;
        case 9:
          _countryList = await CountryProvider.getcountryByRegionalBloc("Asia",
              filter: CountryFilter());
          break;
        case 10:
          _countryList = await CountryProvider.getCountriesByContinent("ASEAN",
              filter: CountryFilter());
          break;

        default:
          break;
      }
      isLoading = false;
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  void openSearchCountriesButton() async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) => _countriesButton());
  }

  Widget _countriesButton() {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: .50,
        minChildSize: .3,
        builder: (BuildContext context, ScrollController scrollcontroller) {
          return Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 5,
                  width: 50,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                  // child:Icon(Icons.drag_handle)
                ),
                Center(
                  child: Text(
                    "Select search option",
                    style: Theme.of(context)
                        .typography
                        .dense
                        .headline6!
                        .copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ListView(
                    controller: scrollcontroller,
                    children: <Widget>[
                      _button("Search all countries", "", () {
                        _searchCountry(0);
                      }),
                      _button("Countries by name ", " Example: \"Ameri\"", () {
                        _searchCountry(1);
                      }),
                      _button("Country by full name  ", " Example: \"India\"",
                          () {
                        _searchCountry(2);
                      }),
                      _button("Country by code", " Example:  \"Ind\"", () {
                        _searchCountry(3);
                      }),
                      _button("Countries by list of code",
                          " Example: [Ind, Col,ru]", () {
                        _searchCountry(4);
                      }),
                      _button(
                          "Countries by currency code ", " Example: \"Inr\"",
                          () {
                        _searchCountry(5);
                      }),
                      _button("Countries by language code",
                          " Example: [en, hin,ru]", () {
                        _searchCountry(6);
                      }),
                      _button("Country by capital city", " Example: \"Delhi\"",
                          () {
                        _searchCountry(7);
                      }),
                      _button("Country by calling code", " Example: \"91\"",
                          () {
                        _searchCountry(8);
                      }),
                      _button("Country by continent", " Example: \"Asia\"", () {
                        _searchCountry(9);
                      }),
                      _button("Country by regional bloc", " Example: \"ASEAN\"",
                          () {
                        _searchCountry(10);
                      }),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _button(String title, String example, VoidCallback onPressed) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * .5,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: MaterialButton(
          color: Colors.blue[400],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          onPressed: onPressed,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).typography.dense.bodyText1,
                ),
                example.isEmpty
                    ? SizedBox()
                    : Text(
                        example,
                        style: Theme.of(context).typography.dense.bodyText1,
                      ),
              ])
          // visualDensity: VisualDensity.standard,
          ),
    );
  }

  Widget _countryData(Country model) {
    return Container(
      // padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5,
            color: Color(0xfff6f6f6),
            offset: Offset(5, 5),
          )
        ],
      ),
      child: Theme(
        data: ThemeData(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: _title(model.name!),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Divider(color: Colors.grey.shade300, height: 1),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _rowData("Capital", model.capital),
                      _rowData("Region", model.region),
                      _rowData("Alpha2 Code", model.alpha2Code),
                      _rowData("Alpha3 Code", model.alpha3Code),
                      _rowData("Area", model.area.toString()),
                      _showListData("Domain",
                          model.topLevelDomain?.map((e) => e).toList()),
                      _rowData("Demonym", model.demonym),
                      _rowData("Timezone", model.timezones?.first),
                      _rowData("Calling code", model.callingCodes?.first),
                      _rowData("Numeric Code", model.numericCode),
                      _rowData("CIOS", model.cioc),
                      _showListData("Currency Name",
                          model.currencies?.map((x) => x.name).toList()),
                      _showListData("Currency code",
                          model.currencies?.map((x) => x.code).toList()),
                      _showListData("Currency Symbol",
                          model.currencies?.map((x) => x.symbol).toList()),
                      _showListData("Lat Long",
                          model.latlng?.map((e) => e.toString()).toList()),
                      _showListData("Language",
                          model.languages?.map((e) => e.name).toList()),
                      _showListData("Lang Naiive Name",
                          model.languages?.map((e) => e.nativeName).toList()),
                      _showListData("Lang iso6391 Code",
                          model.languages?.map((e) => e.iso6391).toList()),
                      _showListData("Lang iso6392 Code",
                          model.languages?.map((e) => e.iso6392).toList()),
                      _showListData("Regional Blocs",
                          model.regionalBlocs?.map((e) => e.name).toList()),
                      _showListData("Regional Blocs Aacronym",
                          model.regionalBlocs?.map((e) => e.acronym).toList()),
                      _showListData("Borders", model.borders),
                      _showListData("Alt Spellings", model.altSpellings),
                      _showListData(
                          "Name Translations",
                          model.translations
                              ?.toJson()
                              .cast<String, String?>()
                              .values
                              .toList()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String? text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Text(text ?? ""),
    );
  }

  Widget _rowData(String text, String? value) {
    return value == 'null' || value == null
        ? SizedBox()
        : materialWidget(
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .typography
                        .dense
                        .button!
                        .copyWith(color: Colors.black),
                  ),
                ),
                Text(":  "),
                Expanded(
                  flex: 4,
                  child: Text(
                    value,
                    style: Theme.of(context)
                        .typography
                        .black
                        .bodyText1!
                        .copyWith(color: Colors.black.withOpacity(.7)),
                  ),
                )
              ],
            ),
          );
  }

  Widget _showListData(String title, List<String?>? list) {
    if (list == null || list.isEmpty) {
      return SizedBox.shrink();
    }
    List<Widget> children = [
      Expanded(
        flex: 3,
        child: Text(
          title,
          style: Theme.of(context)
              .typography
              .dense
              .button!
              .copyWith(color: Colors.black),
        ),
      )
    ];
    children.add(Text(":  "));
    children.add(
      Expanded(
        flex: 4,
        child: Container(
          child: Wrap(
            children: list.map((e) {
              if (list.last != e) {
                e = "$e, ";
              }

              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: Text(e ?? ""),
              );
            }).toList(),
          ),
        ),
      ),
    );
    return materialWidget(
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children),
    );
  }

  Widget materialWidget(Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Material(
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(.08)),
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      backgroundColor: Color(0xfff1f1f1),
      floatingActionButton: FloatingActionButton(
        onPressed: openSearchCountriesButton,
        child: Icon(Icons.search),
      ),
      body: Container(
        alignment: Alignment.center,
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : _countryList != null && _countryList!.isNotEmpty
                ? ListView.builder(
                    itemCount: _countryList!.length,
                    itemBuilder: (context, index) {
                      return _countryData(_countryList![index]);
                    })
                : Text(
                    "Click search buton to select option",
                    style: Theme.of(context)
                        .typography
                        .dense
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
      ),
    );
  }
}
