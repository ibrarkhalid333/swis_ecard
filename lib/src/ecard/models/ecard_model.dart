class EcardModel {
  int? statusCode;
  bool? sucess;
  List<Data>? data;
  String? message;

  EcardModel({this.statusCode, this.sucess, this.data, this.message});

  EcardModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    sucess = json['sucess'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['sucess'] = this.sucess;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? cardUsername;
  String? businessName;
  String? businessType;
  String? about;
  Null? contactPersonName;
  Null? primaryPhone;
  Null? secondaryPhone;
  Null? contactEmail;
  Null? businessAddress;
  Null? websiteUrl;
  String? coverImageUrl;
  String? profileImageUrl;
  String? backgroundColor;
  String? headingColor;
  String? textColor;
  String? buttonColor;
  String? buttonTextColor;
  String? qrBackgroundColor;
  String? qrTextColor;
  Null? shareUrl;
  String? createdAt;
  String? updatedAt;
  int? userId;

  Data({
    this.id,
    this.cardUsername,
    this.businessName,
    this.businessType,
    this.about,
    this.contactPersonName,
    this.primaryPhone,
    this.secondaryPhone,
    this.contactEmail,
    this.businessAddress,
    this.websiteUrl,
    this.coverImageUrl,
    this.profileImageUrl,
    this.backgroundColor,
    this.headingColor,
    this.textColor,
    this.buttonColor,
    this.buttonTextColor,
    this.qrBackgroundColor,
    this.qrTextColor,
    this.shareUrl,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardUsername = json['card_username'];
    businessName = json['business_name'];
    businessType = json['business_type'];
    about = json['about'];
    contactPersonName = json['contact_person_name'];
    primaryPhone = json['primary_phone'];
    secondaryPhone = json['secondary_phone'];
    contactEmail = json['contact_email'];
    businessAddress = json['business_address'];
    websiteUrl = json['website_url'];
    coverImageUrl = json['cover_image_url'];
    profileImageUrl = json['profile_image_url'];
    backgroundColor = json['background_color'];
    headingColor = json['heading_color'];
    textColor = json['text_color'];
    buttonColor = json['button_color'];
    buttonTextColor = json['button_text_color'];
    qrBackgroundColor = json['qr_background_color'];
    qrTextColor = json['qr_text_color'];
    shareUrl = json['share_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['card_username'] = this.cardUsername;
    data['business_name'] = this.businessName;
    data['business_type'] = this.businessType;
    data['about'] = this.about;
    data['contact_person_name'] = this.contactPersonName;
    data['primary_phone'] = this.primaryPhone;
    data['secondary_phone'] = this.secondaryPhone;
    data['contact_email'] = this.contactEmail;
    data['business_address'] = this.businessAddress;
    data['website_url'] = this.websiteUrl;
    data['cover_image_url'] = this.coverImageUrl;
    data['profile_image_url'] = this.profileImageUrl;
    data['background_color'] = this.backgroundColor;
    data['heading_color'] = this.headingColor;
    data['text_color'] = this.textColor;
    data['button_color'] = this.buttonColor;
    data['button_text_color'] = this.buttonTextColor;
    data['qr_background_color'] = this.qrBackgroundColor;
    data['qr_text_color'] = this.qrTextColor;
    data['share_url'] = this.shareUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    return data;
  }
}
