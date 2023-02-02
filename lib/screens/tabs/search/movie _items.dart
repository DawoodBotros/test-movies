import 'package:flutter/material.dart';
import 'package:movie/screens/tabs/details/detailsView.dart';
import 'package:movie/screens/tabs/search/searchResponse.dart';
import 'package:movie/screens/tabs/colors.dart';

import 'constant.dart';

class MovieItems extends StatelessWidget {
  Results results;

  MovieItems(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //going to details screen of movie
        Navigator.pushNamed(context, MovieDetailsView.routeName,arguments:results );
      },
      child: Container(
        color: blackBackground,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              children: [
                Image.network(
                  "$baseUrlImage${results.posterPath}",
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    results.title ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 25,
                        color: colorIcon),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${results.releaseDate}",
                    style: const TextStyle(color: colorIcon),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text("${results.voteAverage}",
                          style:
                              const TextStyle(fontSize: 16, color: colorIcon)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
