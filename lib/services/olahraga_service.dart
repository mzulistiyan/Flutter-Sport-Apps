import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';
import 'package:intl/intl.dart';

class OlahragaService {
  CollectionReference _subscriptionReference =
      FirebaseFirestore.instance.collection('olahragas');

  Future<void> createOlahraga(
    OlahragaModel olahraga,
  ) async {
    try {
      _subscriptionReference.add({
        'imageUrl': olahraga.imageUrl,
        'name': olahraga.name,
        'detail': olahraga.detail,
      }).then((value) => print('Success'));
    } catch (e) {
      throw e;
    }
  }

  Future<List<OlahragaModel>> fetchOlahraga() async {
    try {
      QuerySnapshot result = await _subscriptionReference.get();
      List<OlahragaModel> foods = result.docs.map((e) {
        return OlahragaModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return foods;
    } catch (e) {
      rethrow;
    }
  }
}
