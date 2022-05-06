// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class DriverRegistrationPage extends StatefulWidget {
  const DriverRegistrationPage({Key? key}) : super(key: key);

  @override
  State<DriverRegistrationPage> createState() => _DriverRegistrationPageState();
}

class _DriverRegistrationPageState extends State<DriverRegistrationPage> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController driverID = TextEditingController();
  TextEditingController carNumber = TextEditingController();
  String _dropdownValue = "Mini";
  File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Registration"),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              profileImage != null
                  ? Container(
                      width: 176,
                      height: 176,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: FileImage(profileImage!)),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff99d4ff), Color(0xff6d6aef)],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(18)),
                        onPressed: () {
                          pickImage();
                        },
                        child: const Icon(Icons.brush),
                      ).objectBottomRight(),
                    )
                  : Container(
                      width: 176,
                      height: 176,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff99d4ff), Color(0xff6d6aef)],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(18)),
                        onPressed: () {
                          pickImage();
                        },
                        child: const Icon(Icons.image),
                      ).objectBottomRight(),
                    ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                controller: nameInput,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ).pOnly(left: 36, right: 36),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: driverID,
                decoration: const InputDecoration(
                  hintText: 'Driver ID',
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ).pOnly(left: 36, right: 36),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              TextFormField(
                controller: carNumber,
                decoration: const InputDecoration(
                  hintText: 'Car Number',
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ).pOnly(left: 36, right: 36),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              DropdownButtonFormField(
                style: const TextStyle(fontSize: 18, color: Colors.black),
                items: const [
                  DropdownMenuItem(child: Text("Mini"), value: "Mini"),
                  DropdownMenuItem(child: Text("Sedan"), value: "Sedan"),
                  DropdownMenuItem(child: Text("SUV"), value: "SUV"),
                ],
                value: _dropdownValue,
                onChanged: dropdownCallback,
                isExpanded: true,
                isDense: true,
              ).pOnly(left: 36, right: 36),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              SizedBox(
                width: 250,
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(33),
                        color: const Color(0xff6895fb),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(
                            child: Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void dropdownCallback(String? value) {
    if (value is String) {
      setState(() {
        _dropdownValue = value;
      });
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }

      final imageTemp = File(image.path);
      setState(() {
        profileImage = imageTemp;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }
}
