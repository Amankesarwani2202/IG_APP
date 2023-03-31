import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'google_auth_configuration.dart';

class GoogleSignInButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 300,
      padding: EdgeInsets.all(4),
      child: OutlinedButton.icon(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login();
        },
        icon: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.black,
          size: 30,
        ),
        label: Text('   Sign In With Google',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.yellowAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.yellow),
            ),
          ),
        ),
      ),
    );
  }
}
