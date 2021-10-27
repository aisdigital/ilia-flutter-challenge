import 'package:flutter/material.dart';
import 'package:teste_ilia/app/modules/home/controller/home_controller.dart';
import 'package:teste_ilia/app/modules/home/models/filmes.dart';
import 'package:teste_ilia/app/modules/home/service/home_service.dart';
import 'package:teste_ilia/app/modules/home/widgets/card_filmes_widget.dart';
import 'package:teste_ilia/app/shared/exception/public_message.dart';

class PesquisaPage extends StatefulWidget {

  @override
  _PesquisaPageState createState() => _PesquisaPageState();
}

class _PesquisaPageState extends State<PesquisaPage> {
  HomeController _controller = HomeController(service: HomeService());
  List<Filmes> _allFilmes = [];
  List<Filmes> _filtroFilmes = [];
  @override
  void initState() {
    super.initState();
    getDados();
  }
  getDados() async {
    _allFilmes = await _controller.getFilmesSeachPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(12)
          ),
          child: Container(
            alignment: Alignment.centerLeft,
            color: Colors.white,
            child: TextField(
              autofocus: true,
              onChanged: (value) => onSearchTextChanged(value),
              decoration: const InputDecoration(
                labelText: 'Pesquisar Filmes', 
                suffixIcon: Icon(Icons.search),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(20)
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _filtroFilmes.isNotEmpty
                ? ListView.builder(
                    itemCount: _filtroFilmes.length,
                    itemBuilder: (context, index) {
                      return CardFilmesWidget(_filtroFilmes[index]);
                    }
                  )
                : const Center(
                  child: Text(
                      'Sem resultados',
                      style: TextStyle(fontSize: 24),
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }


  onSearchTextChanged(String text) async {
    List<Filmes> results = [];
    if (text.isEmpty) {
      results = _allFilmes;
    } else {
      results = _allFilmes.where((user) =>
        user.originalTitle.toLowerCase().contains(text.toLowerCase())).toList();
    }
    setState(() {
      _filtroFilmes = results;
    });
  }
}