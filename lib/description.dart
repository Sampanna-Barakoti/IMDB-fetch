import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerUrl,
    required this.posterUrl,
    required this.vote,
    required this.lauchOn,
  });

  final String name, description, bannerUrl, posterUrl, vote, lauchOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(6),

              height: 200,

              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerUrl, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 8,
                    child: TextModified(
                      text: '⭐ Average Rating - ' + vote,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: TextModified(
                text: name != null ? name : 'Loading...',
                size: 22,
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 10),
              child: TextModified(text: 'Releasing on - $lauchOn', size: 14),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 130,
                  child: Image.network(posterUrl, fit: BoxFit.cover),
                ),
                Flexible(
                  child: Container(
                    child: TextModified(text: description, size: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
