// ignore_for_file: library_private_types_in_public_api,
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:office/employee_model.dart';
import 'restapi.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  EmployeeListState createState() => EmployeeListState();
}

class EmployeeListState extends State<EmployeeList> {
  DataService ds = DataService();

  List data= [];
  List<EmployeeModel> employee = [];

  selectAllEmployee async {
    data = jsonDecode(await ds.selectAll('6347712099b6c11c094bd757', 'office',
        'employee', '63476b4099b6c11c094bd50d'));
    employee = data.map((e) => EmployeeModel.fromJson(e)).toList();
    setState((){
      employee = employee;
    })

    if(kDebugMode){
      print(employee.length);
      print(data);
    }
  }

  @override
  void initState(){
    selectAllEmployee();

    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee List"),
        actions: <Widget>[
          Padding(padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'employee_form_add');
            },
            child: const Icon(
              Icons.add,
              size: 26.0,
            ),
          )),
        ],
      ),
      body: ListView.builder(
        itemCount: employee.length,
        itemBuilder: (context, index) {
        final item = employee[index];

        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.birthday),
          );
      })
    );
  }
}

