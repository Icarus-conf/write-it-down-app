class UserModel {
  String? id;
  String? email;
  String? userName;

  UserModel({
    this.id,
    this.email,
    this.userName,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          email: json['email'],
          userName: json['userName'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'userName': userName,
    };
  }
}
