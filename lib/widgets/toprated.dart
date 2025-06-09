import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class Toprated extends StatelessWidget {
  const Toprated({super.key, required this.toprated});

  final List toprated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextModified(text: "Top Rated Movies", size: 20),
          SizedBox(height: 16),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: toprated.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Description(
                              name: toprated[index]['title'],
                              description: toprated[index]['overview'],
                              bannerUrl:
                                  'https://image.tmdb.org/t/p/w500/${toprated[index]['backdrop_path']}',
                              posterUrl:
                                  'https://image.tmdb.org/t/p/w500/${toprated[index]['poster_path']}',
                              vote: toprated[index]['vote_average'].toString(),
                              lauchOn: toprated[index]['release_date'],
                            ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/${toprated[index]['poster_path']}',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextModified(
                            text:
                                toprated[index]['title'] != null
                                    ? toprated[index]['title']
                                    : 'Loading...',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
