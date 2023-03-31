import 'package:flutter/material.dart';
import 'package:interngrow/googleauth/signinbutton.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(100),
                    spreadRadius: 10,
                    blurRadius: 20,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/ig.png'),
                ),
              ),
            ),
            SizedBox(height: 50),
            GoogleSignInButtonWidget(),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
