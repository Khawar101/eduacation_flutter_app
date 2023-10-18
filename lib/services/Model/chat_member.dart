// [
//     {
//         "Date": "1695365266592000",
//         "id" :"",
//         "group": {
//             "key": "1688647816394000",
//             "name": "Flutter",
//             "profile": "3700"
//         },
//         "lastMessage": {
//             "Date": "1695365257455000",
//             "SMS": "Hey",
//             "UID": "ShnLNiM7NueTHrolnEtrv7oNa2Y2",
//             "type": "text"
//         },
//         "membersUid": [
//             "",
//             ""
//         ],
//         "member": [
//             {
//                 "UID": "ShnLNiM7NueTHrolnEtrv7oNa2Y2",
//                 "name": "Khawar jutt",
//                 "profile": "https://images.pexels.com/photos/908714/pexels-photo-908714.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"
//             },
//             {
//                 "UID": "ShnLNiM7NueTHrolnEtrv7oNa2Y2",
//                 "name": "Khawar jutt",
//                 "profile": "https://images.pexels.com/photos/908714/pexels-photo-908714.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"
//             }
//         ]
//     }
// ]
class ChatMember {
  String? date;
  Group? group;
  LastMessage? lastMessage;
  List<String>? membersUid;
  List<Member>? member;

  ChatMember(
      {this.date, this.group, this.lastMessage, this.membersUid, this.member});

  ChatMember.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    group = json['group'] != null ? Group.fromJson(json['group']) : null;
    lastMessage = json['lastMessage'] != null
        ? LastMessage.fromJson(json['lastMessage'])
        : null;
    membersUid = json['membersUid'].cast<String>();
    if (json['member'] != null) {
      member = <Member>[];
      json['member'].forEach((v) {
        member!.add(Member.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
    if (group != null) {
      data['group'] = group!.toJson();
    }
    if (lastMessage != null) {
      data['lastMessage'] = lastMessage!.toJson();
    }
    data['membersUid'] = membersUid;
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Group {
  String? key;
  String? name;
  String? profile;

  Group({this.key, this.name, this.profile});

  Group.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['profile'] = profile;
    return data;
  }
}

class LastMessage {
  String? date;
  String? sMS;
  String? uID;
  String? type;

  LastMessage({this.date, this.sMS, this.uID, this.type});

  LastMessage.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    sMS = json['SMS'];
    uID = json['UID'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
    data['SMS'] = sMS;
    data['UID'] = uID;
    data['type'] = type;
    return data;
  }
}

class Member {
  String? uID;
  String? name;
  String? profile;

  Member({this.uID, this.name, this.profile});

  Member.fromJson(Map<String, dynamic> json) {
    uID = json['UID'];
    name = json['name'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UID'] = uID;
    data['name'] = name;
    data['profile'] = profile;
    return data;
  }
}

class GropuProfile {
  String? profile;

  GropuProfile({this.profile});

  GropuProfile.fromJson(Map<String, dynamic> json) {
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['profile'] = profile;
    return data;
  }
}
