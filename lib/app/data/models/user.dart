User? user ;

class User {
  final String name;
  final String profilePhoto;
  final String location;
  final String phone;
  final String age;
  final String password;
  final String gender;

  User(
      {required this.name,
      required this.profilePhoto,
      required this.age,
      required this.location,
      required this.password,
      required this.phone,
      required this.gender});
}
