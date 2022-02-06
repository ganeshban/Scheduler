class ModelUser {
  final String phone;
  final String username;
  final String email;
  final String userid;

  const ModelUser(
      {required this.phone,
      required this.username,
      required this.email,
      required this.userid});

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "username": username,
        "email": email,
        "userid": userid,
      };
}
