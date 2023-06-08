class userData {
    String? uID;
    String? username;
    String? email;
    String? password;
    String? profile;
  
    userData({this.uID, this.username, this.email, this.password, this.profile});
  
    userData.fromJson(Map<String, dynamic> json) {
      uID = json['UID'];
      username = json['username'];
      email = json['email'];
      password = json['password'];
      profile = json['profile'];
    }
  
    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['UID'] = this.uID;
      data['username'] = this.username;
      data['email'] = this.email;
      data['password'] = this.password;
      data['profile'] = this.profile;
      return data;
    }
  }
 