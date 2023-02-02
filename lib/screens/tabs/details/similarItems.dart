import 'package:flutter/material.dart';

import '../colors.dart';
import '../search/constant.dart';
import '../search/searchResponse.dart';
import 'detailsView.dart';

class SimilarItems extends StatelessWidget {
  Results similar;
 SimilarItems(this.similar);
  @override
  Widget build(BuildContext context) {
    return
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, MovieDetailsView.routeName,arguments:similar);
          },
          child: Container(

            width: MediaQuery.of(context).size.height/5,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 25),
                      blurRadius: 3,
                      spreadRadius: -10)
                ],
              color: Colors.grey.shade900,
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),

              border: Border.all(color: colorGray,)
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image.network(
                        "$baseUrlImage${similar.posterPath}",
                        height:MediaQuery.of(context).size.width/3 ,
                        width: MediaQuery.of(context).size.width/3,
                        fit: BoxFit.fill,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          //Add MOVIE TO WATCH LIST
                        },
                        child: Image.asset("assets/images/add.png"))
                  ],
                ),
                const SizedBox(height: 4,),
                Text(similar.title??"",style: const TextStyle(color: colorIcon,),maxLines: 2,),
                const SizedBox(height: 4,),
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
                      "${similar.voteAverage}",
                      style: const TextStyle(color: colorIcon),
                    ),
                  ],
                ),
                Text(similar.releaseDate?.substring(0,4)??"",style: TextStyle(color: colorIcon),)
            ]),
          ),
        );


  }
}
