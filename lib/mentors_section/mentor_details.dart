import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MentorDetails extends StatefulWidget {
  final String name;
  final String company;
  final String hashtag;
  final String photo;
  final String description;
  final String linkedin;
  final String companyPic;

  const MentorDetails(
      {Key key,
      this.name,
      this.companyPic,
      this.company,
      this.hashtag,
      this.photo,
      this.description,
      this.linkedin})
      : super(key: key);

  @override
  _MentorDetailsState createState() => _MentorDetailsState();
}

class _MentorDetailsState extends State<MentorDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            shadowColor: Colors.grey,
            backgroundColor: Colors.amber.shade500,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                widget.name,
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.photo),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.chat_outlined,
                      size: 36, color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Container(
                            width: 140,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(70),
                              color: Colors.amber.shade500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Center(
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(65),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.photo),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: size.width * 0.62,
                          child: Text(
                            'About   ' + widget.name,
                            style: GoogleFonts.nunito(
                              fontSize: 25,
                              color: Colors.amber.shade500,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL(widget.linkedin);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: 37,
                            width: 37,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                            child: Center(
                              child: FaIcon(FontAwesomeIcons.linkedin,
                                  size: 35, color: Colors.blue.shade700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: size.width * 0.9,
                    child: Container(
                        child: Text(
                      widget.description,
                      style: GoogleFonts.nunito(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: 18),
                    )),
                  ),
                ),
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 40,
                ),
                Center(child: SessionButtonWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _launchURL(String place) async {
    var url = place;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SessionButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 65,
      width: size.width * 0.75,
      decoration: BoxDecoration(
        color: Colors.amber.shade500,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).secondaryHeaderColor.withAlpha(500),
            blurRadius: 10,
          )
        ],
      ),
      // color: Colors.red,
      padding: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {},
        child: Center(
          child: Text('Start Your Session',
              style: GoogleFonts.nunito(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
        ),
      ),
    );
  }
}
