import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/shared/constants/constants.dart';

class TopPopularScreen extends StatelessWidget {
  Results resultResponse;

  TopPopularScreen({required this.resultResponse});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        // Navigator to Details
      },
      child: Container(
        height: size.height * 0.30,
        margin: EdgeInsets.only(bottom: 5),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.22,
              child: Stack(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          (baseUrlImage + "${resultResponse.backdropPath}") ?? "",
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                            color: Colors.yellow,
                          )),
                      errorWidget: (context, url, error) => Icon(Icons.error)),
                  Positioned(
                    left: size.width * 0.40,
                    top: size.height * 0.09,
                    child: Icon(
                      Icons.play_circle_filled,
                      size: 70,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: size.width * 0.05,
              top: size.height * 0.06,
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.30,
                    height: size.height * 0.40,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                            imageUrl: (baseUrlImage +
                                    "${"${resultResponse.backdropPath}"}") ??
                                "",
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.6,
                            fit: BoxFit.fitHeight,
                            placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                )),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error)),
                        Image.asset("assets/images/addToList.png"),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Text(
                        resultResponse.title ?? "error",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        //overflow: TextOverflow.visible,
                        maxLines: 2,
                      ),
                      Text(
                        resultResponse.releaseDate ?? "error",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}