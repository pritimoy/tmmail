class Domain {
  late String context;
  late String id;
  late String type;
  late List<HydraMember> hydraMember;
  late int hydraTotalItems;

  Domain(
      {required this.context,
      required this.id,
      required this.type,
      required this.hydraMember,
      required this.hydraTotalItems});

  Domain.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    id = json['@id'];
    type = json['@type'];
    if (json['hydra:member'] != null) {
      hydraMember = <HydraMember>[];
      json['hydra:member'].forEach((v) {
        hydraMember.add(new HydraMember.fromJson(v));
      });
    }
    hydraTotalItems = json['hydra:totalItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    data['@id'] = this.id;
    data['@type'] = this.type;
    if (this.hydraMember != null) {
      data['hydra:member'] = this.hydraMember.map((v) => v.toJson()).toList();
    }
    data['hydra:totalItems'] = this.hydraTotalItems;
    return data;
  }
}

class HydraMember {
  late String annotatedId;
  late String type;
  late String id;
  late String domain;
  late bool isActive;
  late bool isPrivate;
  late String createdAt;
  late String updatedAt;

  HydraMember(
      {required this.annotatedId,
      required this.type,
      required this.id,
      required this.domain,
      required this.isActive,
      required this.isPrivate,
      required this.createdAt,
      required this.updatedAt});

  HydraMember.fromJson(Map<String, dynamic> json) {
    annotatedId = json['@id'];
    type = json['@type'];
    id = json['id'];
    domain = json['domain'];
    isActive = json['isActive'];
    isPrivate = json['isPrivate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.annotatedId;
    data['@type'] = this.type;
    data['id'] = this.id;
    data['domain'] = this.domain;
    data['isActive'] = this.isActive;
    data['isPrivate'] = this.isPrivate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}