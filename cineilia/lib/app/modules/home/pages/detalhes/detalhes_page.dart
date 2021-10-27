import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:teste_ilia/app/modules/home/models/filmes.dart';
import 'package:teste_ilia/app/shared/util/image_url_base.dart';
import 'package:url_launcher/url_launcher.dart';
class DetalhesPage extends StatefulWidget {
  final Filmes model;
  DetalhesPage(this.model);
  @override
  DetalhesPageState createState() => DetalhesPageState();
}
class DetalhesPageState extends State <DetalhesPage> {

 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.model.id,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ImageUrlBase.imageUrlbase(widget.model.posterPath))
                        )
                      ),   
                    )
                  ),
                  Positioned(
                    left: 15,
                    top: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32)
                      ),
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios)
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 15,
                    child: Text(
                      'Detalhes',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: AutoSizeText(
                      widget.model.originalTitle,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        inherit: false,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 30,
              ),
              Text(
                'OverView',
                style: TextStyle(
                  fontSize: 30,
                )
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      widget.model.overview,
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _youtubePlayerTrailer(widget.model.originalTitle);
        }, 
        label: Text('Reproduzir trailer')
      ),
    );
  }

  _youtubePlayerTrailer(String titleSeach) async {
    String urlSeach = 'https://www.youtube.com/results?search_query=$titleSeach+trailer';
    await launch(urlSeach);
  }
}