class User {
  final String name;
  final String profilePicture;

  User(this.name, this.profilePicture);

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        profilePicture = json["profile_picture"];
}
