import 'breeds_model.dart';

class PetModel {
  List<Breeds>? breeds;
  String? id;
  String? url;
  int? width;
  int? height;
  bool? isDog;

  PetModel(
      {this.breeds,
      this.id,
      this.url,
      this.width,
      this.height,
      this.isDog = true,});

  PetModel.fromJson(Map<String, dynamic> json, this.isDog) {
    if (json['breeds'] != null) {
      breeds = <Breeds>[];
      json['breeds'].forEach((v) {
        breeds!.add(new Breeds.fromJson(v));
      });
    }
    id = json['id'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.breeds != null) {
      data['breeds'] = this.breeds!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }

  getName() {
    try {
      String name = "Meu nome";
      if (isDog ?? true) {
        name = "Dog";
      } else {
        name = "Cat";
      }

      if (breeds != null) {
        if (breeds!.isNotEmpty) {
          name = breeds![0].name!;
        }

        return name;
      } else {
        return name;
      }
    } catch (e) {
      return "Sem nome";
    }
  }

  String? getDescription() {
    try {
      if (breeds != null) {
        if (breeds!.isNotEmpty) {
          return breeds?[0].description;
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  String getGroupOrOrigin() {
    try {
      if (breeds != null) {
        if (breeds!.isNotEmpty) {
          if (isDog ?? true) {
            return breeds?[0].breedGroup ?? "--";
          } else {
            return breeds?[0].origin ?? "--";
          }
        }
        return "--";
      } else {
        return "--";
      }
    } catch (e) {
      return "--";
    }
  }

  String? getBredFor() {
    try {
      if (breeds != null) {
        if (breeds!.isNotEmpty) {
          return breeds?[0].bredFor;
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  String? getTemperament() {
    try {
      if (breeds != null) {
        if (breeds!.isNotEmpty) {
          return breeds?[0].temperament;
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  String? getLifeSpan() {
    try {
      if (breeds != null) {
        if (breeds!.isNotEmpty) {
          return breeds?[0].lifeSpan;
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}




