// {
//     "UID": "user.user!.uid",
//     "username": "name",
//     "email": "email",
//     "password": "password",
//     "firstName": "",
//     "lastName": "",
//     "profile": "",
//     "userType": "",
//     "gender": "",
//     "phoneNo": "",
//     "address": "",
//     "country": "",
//     "city": "",
//     "postalCode": "",
//     "bio": "",
//     "clas": "",
//     "educationSector": "",
//     "socialLinks": {
//         "facebook": "",
//         "instagram": "",
//         "twitter": ""
//     },
//     "buyCourses": [
//         ""
//     ]
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
  String? gender;
  String? phoneNo;
  String? address;
  String? country;
  String? city;
  String? postalCode;
  String? bio;
  String? clas;
  String? educationSector;
  SocialLinks? socialLinks;
  List<dynamic>? buyCourses;

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
      this.country,
      this.city,
      this.postalCode,
      this.bio,
      this.clas,
      this.educationSector,
      this.socialLinks,
      this.buyCourses});

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
    phoneNo = json['phoneNo'];
    address = json['address'];
    country = json['country'];
    city = json['city'];
    postalCode = json['postalCode'];
    bio = json['bio'];
    clas = json['clas'];
    educationSector = json['educationSector'];
    socialLinks = json['socialLinks'] != null
        ? new SocialLinks.fromJson(json['socialLinks'])
        : null;
    buyCourses = json['buyCourses'].cast<String>();
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
    data['phoneNo'] = this.phoneNo;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['postalCode'] = this.postalCode;
    data['bio'] = this.bio;
    data['clas'] = this.clas;
    data['educationSector'] = this.educationSector;
    if (this.socialLinks != null) {
      data['socialLinks'] = this.socialLinks!.toJson();
    }
    data['buyCourses'] = this.buyCourses;
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
