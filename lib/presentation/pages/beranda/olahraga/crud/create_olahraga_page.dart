import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_sport_apps/cubit/olahraga_cubit.dart';
import 'package:flutter_application_sport_apps/models/olahraga_model.dart';
import 'package:flutter_application_sport_apps/services/firebase_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../home_page.dart';

class UploadingImageToFirebaseStorage extends StatefulWidget {
  @override
  _UploadingImageToFirebaseStorageState createState() =>
      _UploadingImageToFirebaseStorageState();
}

class _UploadingImageToFirebaseStorageState
    extends State<UploadingImageToFirebaseStorage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController detailController = TextEditingController(text: '');
  File? _imageFile;
  UploadTask? task;
  File? file;

  ///NOTE: Only supported on Android & iOS
  ///Needs image_picker plugin {https://pub.dev/packages/image_picker}
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? (file!.path) : 'No File Selected';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create Olahraga'),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: detailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Detail Olahraga',
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('Select File Image Olahraga'),
                onPressed: selectFile,
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
              BlocConsumer<OlahragaCubit, OlahragaState>(
                listener: (context, state) {
                  if (state is OlahragaSuccess) {
                    Get.to(HomePage());
                  } else if (state is OlahragaFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(state.error),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is OlahragaLoading) {
                    return Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30),
                      child: const CircularProgressIndicator(),
                    );
                  }
                  return ElevatedButton(
                    child: Text('Create'),
                    onPressed: () async {
                      if (file == null) return;

                      final fileName = (file!.path);
                      final destination = 'files/$fileName';

                      task = FirebaseApi.uploadFile(destination, file!);
                      setState(() {});

                      if (task == null) return;

                      final snapshot = await task!.whenComplete(() {});
                      final urlDownload = await snapshot.ref.getDownloadURL();

                      context.read<OlahragaCubit>().createOlahraga(
                          OlahragaModel(
                              name: nameController.text,
                              detail: detailController.text,
                              imageUrl: urlDownload));
                      print('Download-Link: ');
                    },
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {}
}
