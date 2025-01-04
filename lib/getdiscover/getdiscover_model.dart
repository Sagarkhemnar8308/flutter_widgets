// To parse this JSON data, do
//
//     final getDiscoverModel = getDiscoverModelFromJson(jsonString);

import 'dart:convert';

GetDiscoverModel getDiscoverModelFromJson(String str) => GetDiscoverModel.fromJson(json.decode(str));

String getDiscoverModelToJson(GetDiscoverModel data) => json.encode(data.toJson());

class GetDiscoverModel {
  bool? status;
  String? msg;
  List<Profiledatum>? profiledata;

  GetDiscoverModel({
    this.status,
    this.msg,
    this.profiledata,
  });

  factory GetDiscoverModel.fromJson(Map<String, dynamic> json) => GetDiscoverModel(
        status: json["status"],
        msg: json["msg"],
        profiledata: json["profiledata"] == null
            ? []
            : List<Profiledatum>.from(json["profiledata"]!.map((x) => Profiledatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "profiledata": profiledata == null ? [] : List<dynamic>.from(profiledata!.map((x) => x.toJson())),
      };
}

class Profiledatum {
  dynamic userId;
  dynamic username;
  dynamic email;
  dynamic phonenumber;
  dynamic deviceToken;
  dynamic blockStatus;
  dynamic isLive;
  dynamic superLikes;
  dynamic fullname;
  dynamic bio;
  dynamic gender;
  dynamic interests;
  dynamic profilePic;
  dynamic country;
  dynamic state;
  dynamic district;
  dynamic city;
  dynamic religion;
  dynamic height;
  dynamic weight;
  dynamic zodiac;
  dynamic age;
  dynamic dob;
  dynamic latitude;
  dynamic longitude;
  dynamic lookingA;
  dynamic profilePic1;
  dynamic profilePic2;
  dynamic profilePic3;
  dynamic profilePic4;
  dynamic profilePic5;
  dynamic occupation;
  dynamic yearlyIncome;
  dynamic profileUploadStatus;
  dynamic relationshipStatus;
  dynamic drinks;
  dynamic smokes;
  dynamic relationshipGoals;
  dynamic liked;
  dynamic sharedPercentage;
  List<Shared>? sharedInterests;
  List<Shared>? sharedFaiths;
  List<Shared>? sharedStatusRelationship;

  Profiledatum({
    this.userId,
    this.username,
    this.email,
    this.phonenumber,
    this.deviceToken,
    this.blockStatus,
    this.isLive,
    this.superLikes,
    this.fullname,
    this.bio,
    this.gender,
    this.interests,
    this.profilePic,
    this.country,
    this.state,
    this.district,
    this.city,
    this.religion,
    this.height,
    this.weight,
    this.zodiac,
    this.age,
    this.dob,
    this.latitude,
    this.longitude,
    this.lookingA,
    this.profilePic1,
    this.profilePic2,
    this.profilePic3,
    this.profilePic4,
    this.profilePic5,
    this.occupation,
    this.yearlyIncome,
    this.profileUploadStatus,
    this.relationshipStatus,
    this.drinks,
    this.smokes,
    this.relationshipGoals,
    this.liked,
    this.sharedPercentage,
    this.sharedInterests,
    this.sharedFaiths,
    this.sharedStatusRelationship,
  });

  factory Profiledatum.fromJson(Map<String, dynamic> json) => Profiledatum(
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        deviceToken: json["device_token"],
        blockStatus: json["block_status"],
        isLive: json["is_live"],
        superLikes: json["super_likes"],
        fullname: json["fullname"],
        bio: json["bio"],
        gender: json["gender"],
        interests: json["interests"],
        profilePic: json["profile_pic"],
        country: json["country"],
        state: json["state"],
        district: json["district"],
        city: json["city"],
        religion: json["religion"],
        height: json["height"],
        weight: json["weight"],
        zodiac: json["zodiac"],
        age: json["age"],
        dob: json["DOB"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        lookingA: json["lookingA"],
        profilePic1: json["profile_pic1"],
        profilePic2: json["profile_pic2"],
        profilePic3: json["profile_pic3"],
        profilePic4: json["profile_pic4"],
        profilePic5: json["profile_pic5"],
        occupation: json["occupation"],
        yearlyIncome: json["yearly_income"],
        profileUploadStatus: json["profile_upload_status"],
        relationshipStatus: json["relationship_status"],
        drinks: json["drinks"],
        smokes: json["smokes"],
        relationshipGoals: json["relationship_goals"],
        liked: json["liked"],
        sharedPercentage: json["shared_percentage"],
        sharedInterests: json["shared_interests"] == null
            ? []
            : List<Shared>.from(json["shared_interests"]!.map((x) => Shared.fromJson(x))),
        sharedFaiths: json["shared_faiths"] == null
            ? []
            : List<Shared>.from(json["shared_faiths"]!.map((x) => Shared.fromJson(x))),
        sharedStatusRelationship: json["shared_status_relationship"] == null
            ? []
            : List<Shared>.from(json["shared_status_relationship"]!.map((x) => Shared.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "email": email,
        "phonenumber": phonenumber,
        "device_token": deviceToken,
        "block_status": blockStatus,
        "is_live": isLive,
        "super_likes": superLikes,
        "fullname": fullname,
        "bio": bio,
        "gender": gender,
        "interests": interests,
        "profile_pic": profilePic,
        "country": country,
        "state": state,
        "district": district,
        "city": city,
        "religion": religion,
        "height": height,
        "weight": weight,
        "zodiac": zodiac,
        "age": age,
        "DOB": dob,
        "latitude": latitude,
        "longitude": longitude,
        "lookingA": lookingA,
        "profile_pic1": profilePic1,
        "profile_pic2": profilePic2,
        "profile_pic3": profilePic3,
        "profile_pic4": profilePic4,
        "profile_pic5": profilePic5,
        "occupation": occupation,
        "yearly_income": yearlyIncome,
        "profile_upload_status": profileUploadStatus,
        "relationship_status": relationshipStatus,
        "drinks": drinks,
        "smokes": smokes,
        "relationship_goals": relationshipGoals,
        "liked": liked,
        "shared_percentage": sharedPercentage,
        "shared_interests": sharedInterests == null ? [] : List<dynamic>.from(sharedInterests!.map((x) => x.toJson())),
        "shared_faiths": sharedFaiths == null ? [] : List<dynamic>.from(sharedFaiths!.map((x) => x.toJson())),
        "shared_status_relationship": sharedStatusRelationship == null
            ? []
            : List<dynamic>.from(sharedStatusRelationship!.map((x) => x.toJson())),
      };
}

class Shared {
  String? name;
  String? emoji;

  Shared({
    this.name,
    this.emoji,
  });

  factory Shared.fromJson(Map<String, dynamic> json) => Shared(
        name: json["name"],
        emoji: json["emoji"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "emoji": emoji,
      };
}
