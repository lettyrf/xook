import 'package:flutter/material.dart';

class BookReader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva pantalla'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
          child: Center(
            child: Text('Contenido nueva pantalla'),
          )
      ),
    );
  }

}