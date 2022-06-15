import 'package:flutter/material.dart';
import '../shared/colors.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(title: Text("About Us"), centerTitle: true, elevation: 0.0),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: ListView(children: <Widget>[
            Image.asset('assets/monexchnage.jpg'),
            // SizedBox(height: 5.0),
            // Text("Monexchange",
            //     style: TextStyle(
            //         color: kAccentColor,
            //         fontSize: 30.0,
            //         fontWeight: FontWeight.bold)),
            // SizedBox(height: 10.0),
            Text("Doviz Burosu | Exchange Office",
                style: TextStyle(
                    color: kAccentColor2,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic)),
            SizedBox(height: 20.0),
            Text(
                "Get your TURKISH LIRA here in North Cyprus, as the conversion rates are much better with 0% commission",
                style: TextStyle(
                    color: kAccentColor3,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 15.0),
            Text(
                "Monex has English speaking staff that can meet exchange needs of customers at office.",
                style: TextStyle(
                  color: kAccentColor3,
                  fontSize: 18.0,
                )),
            SizedBox(height: 15.0),
            Text(
                "When you exchange with Monex, we promise to give you the lowest price for your foreign currency in North Cyprus. There is not any upper daily limit on how much foreign currency you can exchange.",
                style: TextStyle(
                  color: kAccentColor3,
                  fontSize: 18.0,
                )),
            SizedBox(height: 15.0),
            Text(
                "Monexchange buys and sells mainly British pound, American Dollar, Euro and Turkish Lira. Monexchange accepts all major credit cards (except American Express). Monexchange offers extremely competitive exchange rates to both companies and individuals alike, helping them with any of their foreign currency transactions.",
                style: TextStyle(
                  color: kAccentColor3,
                  fontSize: 18.0,
                )),
          ]),
        ),
      ),
    );
  }
}
