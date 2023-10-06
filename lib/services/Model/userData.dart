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
//     "status": true,
//     "educationSector": "",
//     "socialLinks": {
//         "facebook": "",
//         "instagram": "",
//         "twitter": ""
//     },
//     "buyCourses": [
//     ""
//     ],
//     "buyEBooks": [
// ""
//     ],
//     "favoriteCourses": [
// ""
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
  bool? status;
  String? educationSector;
  SocialLinks? socialLinks;
  List<dynamic>? buyCourses;
  List<dynamic>? buyEBooks;
  List<dynamic>? favoriteCourses;

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
      this.status,
      this.educationSector,
      this.socialLinks,
      this.buyCourses,
      this.buyEBooks,
      this.favoriteCourses});

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
    status = json['status'];
    educationSector = json['educationSector'];
    socialLinks = json['socialLinks'] != null
        ?  SocialLinks.fromJson(json['socialLinks'])
        : null;
    buyCourses =
        json['buyCourses'] != null ? json['buyCourses'].cast<dynamic>() : null;
    buyEBooks =
        json['buyEBooks'] != null ? json['buyEBooks'].cast<dynamic>() : null;
    favoriteCourses = json['favoriteCourses'] != null
        ? json['favoriteCourses'].cast<dynamic>()
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
    data['phoneNo'] = this.phoneNo;
    data['address'] = this.address;
    data['country'] = this.country;
    data['city'] = this.city;
    data['postalCode'] = this.postalCode;
    data['bio'] = this.bio;
    data['clas'] = this.clas;
    data['status'] = this.status;
    data['educationSector'] = this.educationSector;
    if (this.socialLinks != null) {
      data['socialLinks'] = this.socialLinks!.toJson();
    }
    data['buyCourses'] = this.buyCourses;
    data['buyEBooks'] = this.buyEBooks;
    data['favoriteCourses'] = this.favoriteCourses;
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
