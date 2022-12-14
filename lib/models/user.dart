class User {
  String id, name, mobile, email, room, roll, image, token;
  User({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.room,
    required this.roll,
    required this.image,
    required this.token,
  });

  factory User.fromJson(Map<String, String> json) {
    return User(
      id: json['_id']!,
      name: json['name']!,
      email: json['email']!,
      roll: json['roll']!,
      room: json['room']!,
      image: json['image']!,
      mobile: json['mobile']!,
      token: json['token']!,
    );
  }
}
