// ignore_for_file: library_private_types_in_public_api,
// ignore_for_file: use_build_context_synchronously

import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'restapi.dart';

class EmployeeFormAdd extends StatefulWidget {
  const EmployeeFormAdd({Key? key}) : super(key: key);

  @override
  _EmployeeFormAddState createState() => _EmployeeFormAddState();
}

class _EmployeeFormAddState extends State<EmployeeFormAdd> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final birtday = TextEditingController();
  final address = TextEditingController();
  String gender 'Male';

  late Future<DateTime?> selectedDate;
  String date = "-";

  DataService ds = DataService();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
      title: const Text("Employee Form Add"),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //name
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertikal: 16),
          child: TextField(
          controller: name,
          keyboardType:TextInputType.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Full Name'
          ),
        ),
      ),
      //Gender
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertikal: 16),
          child: DropdownButtonFormField(
            decoration: const InputDecoration(
              filled: false,
              border: InputBorder.none,
              ),
              value:gender,
              onChanged: (String? newValue){
                if (kDebugMode){
                  print(newValue);
                }

                setState(() {
                  gender = newValue!;
                });
              },
              items: <String>['Male','Female']
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
              }).toList())),
    ]

  }
}