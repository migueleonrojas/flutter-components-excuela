import 'package:flutter/material.dart';

class EducationalCard extends StatelessWidget {

  final String urlImage;
  final String title;
  final String description;
  final String tag;
  

  EducationalCard({
    required this.urlImage, 
    required this.title, 
    required this.description, 
    required this.tag,
  
  });


  @override
  Widget build(BuildContext context) {

    return ListTile(
      leading:  Hero(
        tag: tag,
        child: BoxWidget(size: Size(50.0, 50.0)),
      ),
      onTap: () => _gotoDetailsPage(context),
      title: const Text(
        'Tap on the icon to view hero animation transition.',
      ),
    );
  }
  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        body: Center(
          child: Hero(
              tag: tag,
              child: BoxWidget(size: Size(100.0, 50.0)),
            ),
        ),
      ),
      
    ));
  }


}

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}