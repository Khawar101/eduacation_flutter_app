// {
//     "Date": "1695365257455000",
//     "SMS": "Hey",
//     "UID": "ShnLNiM7NueTHrolnEtrv7oNa2Y2",
//     "type": "text"
// }

class Chat {
  String? date;
  String? sMS;
  String? uID;
  String? type;

  Chat({this.date, this.sMS, this.uID, this.type});

  Chat.fromJson(Map<String, dynamic> json) {
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
