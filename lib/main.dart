import 'package:flutter/material.dart';

import 'package:pertemuan4/employee_form_add.dart';
import 'package:pertemuan4/employee_list.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Learn Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmployeeList(),
      routes: {
        'employee_list': (context) => const EmployeeList(),
        'employee_form_add': (context) => const EmployeeFormAdd()
      },
    );
  }
}