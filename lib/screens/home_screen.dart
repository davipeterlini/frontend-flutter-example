import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  // Lista de nomes de arquivos de imagens armazenadas nos assets
  final List<String> imgList = [
    'images/car1.png',
    'images/car2.png',
    'images/car3.png', // Adicione ou substitua pelos nomes de arquivo das suas imagens
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Vehicle'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Carousel Slider para banners
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imgList
                  .map((item) => Container(
                        child: Center(
                            // Usa Image.asset para carregar a imagem dos assets
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 1000)),
                      ))
                  .toList(),
            ),
            // Seção para carros em destaque
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Featured Cars',
                    style: Theme.of(context).textTheme.headline5),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // para desativar a rolagem do GridView
              crossAxisCount: 2,
              children: List.generate(3, (index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      // Trate aqui seu clique
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 18 / 11,
                          child: Image.asset(
                            'images/car${index + 1}.png', // Substitua com os nomes de arquivo corretos
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Car ${index + 1}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.0),
                              Text('Price: \$${(index + 1) * 10000}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
