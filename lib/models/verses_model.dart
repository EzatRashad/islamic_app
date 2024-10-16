class VersesModel {
  List<Verses>? verses;
  Meta? meta;

  VersesModel({this.verses, this.meta});

  VersesModel.fromJson(Map<String, dynamic> json) {
    if (json['verses'] != null) {
      verses = <Verses>[];
      json['verses'].forEach((v) {
        verses!.add(new Verses.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.verses != null) {
      data['verses'] = this.verses!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Verses {
  int? id;
  String? verseKey;
  String? textIndopak;

  Verses({this.id, this.verseKey, this.textIndopak});

  Verses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseKey = json['verse_key'];
    textIndopak = json['text_indopak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['verse_key'] = this.verseKey;
    data['text_indopak'] = this.textIndopak;
    return data;
  }
}

class Meta {
  Filters? filters;

  Meta({this.filters});

  Meta.fromJson(Map<String, dynamic> json) {
    filters =
        json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.toJson();
    }
    return data;
  }
}

class Filters {
  String? chapterNumber;

  Filters({this.chapterNumber});

  Filters.fromJson(Map<String, dynamic> json) {
    chapterNumber = json['chapter_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chapter_number'] = this.chapterNumber;
    return data;
  }
}
