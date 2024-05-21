// To parse this JSON data, do
//
//     final homeData = homeDataFromJson(jsonString);

import 'dart:convert';

HomeData homeDataFromJson(String str) => HomeData.fromJson(json.decode(str));

String homeDataToJson(HomeData data) => json.encode(data.toJson());

class HomeData {
    bool? status;
    int? error;
    int? success;
    List<Result>? result;

    HomeData({
        this.status,
        this.error,
        this.success,
        this.result,
    });

    factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
        status: json["status"],
        error: json["error"],
        success: json["success"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "success": success,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    String? id;
    String? name;
    List<dynamic>? imgs;
    List<Product>? products;

    Result({
        this.id,
        this.name,
        this.imgs,
        this.products,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        imgs: json["imgs"] == null ? [] : List<dynamic>.from(json["imgs"]!.map((x) => x)),
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgs": imgs == null ? [] : List<dynamic>.from(imgs!.map((x) => x)),
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    };
}

class Product {
    String? id;
    String? name;
    String? category;
    String? subcategory;
    String? brand;
    String? discount;
    String? description;
    String? status;
    String? deleted;
    DateTime? dt;
    String? vendor;
    String? findicator;
    String? homecat;
    String? pincodes;
    String? stock;
    ShopName? shopName;
    String? inCart;
    String? inCartQty;
    String? oid;
    String? product;
    bool? isFavorite;
    List<Img>? imgs;
    List<Opt>? opts;

    Product({
        this.id,
        this.name,
        this.category,
        this.subcategory,
        this.brand,
        this.discount,
        this.description,
        this.status,
        this.deleted,
        this.dt,
        this.vendor,
        this.findicator,
        this.homecat,
        this.pincodes,
        this.stock,
        this.shopName,
        this.inCart,
        this.inCartQty,
        this.oid,
        this.product,
        this.isFavorite,
        this.imgs,
        this.opts,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        subcategory: json["subcategory"],
        brand: json["brand"],
        discount: json["discount"],
        description: json["description"],
        status: json["status"],
        deleted: json["deleted"],
        dt: json["dt"] == null ? null : DateTime.parse(json["dt"]),
        vendor: json["vendor"],
        findicator: json["findicator"],
        homecat: json["homecat"],
        pincodes: json["pincodes"],
        stock: json["stock"],
        shopName: shopNameValues.map[json["shop_name"]]!,
        inCart: json["in_cart"],
        inCartQty: json["in_cart_qty"],
        oid: json["oid"],
        product: json["product"],
        isFavorite: json["is_favorite"],
        imgs: json["imgs"] == null ? [] : List<Img>.from(json["imgs"]!.map((x) => Img.fromJson(x))),
        opts: json["opts"] == null ? [] : List<Opt>.from(json["opts"]!.map((x) => Opt.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "subcategory": subcategory,
        "brand": brand,
        "discount": discount,
        "description": description,
        "status": status,
        "deleted": deleted,
        "dt": dt?.toIso8601String(),
        "vendor": vendor,
        "findicator": findicator,
        "homecat": homecat,
        "pincodes": pincodes,
        "stock": stock,
        "shop_name": shopNameValues.reverse[shopName],
        "in_cart": inCart,
        "in_cart_qty": inCartQty,
        "oid": oid,
        "product": product,
        "is_favorite": isFavorite,
        "imgs": imgs == null ? [] : List<dynamic>.from(imgs!.map((x) => x.toJson())),
        "opts": opts == null ? [] : List<dynamic>.from(opts!.map((x) => x.toJson())),
    };
}

class Img {
    String? id;
    String? product;
    String? imgpath;
    String? deleted;
    DateTime? dt;
    String? iorder;

    Img({
        this.id,
        this.product,
        this.imgpath,
        this.deleted,
        this.dt,
        this.iorder,
    });

    factory Img.fromJson(Map<String, dynamic> json) => Img(
        id: json["id"],
        product: json["product"],
        imgpath: json["imgpath"],
        deleted: json["deleted"],
        dt: json["dt"] == null ? null : DateTime.parse(json["dt"]),
        iorder: json["iorder"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "imgpath": imgpath,
        "deleted": deleted,
        "dt": dt?.toIso8601String(),
        "iorder": iorder,
    };
}

class Opt {
    String? id;
    String? product;
    String? variants;
    String? price;
    String? deleted;
    DateTime? dt;
    String? variantStr;
    double? discount;
    double? dprice;

    Opt({
        this.id,
        this.product,
        this.variants,
        this.price,
        this.deleted,
        this.dt,
        this.variantStr,
        this.discount,
        this.dprice,
    });

    factory Opt.fromJson(Map<String, dynamic> json) => Opt(
        id: json["id"],
        product: json["product"],
        variants: json["variants"],
        price: json["price"],
        deleted: json["deleted"],
        dt: json["dt"] == null ? null : DateTime.parse(json["dt"]),
        variantStr: json["variant_str"],
        discount: json["discount"]?.toDouble(),
        dprice: json["dprice"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "variants": variants,
        "price": price,
        "deleted": deleted,
        "dt": dt?.toIso8601String(),
        "variant_str": variantStr,
        "discount": discount,
        "dprice": dprice,
    };
}

enum ShopName {
    KISANDOOT,
    SHRI
}

final shopNameValues = EnumValues({
    "Kisandoot": ShopName.KISANDOOT,
    "Shri": ShopName.SHRI
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
