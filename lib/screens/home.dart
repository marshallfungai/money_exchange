import 'package:fab_circular_menu/fab_circular_menu.dart';

import '../services/currency.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    CurrencyService().convertCurrency(
        fromCurrency: 'USD',
        toCurrency: 'TRY',
        amount: 1,
        context: context,
        isWhite: false);

    return Scaffold(
        backgroundColor: Colors.blueAccent[700],
        body: Center(
          child: Image.asset('assets/logo.png'),
        ));
  }
}
