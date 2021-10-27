import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:teste_ilia/app/modules/home/controller/home_controller.dart';
import 'package:teste_ilia/app/modules/home/models/filmes.dart';
import 'package:teste_ilia/app/modules/home/pages/seach/seach_page.dart';
import 'package:teste_ilia/app/modules/home/service/home_service.dart';
import 'package:teste_ilia/app/modules/home/widgets/card_filmes_widget.dart';
import 'package:teste_ilia/app/modules/home/widgets/card_top_rated_widget.dart';
import 'package:teste_ilia/app/shared/exception/public_message.dart';
import 'package:teste_ilia/app/shared/widgets/shader_widget.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomeController _controller = HomeController(service: HomeService());

  @override
  void initState() {
    super.initState();
    getFilmesPopular();
    getFilmesRated();
  }

  getFilmesPopular() async {
    try {
      await _controller.getFilmesPopular();
    } on PublicMessageException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
        backgroundColor: Colors.red,
      ));
    }
  }
  getFilmesRated() async {
    try {
      await _controller.getFilmesRated();
    } on PublicMessageException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderWidget(
                    child: const Text('Ília filmes',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )
                    )
                  ),
                  ShaderWidget(
                    child: IconButton(
                      onPressed: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => PesquisaPage())
                        );
                      },
                      iconSize: 30,
                      color: Colors.white, 
                      icon: Icon(Icons.search)
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 20,
              ),

              Text('Filmes Top Rated',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 200,
                  child: StreamBuilder<List<Filmes>>(
                    stream: _controller.filmesRatedOut,
                    builder: (context, snapshot) {
                      if(!snapshot.hasData){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Filmes> dados = snapshot.data;

                      return CarouselSlider.builder(
                        itemCount: dados.length, 
                        itemBuilder: (context,index,i){
                          return CardTopRatedWidget(dados[index]);
                        }, 
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                        ),
                      );
                    }
                  ),
                ),
              ),              
              Text('Filmes populares',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder<List<Filmes>>(
                  stream: _controller.filmesPopularOut,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    List<Filmes> dados = snapshot.data;

                    return ListView.builder(
                      itemCount: dados.length,
                      itemBuilder: (contex,index){
                        return CardFilmesWidget(dados[index]);
                      },
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}