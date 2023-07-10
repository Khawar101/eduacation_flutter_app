// {
//     "courseKey": "",
//     "key": "",
//     "progress": 4.3,
//     "courseName": "",
//     "rating": 4.3,
//     "startDate": "",
//     "endDate": "",
//     "userKey": "",
//     "lecture": [
//         ""
//     ]
// }

class ReportModel {
  String? courseKey;
  String? key;
  dynamic progress;
  String? courseName;
  double? rating;
  dynamic startDate;
  dynamic endDate;
  String? userKey;
  List<String>? lecture;

  ReportModel(
      {courseKey,
      key,
      progress,
      courseName,
      rating,
      startDate,
      endDate,
      userKey,
      lecture});

  ReportModel.fromJson(Map<String, dynamic> json) {
    courseKey = json['courseKey'];
    key = json['key'];
    progress = json['progress'];
    courseName = json['courseName'];
    rating = json['rating'] * 0.0;
    startDate = json['startDate'];
    endDate = json['endDate'];
    userKey = json['userKey'];
    lecture = json['lecture'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['courseKey'] = courseKey;
    data['key'] = key;
    data['progress'] = progress;
    data['courseName'] = courseName;
    data['rating'] = rating;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['userKey'] = userKey;
    data['lecture'] = lecture;
    return data;
  }
}
