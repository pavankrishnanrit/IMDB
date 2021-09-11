import 'package:flutter/material.dart';
import 'package:imdb/utils/text.dart';
import '../description.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;
  const TopRatedMovies({Key? key, required this.topRated}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(color: Colors.white, size: 26, text: 'Top Rated Movies'),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: topRated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                name: topRated[index]['title'],
                                bannerUrl:
                                'https://image.tmdb.org/t/p/w500' +
                                    topRated[index]['backdrop_path'],
                                posterUrl:
                                'https://image.tmdb.org/t/p/w500' +
                                    topRated[index]['poster_path'],
                                description: topRated[index]['overview'],
                                vote: topRated[index]['vote_average']
                                    .toString(),
                                launchOn: topRated[index]['release_date'],
                              )));
                    },
                    child: topRated[index]['title'] != null
                        ? Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        topRated[index]['poster_path']),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: modified_text(
                              text: topRated[index]['title'] != null
                                  ? topRated[index]['title']
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
