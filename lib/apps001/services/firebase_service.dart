import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService1 {
  // CREATE DATA EMPLOYEE
  Future addEmployee(Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Emlpoyee")
        .doc(id)
        .set(employeeInfoMap);
  }

  // GET DATA EMPLOYEE
  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Emlpoyee").snapshots();
  }

  // UPDATE DATA EMPLOYEE
  updateAttandance(String attendance, String id) async {
    return await FirebaseFirestore.instance
        .collection("Emlpoyee")
        .doc(id)
        .update({attendance: true});
  }

  // DELETE DATA EMPLOYEE
  deleteAttandance(String id) async {
    return await FirebaseFirestore.instance
        .collection("Emlpoyee")
        .doc(id)
        .delete();
  }
}
