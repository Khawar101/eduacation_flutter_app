// {
//     "UID": "user.user!.uid",
//     "username": "name",
//     "email": "email",
//     "password": "password",
//     "firstName": "profile",
//     "lastName": "profile",
//     "profile": "profile",
//     "gender": "profile"
// }

// ignore_for_file: camel_case_types

class userData {
  String? uID;
  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? profile;
  String? gender;

  userData(
      {this.uID,
      this.username,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.profile,
      this.gender});

  userData.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profile = json['profile'];
    gender = json['gender'];
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
    data['gender'] = this.gender;
    return data;
  }
}
