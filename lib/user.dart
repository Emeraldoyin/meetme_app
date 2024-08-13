class User {
  final String name;
  final int age;
  final String? classLevel;
  final String? profilePicturePath;
  final List<String> hobbies;

  User({
    required this.name,
    required this.age,
    this.classLevel,
    this.profilePicturePath,
    required this.hobbies,
  });
}
