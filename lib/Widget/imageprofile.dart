// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:credit/constants.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImageProfile extends StatefulWidget {
  const ImageProfile({Key? key}) : super(key: key);
  @override
  _ImageProfile createState() => _ImageProfile();
}

class _ImageProfile extends State<ImageProfile> {
  File? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 71,
                backgroundColor: kPrimaryColor,
                child: CircleAvatar(
                  radius: 70,
                  // ignore: unnecessary_null_comparison
                  backgroundImage:
                      // ignore: unnecessary_null_comparison
                      _pickedImage == null ? null : FileImage(_pickedImage!),
                ),
              ),
              Positioned(
                  top: 90,
                  left: 70,
                  child: RawMaterialButton(
                    elevation: 10,
                    fillColor: kPrimaryColor,
                    child: const Icon(Icons.add_a_photo),
                    padding: const EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((build) => bottomSheet()),
                      );
                    },
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickeImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    final pickImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickImageFile;
    });
  }

  Future<void> _pickeImageGalery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickImageFile;
    });
  }

  void _remove() {
    setState(() {
      _pickedImage = null;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  _pickeImageCamera();
                },
                icon: Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              FlatButton.icon(
                onPressed: () {
                  _pickeImageGalery();
                },
                icon: Icon(Icons.image),
                label: const Text("Galery"),
              ),
              FlatButton.icon(
                onPressed: () {
                  _remove();
                },
                icon: Icon(Icons.remove_circle),
                label: const Text("Remove"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
