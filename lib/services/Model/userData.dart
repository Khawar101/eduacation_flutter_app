// {
//     "UID": "user.user!.uid",
//     "username": "name",
//     "email": "email",
//     "password": "password",
//     "firstName": "profile",
//     "lastName": "profile",
//     "profile": "profile"
// }

class userData {
  String? uID;
  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? profile;

  userData(
      {this.uID,
      this.username,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.profile});

  userData.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UID'] = this.uID;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['profile'] = this.profile;
    return data;
  }
}
