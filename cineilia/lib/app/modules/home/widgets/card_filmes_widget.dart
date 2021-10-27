import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:teste_ilia/app/modules/home/models/filmes.dart';
import 'package:teste_ilia/app/modules/home/pages/detalhes/detalhes_page.dart';
import 'package:teste_ilia/app/shared/util/image_url_base.dart';

class CardFilmesWidget extends StatelessWidget {
  final Filmes model;
  CardFilmesWidget(this.model);
  
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: model.id,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetalhesPage(model))
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 2),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(ImageUrlBase.imageUrlbase(model.posterPath))
                )
              ),
              child: Stack(
                children: [

                  Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Row(
                        children: [
                          Text(model.voteAverage.toString()),
                          Icon(Icons.star)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 140,left: 10,right: 10),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)
                        )
                      ),
                      child: AutoSizeText(
                        model.originalTitle,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}