// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool? status;
    int? error;
    int? success;
    String? message;
    Result? result;

    LoginModel({
        this.status,
        this.error,
        this.success,
        this.message,
        this.result,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        error: json["error"],
        success: json["success"],
        message: json["message"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "success": success,
        "message": message,
        "result": result?.toJson(),
    };
}

class Result {
    String? id;
    String? email;
    String? phone;
    String? name;
    String? pass;
    String? usertype;
    String? status;
    dynamic imgpath;
    String? deleted;
    DateTime? dt;
    String? shopName;
    String? shopAdd;
    String? shopPin;
    String? balance;
    String? vid;
    String? bankAccNo;
    String? bankAccName;
    String? aadharNo;
    String? aadharImg;
    String? storePhone;
    String? ifscCode;
    String? token;
    dynamic referCode;
    dynamic referTo;
    String? planExpire;
    DateTime? planDate;
    dynamic planId;

    Result({
        this.id,
        this.email,
        this.phone,
        this.name,
        this.pass,
        this.usertype,
        this.status,
        this.imgpath,
        this.deleted,
        this.dt,
        this.shopName,
        this.shopAdd,
        this.shopPin,
        this.balance,
        this.vid,
        this.bankAccNo,
        this.bankAccName,
        this.aadharNo,
        this.aadharImg,
        this.storePhone,
        this.ifscCode,
        this.token,
        this.referCode,
        this.referTo,
        this.planExpire,
        this.planDate,
        this.planId,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
        name: json["name"],
        pass: json["pass"],
        usertype: json["usertype"],
        status: json["status"],
        imgpath: json["imgpath"],
        deleted: json["deleted"],
        dt: json["dt"] == null ? null : DateTime.parse(json["dt"]),
        shopName: json["shop_name"],
        shopAdd: json["shop_add"],
        shopPin: json["shop_pin"],
        balance: json["balance"],
        vid: json["vid"],
        bankAccNo: json["bank_acc_no"],
        bankAccName: json["bank_acc_name"],
        aadharNo: json["aadhar_no"],
        aadharImg: json["aadhar_img"],
        storePhone: json["store_phone"],
        ifscCode: json["ifsc_code"],
        token: json["token"],
        referCode: json["refer_code"],
        referTo: json["refer_to"],
        planExpire: json["plan_expire"],
        planDate: json["plan_date"] == null ? null : DateTime.parse(json["plan_date"]),
        planId: json["plan_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
        "name": name,
        "pass": pass,
        "usertype": usertype,
        "status": status,
        "imgpath": imgpath,
        "deleted": deleted,
        "dt": dt?.toIso8601String(),
        "shop_name": shopName,
        "shop_add": shopAdd,
        "shop_pin": shopPin,
        "balance": balance,
        "vid": vid,
        "bank_acc_no": bankAccNo,
        "bank_acc_name": bankAccName,
        "aadhar_no": aadharNo,
        "aadhar_img": aadharImg,
        "store_phone": storePhone,
        "ifsc_code": ifscCode,
        "token": token,
        "refer_code": referCode,
        "refer_to": referTo,
        "plan_expire": planExpire,
        "plan_date": planDate?.toIso8601String(),
        "plan_id": planId,
    };
}
