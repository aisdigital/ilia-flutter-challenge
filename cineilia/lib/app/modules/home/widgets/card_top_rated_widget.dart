import 'package:flutter/material.dart';
import 'package:teste_ilia/app/modules/home/models/filmes.dart';
import 'package:teste_ilia/app/modules/home/pages/detalhes/detalhes_page.dart';
import 'package:teste_ilia/app/shared/util/image_url_base.dart';

class CardTopRatedWidget extends StatelessWidget {
  final Filmes model;

  CardTopRatedWidget(this.model);


  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: model.id,
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetalhesPage(model))
            );  
          },
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(ImageUrlBase.imageUrlbase(model.posterPath), fit: BoxFit.cover, width: 1000.0),
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
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        model.originalTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )  
            )
          ),
        ),
      ),
    );
  }
}
