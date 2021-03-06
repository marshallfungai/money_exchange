import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/currency_list.dart';
import '../screens/dark_input.dart';
import '../screens/light_input.dart';
import '../services/currency.dart';
import '../shared/font_size.dart';
import '../shared/colors.dart';
import '../widgets/circularFloatingMenu.dart';

class DashboardPage extends StatefulWidget {
  final dynamic currencyVal;
  final dynamic convertedCurrency;
  final String currenyOne;
  final String currencyTwo;
  final bool isWhite;

  DashboardPage(
      {this.currencyVal,
      this.convertedCurrency,
      this.currenyOne,
      this.currencyTwo,
      this.isWhite});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double _fontSize = 120.0;

    if (widget.currencyVal.toString().length >
        widget.convertedCurrency.toString().length) {
      _fontSize = getFontSize(widget.currencyVal.toString());
    } else {
      _fontSize = getFontSize(widget.convertedCurrency.toString());
    }

    return Scaffold(
      body: Material(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: kAccentColor,
            ),
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => CurrencyList(
                                  currencyOneShortName: widget.currenyOne,
                                  currencyTwoShortName: widget.currencyTwo,
                                  isWhite: false)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 30.0),
                            Text(
                              CurrencyService().getCurrency(widget.currenyOne),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 26.0),
                            ),
                            SizedBox(width: 5.0),
                            Icon(Icons.edit, color: Colors.white, size: 25.0)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => RedInputPage(
                                      originalCurrency: widget.currenyOne,
                                      convertedCurrency: widget.currencyTwo)));
                        },
                        child: Text(
                          widget.currencyVal.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: _fontSize,
                          ),
                        ),
                      ),
                      Text(
                        widget.currenyOne,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      Container(
                        height: 125.0,
                        width: 125.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(62.5),
                            color: Colors.white,
                            border: Border.all(
                                color: kAccentColor,
                                style: BorderStyle.solid,
                                width: 6.0)),
                        child: Center(
                          child: widget.isWhite
                              ? Icon(
                                  Icons.arrow_upward,
                                  size: 60,
                                  color: kAccentColor,
                                )
                              : Icon(
                                  Icons.arrow_downward,
                                  size: 60,
                                  color: kAccentColor,
                                ),
                        ),
                      ),
                      Text(
                        widget.currencyTwo,
                        style: TextStyle(
                            color: kAccentColor.withOpacity(0.7),
                            fontSize: 18.0,
                            letterSpacing: 1.0),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => WhiteInputPage(
                                      originalCurrency: widget.currenyOne,
                                      convertedCurrency: widget.currencyTwo)));
                        },
                        child: Text(
                          widget.convertedCurrency.toString(),
                          style: TextStyle(
                            color: kAccentColor,
                            fontSize: _fontSize,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) => CurrencyList(
                                  currencyOneShortName: widget.currenyOne,
                                  currencyTwoShortName: widget.currencyTwo,
                                  isWhite: true)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 30.0),
                            Text(
                              CurrencyService().getCurrency(widget.currencyTwo),
                              style: TextStyle(
                                  color: kAccentColor, fontSize: 26.0),
                            ),
                            SizedBox(width: 5.0),
                            Icon(Icons.edit, color: kAccentColor, size: 25.0)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: CircularFloatingMenu(fabKey: fabKey),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
