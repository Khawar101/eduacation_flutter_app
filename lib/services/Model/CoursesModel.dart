// {
//     "title": "",
//     "category": "",
//     "chapter": "",
//     "coverPic": "",
//     "description": "",
//     "publishDate": "",
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
// }
class CoursesModel {
  String? title;
  String? category;
  String? chapter;
  String? coverPic;
  String? description;
  String? publishDate;
  String? uID;
  List<FAQ>? fAQ;
  String? price;
  String? duration;
  List<Lecture>? lecture;
  List<Assigment>? assigment;
  PublisherData? publisherData;

  CoursesModel(
      {this.title,
        this.category,
        this.chapter,
        this.coverPic,
        this.description,
        this.publishDate,
        this.uID,
        this.fAQ,
        this.price,
        this.duration,
        this.lecture,
        this.assigment,
        this.publisherData});

  CoursesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    chapter = json['chapter'];
    coverPic = json['coverPic'];
    description = json['description'];
    publishDate = json['publishDate'];
    uID = json['UID'];
    if (json['FAQ'] != null) {
      fAQ = <FAQ>[];
      json['FAQ'].forEach((v) {
        fAQ!.add(new FAQ.fromJson(v));
      });
    }
    price = json['price'];
    duration = json['duration'];
    if (json['lecture'] != null) {
      lecture = <Lecture>[];
      json['lecture'].forEach((v) {
        lecture!.add(new Lecture.fromJson(v));
      });
    }
    if (json['assigment'] != null) {
      assigment = <Assigment>[];
      json['assigment'].forEach((v) {
        assigment!.add(new Assigment.fromJson(v));
      });
    }
    publisherData = json['publisherData'] != null
        ? new PublisherData.fromJson(json['publisherData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['category'] = this.category;
    data['chapter'] = this.chapter;
    data['coverPic'] = this.coverPic;
    data['description'] = this.description;
    data['publishDate'] = this.publishDate;
    data['UID'] = this.uID;
    if (this.fAQ != null) {
      data['FAQ'] = this.fAQ!.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['duration'] = this.duration;
    if (this.lecture != null) {
      data['lecture'] = this.lecture!.map((v) => v.toJson()).toList();
    }
    if (this.assigment != null) {
      data['assigment'] = this.assigment!.map((v) => v.toJson()).toList();
    }
    if (this.publisherData != null) {
      data['publisherData'] = this.publisherData!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['answer'] = this.answer;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['videoUrl'] = this.videoUrl;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['lastDate'] = this.lastDate;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['fileUrl'] = this.fileUrl;
    return data;
  }
}

class PublisherData {
  String? name;
  String? email;
  String? profile;

  PublisherData({this.name, this.email, this.profile});

  PublisherData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['profile'] = this.profile;
    return data;
  }
}
