class FriendObject {
  late final int id;
  late final String name;
  late final String email;
  late final String phone;
  late final String picture;

  FriendObject(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.picture});

  FriendObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        email = res['email'],
        phone = res['phone'],
        picture = res['picture'];
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'picture': picture,
    };
  }
}
