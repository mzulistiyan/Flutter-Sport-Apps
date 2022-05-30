import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';

class OlahragaCard extends StatelessWidget {
  final OlahragaModel olahraga;
  OlahragaCard(this.olahraga);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(
        olahraga.imageUrl.toString(),
        width: 100,
        height: 150,
      ),
    );
  }
}
