
class ModelUser {
  final String phone;
  final String username;
  final String email;

  const ModelUser({
    required this.phone,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "username": username,
        "email": email,
      };
}
