import 'package:app_android_001/apps001/pages/add_employee.dart';
import 'package:app_android_001/apps001/services/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  Stream? employeeStream;

  @override
  void initState() {
    getOntheLoad();
    super.initState();
  }

  getOntheLoad() async {
    employeeStream = await FirebaseService1().getEmployeeDetails();
    setState(() {});
  }

  Widget showEpmloyeeList() {
    return StreamBuilder(
        stream: employeeStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Material(
                          elevation: 45.0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          shadowColor: Colors.red,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 20,
                            ),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Employee Name : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      ds["Name"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red,
                                        fontSize: 22,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          await FirebaseService1()
                                              .deleteAttandance(ds.id);
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Roll Number : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      ds["RollNo"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Age : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      ds["Age"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Attendance : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    ds["Present"] == false
                                        ? GestureDetector(
                                            onTap: () async {
                                              await FirebaseService1()
                                                  .updateAttandance(
                                                      "Present", ds.id);
                                            },
                                            child: Container(
                                              width: 30,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "P",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 30,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "P",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ds["Absen"] == false
                                        ? GestureDetector(
                                            onTap: () async {
                                              await FirebaseService1()
                                                  .updateAttandance(
                                                      "Absen", ds.id);
                                            },
                                            child: Container(
                                              width: 30,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "A",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 30,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "A",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container();
        });
  }

  Future<bool?> _showDeletConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue.shade50,
            title: Text("Delete Reminder"),
            content: Text("Apakah Anda Yakin ingin Menghapus Reminder ini?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("Batal"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddEmployee(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Employee",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Attandance",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              showEpmloyeeList(),
            ],
          ),
        ),
      ),
    );
  }
}
