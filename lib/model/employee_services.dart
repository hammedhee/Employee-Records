import 'dart:developer';
import 'package:supabase_crud/model/crud_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmployeeServices {
  final supabasedata = Supabase.instance.client.from('workers');

  Future<List<CrudModel>> getAllData() async {
    try {
      final response = await supabasedata.select("*");
      log(response.toString());
      return response.map((e) => CrudModel.fromSupabase(e)).toList();
    } catch (e) {
      throw Exception("erorr on data fetching services erorrr = $e");
    }
  }

  Future<void> addData(CrudModel crudmodel) async {
    try {
      await supabasedata.insert([crudmodel.toSupabase()]);
      log('data added to supabase');
    } catch (e) {
      throw Exception("Erorr on add data services functione$e");
    }
  }

  Future<void> update(CrudModel model, int id) async {
    try {
      await supabasedata.update(model.toSupabase()).eq("id", id);
      log('data updatein this id  $id ');
    } catch (e) {
      throw Exception("Erorr on data updating $e");
    }
  }

  Future<void> deleteData(int id) async {
    try {
      await supabasedata.delete().eq("id", id);
      log("data deleted in this id $id");
    } catch (e) {
      throw Exception("erorr on delete services function $e");
    }
  }
}
