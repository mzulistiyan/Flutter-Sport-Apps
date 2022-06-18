import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';
import 'package:flutter_application_sport_apps/presentation/pages/beranda/olahraga/crud/update_olahraga_page.dart';
import 'package:get/route_manager.dart';

class OlahragaCard extends StatelessWidget {
  final OlahragaModel olahraga;
  OlahragaCard(this.olahraga);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(UpdateOlahragaPage(olahraga));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.network(
          olahraga.imageUrl.toString(),
          width: 100,
          height: 150,
        ),
      ),
    );
  }
}
