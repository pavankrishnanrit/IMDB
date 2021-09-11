import 'package:flutter/material.dart';
import 'package:imdb/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, vote, launchOn;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.vote,
      required this.launchOn})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: modified_text(
                      text: 'Average ⭐ Rating - ' + vote,
                      size: 18,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: modified_text(
              text: name != null ? name : 'Not Loaded',
              size: 24,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: modified_text(
              text: 'Releasing On ' + launchOn,
              size: 14,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: Image.network(posterUrl),
              ),
              Flexible(
                child: Container(
                  child: modified_text(
                    text: description,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
