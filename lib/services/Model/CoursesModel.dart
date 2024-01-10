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
//     ],
//     "publisherData": {
//         "name": "",
//         "email": "",
//         "profile": ""
//     }
//     "studentProjects": [
//       {
//         "projectName": "",
//         "projectDescription": "",
//         "ProjectPhoto": ""
//       }
//     ]
// }
// ignore_for_file: prefer_collection_literals

// dynamic rating;
//   dynamic students;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education/services/Model/EbookModel.dart';

class CoursesModel {
  String? title;
  String? category;
  String? chapter;
  String? coverPic;
  String? description;
  String? publishDate;
  dynamic rating;
  dynamic students;
  bool? publish;
  String? uID;
  List<FAQ>? fAQ;
  String? price;
  String? duration;
  List<Lecture>? lecture;
  List<Assigment>? assigment;
  PublisherData? publisherData;
  List<StudentProjects>? studentProjects;

  CoursesModel(
      {this.title,
      this.category,
      this.chapter,
      this.coverPic,
      this.description,
      this.publishDate,
      this.rating,
      this.students,
      this.publish,
      this.uID,
      this.fAQ,
      this.price,
      this.duration,
      this.lecture,
      this.assigment,
      this.publisherData,
      this.studentProjects});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    chapter = json['chapter'];
    coverPic = json['coverPic'];
    description = json['description'];
    publishDate = json['publishDate'];
    rating = json['rating'];
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
    publisherData = json['publisherData'] != null
        ? PublisherData.fromJson(json['publisherData'])
        : null;
    if (json['studentProjects'] != null) {
      studentProjects = <StudentProjects>[];
      json['studentProjects'].forEach((v) {
        studentProjects!.add(StudentProjects.fromJson(v));
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
    if (publisherData != null) {
      data['publisherData'] = publisherData!.toJson();
    }
    if (studentProjects != null) {
      data['studentProjects'] =
          studentProjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FAQ {
  String? question;
  String? answer;

  FAQ({this.question, this.answer});

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

  Lecture(
      {this.title,
      this.duration,
      this.description,
      this.thumbnail,
      this.videoUrl});

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

  Assigment(
      {this.title,
      this.lastDate,
      this.description,
      this.thumbnail,
      this.fileUrl});

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

class StudentProjects {
  Timestamp? date;
  String? uid;
  String? name;
  String? description;
  List<String>? url;

  StudentProjects({this.date, this.uid, this.name, this.description, this.url});

  StudentProjects.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    uid = json['uid'];
    name = json['name'];
    description = json['description'];
    url = json['url'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = date;
    data['uid'] = uid;
    data['name'] = name;
    data['description'] = description;
    data['url'] = url;
    return data;
  }
}
