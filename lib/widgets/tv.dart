import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  const TV({super.key, required this.tv});

  final List tv;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextModified(text: "Popular Tv Shows", size: 20),
          SizedBox(height: 16),
          Container(
            height: 210,
            child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder:
                    //         (context) => Description(
                    //           name: tv[index]['original_name'],
                    //           description: tv[index]['overview'],
                    //           bannerUrl:
                    //               'https://image.tmdb.org/t/p/w500/${tv[index]['backdrop_path']}',
                    //           posterUrl:
                    //               'https://image.tmdb.org/t/p/w500/${tv[index]['poster_path']}',
                    //           vote: tv[index]['vote_average'].toString(),
                    //           lauchOn: tv[index]['release_date'],
                    //         ),
                    //   ),
                    // );
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/${tv[index]['backdrop_path']}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: TextModified(
                            text:
                                tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
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
