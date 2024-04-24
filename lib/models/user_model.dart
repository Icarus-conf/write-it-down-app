class UserModel {
  String? id;
  String? email;
  String? userName;
  String? imageUrl;

  UserModel({
    this.id,
    this.email,
    this.userName,
    this.imageUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          email: json['email'],
          userName: json['userName'],
          imageUrl: json['imageUrl'],
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'userName': userName,
      'imageUrl': imageUrl,
    };
  }
}
