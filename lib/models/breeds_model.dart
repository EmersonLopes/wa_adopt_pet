import 'weight.dart';

class Breeds {
  Weight? weight;
  Weight? height;
  String? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? description;
  String? referenceImageId;

  Breeds(
      {this.weight,
        this.height,
        this.id,
        this.name,
        this.bredFor,
        this.breedGroup,
        this.lifeSpan,
        this.temperament,
        this.origin,
        this.description,
        this.referenceImageId});

  Breeds.fromJson(Map<String, dynamic> json) {
    weight =
    json['weight'] != null ? new Weight.fromJson(json['weight']) : null;
    height =
    json['height'] != null ? new Weight.fromJson(json['height']) : null;
    id = json['id'].toString();
    name = json['name'];
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    lifeSpan = json['life_span'];
    temperament = json['temperament'];
    origin = json['origin'];
    description = json['description'];
    referenceImageId = json['reference_image_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weight != null) {
      data['weight'] = this.weight!.toJson();
    }
    if (this.height != null) {
      data['height'] = this.height!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['bred_for'] = this.bredFor;
    data['breed_group'] = this.breedGroup;
    data['life_span'] = this.lifeSpan;
    data['temperament'] = this.temperament;
    data['origin'] = this.origin;
    data['description'] = this.description;
    data['reference_image_id'] = this.referenceImageId;
    return data;
  }
}