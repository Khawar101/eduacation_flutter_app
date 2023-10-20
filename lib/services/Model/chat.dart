// {
//     "Date": "1695365257455000",
//     "SMS": "Hey",
//     "UID": "ShnLNiM7NueTHrolnEtrv7oNa2Y2",
//     "type": "text",
//     "id;":""
// }

class Chat {
  String? date;
  String? sMS;
  String? uID;
  String? type;
  String? id;

  Chat({this.date, this.sMS, this.uID, this.type, this.id});

  Chat.fromJson(Map<String, dynamic> json, {required String docId}) {
    date = json['Date'];
    sMS = json['SMS'];
    uID = json['UID'];
    type = json['type'];
    id = docId;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
    data['SMS'] = sMS;
    data['UID'] = uID;
    data['type'] = type;
    data['id'] = id;
    return data;
  }
}
