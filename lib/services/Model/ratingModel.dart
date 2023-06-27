// {
//     "UID": "_userData.uID",
//     "courseKey": "courseData.publishDate",
//     "name": "_userData.username",
//     "profile": "_userData.profile",
//     "review": "review",
//     "date": "review",
//     "rateting": 6.3
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel {
  String? uID;
  String? courseKey;
  String? name;
  String? profile;
  String? review;
  Timestamp? date;
  double? rateting;

  RatingModel(
      {this.uID,
      this.courseKey,
      this.name,
      this.profile,
      this.review,
      this.date,
      this.rateting});

  RatingModel.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    courseKey = json['courseKey'];
    name = json['name'];
    profile = json['profile'];
    review = json['review'];
    date = json['date'];
    rateting = json['rateting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UID'] = this.uID;
    data['courseKey'] = this.courseKey;
    data['name'] = this.name;
    data['profile'] = this.profile;
    data['review'] = this.review;
    data['date'] = this.date;
    data['rateting'] = this.rateting;
    return data;
  }
}
