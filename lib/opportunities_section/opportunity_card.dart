import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpportunityCard extends StatefulWidget {
  final String role;
  final String company;
  final String country;

  final String date;
  final String link;

  final String companyPic;

  const OpportunityCard(
      {Key key,
      this.role,
      this.company,
      this.country,
      this.date,
      this.companyPic,
      this.link})
      : super(key: key);

  @override
  _OpportunityCardState createState() => _OpportunityCardState();
}

class _OpportunityCardState extends State<OpportunityCard> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.amber.shade500;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).secondaryHeaderColor.withAlpha(500),
                  blurRadius: 10.0),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.companyPic)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.57,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              widget.role,
                              style: GoogleFonts.nunito(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              widget.company,
                              style: GoogleFonts.nunito(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              widget.country,
                              style: GoogleFonts.nunito(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        widget.date,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.nunito(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  ApplyButtonWidget(link: widget.link),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplyButtonWidget extends StatelessWidget {
  final String link;

  const ApplyButtonWidget({Key key, this.link}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        width: size.width * 0.34,
        decoration: BoxDecoration(
          color: Colors.amber.shade500,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).secondaryHeaderColor.withAlpha(300),
              blurRadius: 10,
            )
          ],
        ),
        // color: Colors.red,
        padding: EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SafeArea(
                          child: SizedBox.fromSize(
                            child: WebView(
                              initialUrl: link,
                              javascriptMode: JavascriptMode.unrestricted,
                            ),
                          ),
                        )));
          },
          child: Center(
            child: Text('Apply',
                style: GoogleFonts.nunito(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
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
