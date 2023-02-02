import 'package:flutter/material.dart';
import 'package:movie/screens/tabs/details/similarItems.dart';
import 'package:movie/screens/tabs/details/similarResponse.dart';
import 'package:movie/screens/tabs/search/constant.dart';
import 'package:movie/screens/tabs/search/searchResponse.dart';
import 'package:movie/screens/tabs/colors.dart';

import '../apiManger.dart';

class MovieDetailsView extends StatelessWidget {


  static const String routeName = "MovieDetailsView";

  @override
  Widget build(BuildContext context) {
    var movieID = ModalRoute.of(context)!.settings.arguments as Results ;
    return Scaffold(
      backgroundColor: blackBackground,
      appBar: AppBar(
        title: Text(movieID.title ?? "",
            style: const TextStyle(color: yellowColor, fontSize: 22)),
        centerTitle: true,
        backgroundColor: blackBackground,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                "$baseUrlImage${movieID.backdropPath}",
                height: 180,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            "$baseUrlImage${movieID.posterPath}",
                            height: MediaQuery.of(context).size.height/4,
                            fit: BoxFit.fill,
                          ),
                          InkWell(
                              onTap: () {
                                //Add MOVIE TO WATCH LIST
                              },
                              child: Image.asset("assets/images/add.png"))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          style: const TextStyle(color: colorIcon),
                          movieID.overview ?? "",
                          maxLines: 5,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${movieID.voteAverage}",
                              style: const TextStyle(color: colorIcon),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              const Text(
                "More Like This",
                style: TextStyle(color: yellowColor, fontSize: 18),
              ),
              Container(
                color: colorGray,
                height: MediaQuery.of(context).size.width/1.5,
                child: FutureBuilder<SimilarResponse>(
                  future: ApiManger.getSimilar(movieID: movieID.id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Something Went Wrong",
                              style: TextStyle(color: colorIcon),
                            ),
                          ],
                        ),
                      );
                    }
                    var similarData = snapshot.data?.results ?? [];

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemCount: similarData.length,
                      itemBuilder: (context, index) {
                        return SimilarItems(similarData[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
