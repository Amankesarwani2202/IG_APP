import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:interngrow/googleauth/google_auth_configuration.dart';
import 'package:interngrow/themedata/themes.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool light;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    themeProvider.isDarkMode ? light = false : light = true;
    Color color = Colors.amber.shade500;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        title: Text(
          'InternGrow',
          style: GoogleFonts.nunito(color: color),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 10,
      ),
      drawer: new Drawer(
        child: Container(
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: NetworkImage(user.photoURL),
                  ),
                  SizedBox(height: 20),
                  Text(
                    user.displayName,
                    style: GoogleFonts.nunito(
                      color: color,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
              Divider(),
              InkWell(
                onTap: () {
                  setState(() {
                    final provider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    provider.toggleTheme(light);
                    light = !light;
                  });
                },
                child: ListTile(
                  title: Text(
                    'Change Theme',
                    style: GoogleFonts.montserrat(
                      color: color,
                    ),
                  ),
                  leading: light == true
                      ? Icon(Icons.wb_sunny_outlined, color: color)
                      : Icon(Icons.wb_incandescent_outlined, color: color),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: color,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Divider(
                  color: color,
                  thickness: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                child: ListTile(
                  title: Text(
                    'Logout',
                    style: GoogleFonts.montserrat(
                      color: color,
                    ),
                  ),
                  leading: Icon(
                    Icons.logout,
                    color: color,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: color,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Divider(
                  color: color,
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox.fromSize(
          child: WebView(
            initialUrl: "https://letsgrowmore.in/",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    ));
  }
}
