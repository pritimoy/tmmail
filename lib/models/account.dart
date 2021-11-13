class Account {
  late String context;
  late String annotatedId;
  late String type;
  late String id;
  late String address;
  late int quota;
  late int used;
  late bool isDisabled;
  late bool isDeleted;
  late String createdAt;
  late String updatedAt;

  Account(
      {required this.context,
      required this.annotatedId,
      required this.type,
      required this.id,
      required this.address,
      required this.quota,
      required this.used,
      required this.isDisabled,
      required this.isDeleted,
      required this.createdAt,
      required this.updatedAt});

  Account.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    annotatedId = json['@id'];
    type = json['@type'];
    id = json['id'];
    address = json['address'];
    quota = json['quota'];
    used = json['used'];
    isDisabled = json['isDisabled'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    data['@id'] = this.annotatedId;
    data['@type'] = this.type;
    data['id'] = this.id;
    data['address'] = this.address;
    data['quota'] = this.quota;
    data['used'] = this.used;
    data['isDisabled'] = this.isDisabled;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}