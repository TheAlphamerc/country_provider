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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Country> _countryList;
  void _searchCountry(int index) async {
    try {
      switch (index) {
        case 0:
          _countryList = await CountryProvider.getAllCountries();
          break;
        case 1:
          _countryList = await CountryProvider.getCountriesByName("India");
          break;
        case 2:
          _countryList = [await CountryProvider.getCountryByFullname("India")];
          break;
        case 3:
          _countryList = [await CountryProvider.getCountryByCode("Ind")];
          break;
        case 4:
          _countryList = await CountryProvider.getCountriesByListOfCodes([
            "Ind",
            "col",
          ]);
          break;
        case 5:
          _countryList = await CountryProvider.getCountryByCurrencyCode("Inr");
          break;
        case 6:
          _countryList = await CountryProvider.getCountriesByLanguageCode([
            "Hin",
            "en",
          ]);
          break;
        case 7:
          _countryList = await CountryProvider.getCountryByCapitalCity("Delhi");
          break;
        case 8:
          _countryList = await CountryProvider.getCountryByCallingCode(91);
          break;
        case 9:
          _countryList = await CountryProvider.getcountryByRegionalBloc("Asia");
          break;
        case 10:
          _countryList = await CountryProvider.getCountriesByContinent("ASEAN");
          break;

        default:
          break;
      }
      Navigator.pop(context);
      setState(() {});

      print(_countryList.first.name);
    } catch (error) {
      print(error);
    }
  }

  Widget _button(String text, Function onPressed) {
    return Container(
      // color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: OutlineButton(
        color: Colors.grey,

        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).typography.black.bodyText1,
        ),
        // visualDensity: VisualDensity.standard,
      ),
    );
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
        initialChildSize: .40,
        minChildSize: .30,
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
                Expanded(
                  child: ListView(
                    controller: scrollcontroller,
                    children: <Widget>[
                      _button("All Countries", () {
                        _searchCountry(0);
                      }),
                      _button("Countries by name ex: \"India\"", () {
                        _searchCountry(1);
                      }),
                      _button("Country by full name ex: \"India\"", () {
                        _searchCountry(2);
                      }),
                      _button("Country by code ex: \"Ind\"", () {
                        _searchCountry(3);
                      }),
                      _button("Countries by list of code ex: [Ind, Col]", () {
                        _searchCountry(4);
                      }),
                      _button("Countries by currency code ex: \"Inr\"", () {
                        _searchCountry(5);
                      }),
                      _button("Countries by language code ex: [en, hin]", () {
                        _searchCountry(6);
                      }),
                      _button("Country by capital city ex: \"Delhi\"", () {
                        _searchCountry(7);
                      }),
                      _button("Country by calling code ex: \"91\"", () {
                        _searchCountry(8);
                      }),
                      _button("Country by continent ex: \"Asia\"", () {
                        _searchCountry(9);
                      }),
                      _button("Country by regional bloc ex: \"ASEAN\"", () {
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
          title: _title(model.name),
          children: <Widget>[
            Column(
              children: <Widget>[
                Divider(color: Colors.grey.shade300, height: 1),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _rowData("Capital: ", model.capital),
                      _rowData("Region: ", model.region),
                      Row(children: <Widget>[
                        Expanded(
                          child: _rowData("Alpha2 Code: ", model.alpha2Code),
                        ),
                        Expanded(
                          child: _rowData("Alpha3 Code:  ", model.alpha3Code),
                        ),
                      ]),
                      _rowData("Area: ", model.area.toString()),
                      _rowData("Demonym: ", model.demonym),
                      _rowData("Timezone: ", model.timezones.first),
                      _rowData("Calling code", model.callingCodes.first),
                      _showListData("Borders", model.borders),
                      _showListData("Alt Spellings", model.altSpellings),
                      _showListData("Currency code",
                          model.currencies.map((x) => x.name).toList()),
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

  Widget _title(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Text(text),
    );
  }

  Widget _rowData(String text, String value) {
    return value == 'null' || value == null
        ? SizedBox()
        : Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: text,
                    style: Theme.of(context)
                        .typography
                        .dense
                        .button
                        .copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: value,
                    style: Theme.of(context)
                        .typography
                        .black
                        .bodyText1
                        .copyWith(color: Colors.black.withOpacity(.7)),
                  )
                ],
              ),
            ),
          );
  }

  Widget _showListData(String title, List<String> list) {
    List<Widget> children = [
      Text(
        title,
        style: Theme.of(context)
            .typography
            .dense
            .button
            .copyWith(color: Colors.black),
      ),
    ];
    children.addAll(list.map((e) => Padding(
          padding: EdgeInsets.only(right: 8),
          child: Text(e ?? ""),
        )));
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(
            children: children.toList(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xfff1f1f1),
      floatingActionButton: FloatingActionButton(
        onPressed: openSearchCountriesButton,
        child: Icon(Icons.edit),
      ),
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: _countryList != null && _countryList.isNotEmpty
            ? ListView.builder(
                itemCount: _countryList.length,
                itemBuilder: (context, index) {
                  if (_countryList[index] != null) {
                    return _countryData(_countryList[index]);
                  } else {
                    return SizedBox.shrink();
                  }
                })
            : SizedBox(),
      ),
    );
  }
}
