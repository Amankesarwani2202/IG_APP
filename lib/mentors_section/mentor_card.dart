import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mentor_details.dart';

class MentorCard extends StatefulWidget {
  final String name;
  final String company;
  final String hashtag;
  final String photo;
  final String description;
  final String linkedin;
  final String profilePic;
  final String companyPic;

  const MentorCard(
      {Key key,
      this.name,
      this.company,
      this.hashtag,
      this.photo,
      this.description,
      this.profilePic,
      this.companyPic,
      this.linkedin})
      : super(key: key);

  @override
  _MentorCardState createState() => _MentorCardState();
}

class _MentorCardState extends State<MentorCard> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.amber.shade500;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MentorDetails(
                      name: widget.name,
                      photo: widget.photo,
                      linkedin: widget.linkedin,
                      company: widget.company,
                      description: widget.description,
                      hashtag: widget.hashtag,
                      companyPic: widget.companyPic,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              widget.name,
                              overflow: TextOverflow.ellipsis,
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
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: color,
                              ),
                              Icon(
                                Icons.star,
                                color: color,
                              ),
                              Icon(
                                Icons.star,
                                color: color,
                              ),
                              Icon(
                                Icons.star,
                                color: color,
                              ),
                              Icon(
                                Icons.star,
                                color: color,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 50,
                    child: Image.network(
                      widget.photo,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Text(
                      widget.hashtag,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
