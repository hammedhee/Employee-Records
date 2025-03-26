class CrudModel {
  int? id;
  String? name;
  String? position;
  String? imagePath;
  String? phone;
  String? salary;

  CrudModel({
    this.id,
    this.phone,
    this.imagePath,
    required this.salary,
    required this.name,
    required this.position,
  });

  factory CrudModel.fromSupabase(Map<String, dynamic> supabase) {
    return CrudModel(
      salary: supabase['sallery'],
      imagePath: supabase['imagePath'],
      phone: supabase['phone'],
      name: supabase['name'],
      position: supabase['position'],
      id: supabase['id'],
    );
  }

  Map<String, dynamic> toSupabase() {
    return {
      "sallery": salary,
      "name": name,
      "position": position,
      "imagePath": imagePath,
      "phone": phone,
    };
  }
}
