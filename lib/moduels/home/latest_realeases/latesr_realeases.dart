import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../../model/popular_response.dart';
import '../../../shared/constants/constants.dart';
import '../../../shared/styles/colors.dart';

class LatestRealeases extends StatelessWidget {
  Results results;

  LatestRealeases({required this.results});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 180,
      color: colorgrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(

                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CachedNetworkImage(
                      imageUrl: (baseUrlImage + "${results.posterPath}"),
                      width: size.width * 0.3,
                      height: size.height * 0.3,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.asset("assets/images/addToList.png"),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ],
                    )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
