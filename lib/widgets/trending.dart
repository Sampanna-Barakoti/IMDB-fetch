import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trending});

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextModified(text: "Trending Movies", size: 20),
          SizedBox(height: 16),
          Container(
            height: 270,
            child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => Description(
                              name: trending[index]['title'],
                              description: trending[index]['overview'],
                              bannerUrl:
                                  'https://image.tmdb.org/t/p/w500/${trending[index]['backdrop_path']}',
                              posterUrl:
                                  'https://image.tmdb.org/t/p/w500/${trending[index]['poster_path']}',
                              vote: trending[index]['vote_average'].toString(),
                              lauchOn: trending[index]['release_date'],
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
                                'https://image.tmdb.org/t/p/w500/${trending[index]['poster_path']}',
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextModified(
                            text:
                                trending[index]['title'] != null
                                    ? trending[index]['title']
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
