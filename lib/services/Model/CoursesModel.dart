// {
//     "title": "",
//     "category": "",
//     "chapter": "",
//     "coverPic": "",
//     "description": "",
//     "publishDate": "",
//     "rating": 0.2,
//     "students": 0,
//     "publish": true,
//     "UID": "",
//     "FAQ": [
//         {
//             "question": "",
//             "answer": ""
//         }
//     ],
//     "price": "",
//     "duration": "",
//     "lecture": [
//         {
//             "title": "",
//             "duration": "",
//             "description": "",
//             "thumbnail": "",
//             "videoUrl": ""
//         }
//     ],
//     "assigment": [
//         {
//             "title": "",
//             "lastDate": "",
//             "description": "",
//             "thumbnail": "",
//             "fileUrl": ""
//         }
//     ]
// }
class CoursesModel {
  String? title;
  String? category;
  String? chapter;
  String? coverPic;
  String? description;
  String? publishDate;
  double? rating;
  int? students;
  bool? publish;
  String? uID;
  List<FAQ>? fAQ;
  String? price;
  String? duration;
  List<Lecture>? lecture;
  List<Assigment>? assigment;

  CoursesModel(
      {title,
      category,
      chapter,
      coverPic,
      description,
      publishDate,
      rating,
      students,
      publish,
      uID,
      fAQ,
      price,
      duration,
      lecture,
      assigment});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    chapter = json['chapter'];
    coverPic = json['coverPic'];
    description = json['description'];
    publishDate = json['publishDate'];
    rating = json['rating'] * 0.0;
    students = json['students'];
    publish = json['publish'];
    uID = json['UID'];
    if (json['FAQ'] != null) {
      fAQ = <FAQ>[];
      json['FAQ'].forEach((v) {
        fAQ!.add(FAQ.fromJson(v));
      });
    }
    price = json['price'];
    duration = json['duration'];
    if (json['lecture'] != null) {
      lecture = <Lecture>[];
      json['lecture'].forEach((v) {
        lecture!.add(Lecture.fromJson(v));
      });
    }
    if (json['assigment'] != null) {
      assigment = <Assigment>[];
      json['assigment'].forEach((v) {
        assigment!.add(Assigment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['category'] = category;
    data['chapter'] = chapter;
    data['coverPic'] = coverPic;
    data['description'] = description;
    data['publishDate'] = publishDate;
    data['rating'] = rating;
    data['students'] = students;
    data['publish'] = publish;
    data['UID'] = uID;
    if (fAQ != null) {
      data['FAQ'] = fAQ!.map((v) => v.toJson()).toList();
    }
    data['price'] = price;
    data['duration'] = duration;
    if (lecture != null) {
      data['lecture'] = lecture!.map((v) => v.toJson()).toList();
    }
    if (assigment != null) {
      data['assigment'] = assigment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FAQ {
  String? question;
  String? answer;

  FAQ({question, answer});

  FAQ.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}

class Lecture {
  String? title;
  String? duration;
  String? description;
  String? thumbnail;
  String? videoUrl;

  Lecture({title, duration, description, thumbnail, videoUrl});

  Lecture.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    duration = json['duration'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['duration'] = duration;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['videoUrl'] = videoUrl;
    return data;
  }
}

class Assigment {
  String? title;
  String? lastDate;
  String? description;
  String? thumbnail;
  String? fileUrl;

  Assigment({title, lastDate, description, thumbnail, fileUrl});

  Assigment.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    lastDate = json['lastDate'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['lastDate'] = lastDate;
    data['description'] = description;
    data['thumbnail'] = thumbnail;
    data['fileUrl'] = fileUrl;
    return data;
  }
}
