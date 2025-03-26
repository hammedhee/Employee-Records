import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_crud/model/crud_model.dart';
import 'package:supabase_crud/model/employee_services.dart';

class Employeeprovider extends ChangeNotifier {
  EmployeeServices services = EmployeeServices();
  List<CrudModel> dataListpro = [];

  Future<void> getData() async {
    try {
      dataListpro = await services.getAllData();
      notifyListeners();
    } catch (e) {
      log("Erorr on getdata provider$e");
    }
  }

  Future<void> addDtataPro(CrudModel model) async {
    try {
      await services.addData(model);
      log('added in provider${dataListpro.length}');
      getData();
      notifyListeners();
    } catch (e) {
      log('Erorr on add Function provider $e');
    }
  }

  Future<void> updatdataPro(CrudModel model, int id) async {
    try {
      await services.update(model, id);
      getData();
      notifyListeners();
      log('data updated in pro $id');
    } catch (e) {
      log('Erorr on data updating provider pro $e');
    }
  }

  Future<void> deleteDataPro(int id) async {
    try {
      await services.deleteData(id);
      getData();
      notifyListeners();
      log('data deleted function$id');
    } catch (e) {
      log('Erorr on data deleting provider function$e');
    }
  }
}
