class OlahragaModel {
  int? id;
  String? name;
  String? detail;
  String? imageUrl;

  OlahragaModel({
    this.id,
    this.name,
    this.detail,
    this.imageUrl,
  });

  OlahragaModel.fromJson(String id, Map<String, dynamic> json) {
    id = id;
    name = json['name'];
    imageUrl = json['imageUrl'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'detail': detail,
      'imageUrl': imageUrl,
    };
  }
}
