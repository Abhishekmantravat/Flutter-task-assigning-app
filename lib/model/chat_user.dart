class Chatuser {
  Chatuser({
    required this.id,
    required this.pushToken,
    required this.about,
    required this.email,
    required this.lastActive,
    required this.name,
    required this.isonline,
    required this.image,
    required this.createdAt,
  });
  late final String id;
  late final String pushToken;
  late final String about;
  late final String email;
  late final String lastActive;
  late final String name;
  late final String isonline;
  late final String image;
  late final String createdAt;
  
  Chatuser.fromJson(Map<String, dynamic> json){
    id = json['id']?? "";
    pushToken = json['push_token']?? "";
    about = json['about']?? "";
    email = json['email']?? "";
    lastActive = json['last_active']?? "";
    name = json['name']?? "";
    isonline = json['isonline']?? "";
    image = json['image']?? "";
    createdAt = json['created_at']?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['push_token'] = pushToken;
    data['about'] = about;
    data['email'] = email;
    data['last_active'] = lastActive;
    data['name'] = name;
    data['isonline'] = isonline;
    data['image'] = image;
    data['created_at'] = createdAt;
    return data;
  }
}