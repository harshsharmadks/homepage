// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.status,
    required this.data,
    required this.message,
  });

  String status;
  Data data;
  String message;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.tabs,
    required this.banner,
    required this.bannerList,
    required this.versionRequired,
  });

  List<Tab> tabs;
  String banner;
  List<BannerList> bannerList;
  int versionRequired;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    tabs: List<Tab>.from(json["tabs"].map((x) => Tab.fromJson(x))),
    banner: json["banner"],
    bannerList: List<BannerList>.from(json["banner_list"].map((x) => BannerList.fromJson(x))),
    versionRequired: json["version_required"],
  );

  Map<String, dynamic> toJson() => {
    "tabs": List<dynamic>.from(tabs.map((x) => x.toJson())),
    "banner": banner,
    "banner_list": List<dynamic>.from(bannerList.map((x) => x.toJson())),
    "version_required": versionRequired,
  };
}

class BannerList {
  BannerList({
    required this.id,
    required this.image,
    required this.href,
    required this.isActive,
  });

  int id;
  String image;
  String href;
  bool isActive;

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
    id: json["id"],
    image: json["image"],
    href: json["href"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "href": href,
    "is_active": isActive,
  };
}

class Tab {
  Tab({
    required this.id,
    required this.languageId,
    required this.type,
    required this.testTypeId,
    required this.iconImg,
    required this.title,
    required this.desc,
    required this.fullDesc,
    required this.freeIconVisible,
    required this.bgColor,
  });

  int id;
  int languageId;
  String type;
  int testTypeId;
  String iconImg;
  String title;
  String desc;
  String fullDesc;
  bool freeIconVisible;
  String bgColor;

  factory Tab.fromJson(Map<String, dynamic> json) => Tab(
    id: json["id"],
    languageId: json["language_id"],
    type: json["type"],
    testTypeId: json["test_type_id"] == null ? null : json["test_type_id"],
    iconImg: json["icon_img"],
    title: json["title"],
    desc: json["desc"],
    fullDesc: json["full_desc"] == null ? null : json["full_desc"],
    freeIconVisible: json["free_icon_visible"],
    bgColor: json["bg_color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "language_id": languageId,
    "type": type,
    "test_type_id": testTypeId == null ? null : testTypeId,
    "icon_img": iconImg,
    "title": title,
    "desc": desc,
    "full_desc": fullDesc == null ? null : fullDesc,
    "free_icon_visible": freeIconVisible,
    "bg_color": bgColor,
  };
}
