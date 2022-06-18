import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_sport_apps/models/course_model.dart';
import 'package:flutter_application_sport_apps/services/course_service.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  void createCourse(
    CourseModel course,
  ) async {
    try {
      emit(CourseLoading());
      await CourseService().createCourse(
        course,
      );
      emit(CourseSuccess(const []));
    } catch (e) {
      emit(CourseFailed(e.toString()));
    }
  }

  void fetchCourse() async {
    try {
      emit(CourseLoading());

      List<CourseModel> foods = await CourseService().fetchCourse();

      emit(CourseSuccess(foods));
    } catch (e) {
      emit(CourseFailed(e.toString()));
    }
  }

  void updateCourse(String docid, CourseModel course) async {
    try {
      emit(CourseLoading());
      await CourseService().updateCourse(docid, course);
      emit(CourseSuccess([]));
    } catch (e) {
      emit(CourseFailed(e.toString()));
    }
  }

  void deleteCourse(String docid) async {
    try {
      emit(CourseLoading());
      await CourseService().deleteCourse(docid);
      emit(CourseSuccess([]));
    } catch (e) {
      emit(CourseFailed(e.toString()));
    }
  }
}
