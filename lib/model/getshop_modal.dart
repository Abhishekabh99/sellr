class GetShopModal {
  int? status;
  User? user;

  GetShopModal({this.status, this.user});

  GetShopModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? shopid;
  String? image;
  String? email;
  bool? isVerified;
  String? phone;
  String? time;

  User(
      {this.sId,
      this.name,
      this.shopid,
      this.image,
      this.email,
      this.isVerified,
      this.phone,
      this.time});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    shopid = json['shopid'];
    image = json['image'];
    email = json['email'];
    isVerified = json['isVerified'];
    phone = json['phone'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['shopid'] = this.shopid;
    data['image'] = this.image;
    data['email'] = this.email;
    data['isVerified'] = this.isVerified;
    data['phone'] = this.phone;
    data['time'] = this.time;
    return data;
  }
}