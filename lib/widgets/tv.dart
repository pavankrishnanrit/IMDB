import 'package:flutter/material.dart';
import 'package:imdb/utils/text.dart';
import 'package:imdb/widgets/tvDesc.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
              color: Colors.white, size: 26, text: 'Popular TV Shows'),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 11,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TVDesc(
                                    name: tv[index]['original_name'],
                                    bannerUrl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['backdrop_path'],
                                    description: tv[index]['overview'],
                                    vote: tv[index]['vote_average'].toString(),
                                    launchOn: tv[index]['first_air_date'],
                                  )));
                    },
                    child: tv[index]['original_name'] != null
                        ? Container(
                            padding: EdgeInsets.all(5),
                            width: 250,
                            child: Column(
                              children: [
                                Container(
                                  height: 140,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500' +
                                              tv[index]['backdrop_path']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: modified_text(
                                    text: tv[index]['original_name'] != null
                                        ? tv[index]['original_name']
                                        : 'Loading',
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
