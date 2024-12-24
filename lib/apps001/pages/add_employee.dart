import 'package:app_android_001/apps001/homepage1.dart';
import 'package:app_android_001/apps001/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    "Add",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Employee",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Text(
                  "Employee Name",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Employee Name"),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Text(
                  "Employee Age",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: TextFormField(
                    controller: _ageController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Employee Age"),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Text(
                  "Employee Roll Number",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: TextFormField(
                    controller: _rollController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Employee Roll Number"),
                  ),
                ),
              ),
              SizedBox(
                height: 65,
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: EdgeInsets.only(
                      right: 90,
                      left: 90,
                      top: 13,
                      bottom: 13,
                    ),
                  ),
                  onPressed: () async {
                    if (_nameController.text.isNotEmpty &&
                        _ageController.text.isNotEmpty &&
                        _rollController.text.isNotEmpty) {
                      String addID = randomAlphaNumeric(10);
                      Map<String, dynamic> EmployeeInfoMap = {
                        "Name": _nameController.text,
                        "Age": _ageController.text,
                        "RollNo": _rollController.text,
                        "Absen": false,
                        "Present": false,
                      };
                      await FirebaseService1()
                          .addEmployee(EmployeeInfoMap, addID)
                          .then((value) {
                        _nameController.text = "";
                        _ageController.text = "";
                        _rollController.text = "";
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Employee Data Berhasil Di Upload",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => Homepage1()),
                          (route) => false);
                    }
                  },
                  label: Text(
                    "Add Employee",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
