import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/about.dart';
import '../shared/colors.dart';
import '../shared/constants.dart';

class CircularFloatingMenu extends StatefulWidget {
  final fabKey;
  CircularFloatingMenu({this.fabKey});

  @override
  _CircularFloatingMenuState createState() => _CircularFloatingMenuState();
}

class _CircularFloatingMenuState extends State<CircularFloatingMenu> {
  final String _phoneLaunchUri = 'tel: $i_call_center';
  final String _whatsappLaunchUri = 'whatsapp://send?phone=$i_whatsapp_number';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      key: widget.fabKey,
      // Cannot be `Alignment.center`
      alignment: Alignment.bottomLeft,
      ringColor: Colors.black.withOpacity(0.5),
      ringDiameter: 400.0,
      ringWidth: 150.0,
      fabSize: 60.0,
      fabElevation: 8.0,
      fabIconBorder: CircleBorder(),
      fabColor: Colors.white,
      fabOpenIcon: Icon(Icons.menu, color: kAccentColor),
      fabCloseIcon: Icon(Icons.close, color: kAccentColor),
      fabMargin: const EdgeInsets.all(8.0),
      animationDuration: const Duration(milliseconds: 800),
      animationCurve: Curves.easeInOutCirc,
      onDisplayChange: (isOpen) {
        // _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
      },
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {
            launch(_phoneLaunchUri);
            widget.fabKey.currentState.close();
          },
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(Icons.phone, color: Colors.white),
        ),
        RawMaterialButton(
          onPressed: () {
            // _showSnackBar(context, "You pressed 3");
            launch(_whatsappLaunchUri);
            widget.fabKey.currentState.close();
          },
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          // child: Icon(SocialMediaIcons.whatsapp, color: Colors.white),
          child: Image.asset('assets/icons8-whatsapp-16.png'),
        ),
        RawMaterialButton(
          onPressed: () {
            print('send email');
            widget.fabKey.currentState.close();
          },
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(Icons.email, color: Colors.white),
        ),
        RawMaterialButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AboutPage()));
            widget.fabKey.currentState.close();
          },
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(Icons.info, color: Colors.white),
        ),
        RawMaterialButton(
          onPressed: () {
            print('settings');
            widget.fabKey.currentState.close();
          },
          shape: CircleBorder(),
          padding: const EdgeInsets.all(18.0),
          child: Icon(Icons.settings, color: Colors.white),
        ),
      ],
    );
  }
}
