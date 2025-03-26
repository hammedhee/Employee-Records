class EmailAuthModel {
  String? email;
  String? password;

  EmailAuthModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }

  factory EmailAuthModel.formJson(Map<String, dynamic> json) {
    return EmailAuthModel(
      email: json["email"] as String,
      password: json["password"] as String,
    );
  }
}
