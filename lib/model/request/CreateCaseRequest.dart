/// name : "last test for now6"
/// gender : "male"
/// age : 99
/// city : "cairo"
/// locationOfLoss : "fayoum"
/// dateOfLoss : "2024-04-10"
/// description : "Tall with blue eyes"
/// images : ["image1.jpg","image2.jpg"]
/// status : "missing"
/// additionalInfo : "Wearing a black jacket"

class CreateCaseRequest {
  CreateCaseRequest(
      {this.name,
      this.gender,
      this.age,
      this.city,
      this.locationOfLoss,
      this.dateOfLoss,
      this.description,
      this.images,
      this.status,
      this.mobileNumber});

  CreateCaseRequest.fromJson(dynamic json) {
    name = json['name'];
    gender = json['gender'];
    age = json['age'];
    city = json['city'];
    locationOfLoss = json['locationOfLoss'];
    dateOfLoss = json['dateOfLoss'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    status = json['status'];
    mobileNumber = json['mobileNumber'];
  }
  String? name;
  String? gender;
  int? age;
  String? city;
  String? locationOfLoss;
  String? dateOfLoss;
  String? description;
  List<String>? images;
  String? status;
  String? mobileNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['gender'] = gender;
    map['age'] = age;
    map['city'] = city;
    map['locationOfLoss'] = locationOfLoss;
    map['dateOfLoss'] = dateOfLoss;
    map['description'] = description;
    map['images'] = images;
    map['status'] = status;
    map['mobileNumber'] = mobileNumber;
    return map;
  }
}
