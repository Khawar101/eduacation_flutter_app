class TeacherData {
  String? name;
  String? email;
  String? userType;
  bool? follow;

  TeacherData({this.name, this.email, this.userType, this.follow});

  TeacherData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    userType = json['userType'];
    follow = json['follow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['userType'] = this.userType;
    data['follow'] = this.follow;
    return data;
  }
}