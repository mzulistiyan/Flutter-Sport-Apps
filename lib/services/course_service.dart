import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_sport_apps/models/course_model.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';
import 'package:intl/intl.dart';

class CourseService {
  static String? uid;
  CollectionReference _courseReference =
      FirebaseFirestore.instance.collection('courses');

  Future<void> createCourse(
    CourseModel olahraga,
  ) async {
    try {
      _courseReference.add({
        'imageUrl': olahraga.imageUrl,
        'name': olahraga.name,
        'detail': olahraga.detail,
      }).then((value) => print('Success ' + value.id));
    } catch (e) {
      throw e;
    }
  }

  Future<List<CourseModel>> fetchCourse() async {
    try {
      QuerySnapshot result = await _courseReference.get();
      List<CourseModel> course = result.docs.map((e) {
        return CourseModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return course;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCourse(String docid, CourseModel course) async {
    try {
      return _courseReference
          .doc(docid)
          .update({
            'name': course.name,
            'detail': course.detail,
          })
          .then((value) => print("Course Updated"))
          .catchError((error) => print("Failed to update data: $error"));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCourse(String docid) async {
    try {
      return _courseReference
          .doc(docid)
          .delete()
          .then((value) => print("Deleted"))
          .catchError((error) => print("Failed to update data: $error"));
    } catch (e) {
      rethrow;
    }
  }
}
