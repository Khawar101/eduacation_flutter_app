// {
//     "UID": "user.user!.uid",
//     "username": "name",
//     "email": "email",
//     "password": "password",
//     "firstName": "",
//     "lastName": "",
//     "profile": "",
//     "userType": "",
//     "gender": true,
//     "PhoneNo": "",
//     "address": "",
//     "clas": "",
//     "educationSector": "",
//     "SocialLinks": {
//         "facebook": "",
//         "instagram": "",
//         "twitter": ""
//     }
// }


class userData {
  String? uID;
  String? username;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? profile;
  String? userType;
  bool? gender;
  String? phoneNo;
  String? address;
  String? clas;
  String? educationSector;
  SocialLinks? socialLinks;

  userData(
      {this.uID,
      this.username,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.profile,
      this.userType,
      this.gender,
      this.phoneNo,
      this.address,
      this.clas,
      this.educationSector,
      this.socialLinks});

  userData.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    profile = json['profile'];
    userType = json['userType'];
    gender = json['gender'];
    phoneNo = json['PhoneNo'];
    address = json['address'];
    clas = json['clas'];
    educationSector = json['educationSector'];
    socialLinks = json['SocialLinks'] != null
        ? new SocialLinks.fromJson(json['SocialLinks'])
        : null;
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
    data['userType'] = this.userType;
    data['gender'] = this.gender;
    data['PhoneNo'] = this.phoneNo;
    data['address'] = this.address;
    data['clas'] = this.clas;
    data['educationSector'] = this.educationSector;
    if (this.socialLinks != null) {
      data['SocialLinks'] = this.socialLinks!.toJson();
    }
    return data;
  }
}

class SocialLinks {
  String? facebook;
  String? instagram;
  String? twitter;

  SocialLinks({this.facebook, this.instagram, this.twitter});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    return data;
  }
}
