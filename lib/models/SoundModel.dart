/// code : 200
/// status : "OK"
/// data : {"number":114,"name":"سُورَةُ النَّاسِ","englishName":"An-Naas","englishNameTranslation":"Mankind","revelationType":"Meccan","numberOfAyahs":6,"ayahs":[{"number":6231,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6231.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6231.mp3"],"text":"بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ","numberInSurah":1,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6232,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6232.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6232.mp3"],"text":"مَلِكِ ٱلنَّاسِ","numberInSurah":2,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6233,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6233.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6233.mp3"],"text":"إِلَٰهِ ٱلنَّاسِ","numberInSurah":3,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6234,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6234.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6234.mp3"],"text":"مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ","numberInSurah":4,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6235,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6235.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6235.mp3"],"text":"ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ","numberInSurah":5,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6236,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6236.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6236.mp3"],"text":"مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ","numberInSurah":6,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false}],"edition":{"identifier":"ar.alafasy","language":"ar","name":"مشاري العفاسي","englishName":"Alafasy","format":"audio","type":"versebyverse","direction":null}}

class SoundModel {
  SoundModel({
      this.code, 
      this.status, 
      this.data,});

  SoundModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? code;
  String? status;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// number : 114
/// name : "سُورَةُ النَّاسِ"
/// englishName : "An-Naas"
/// englishNameTranslation : "Mankind"
/// revelationType : "Meccan"
/// numberOfAyahs : 6
/// ayahs : [{"number":6231,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6231.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6231.mp3"],"text":"بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ","numberInSurah":1,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6232,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6232.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6232.mp3"],"text":"مَلِكِ ٱلنَّاسِ","numberInSurah":2,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6233,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6233.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6233.mp3"],"text":"إِلَٰهِ ٱلنَّاسِ","numberInSurah":3,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6234,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6234.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6234.mp3"],"text":"مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ","numberInSurah":4,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6235,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6235.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6235.mp3"],"text":"ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ","numberInSurah":5,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false},{"number":6236,"audio":"https://cdn.islamic.network/quran/audio/128/ar.alafasy/6236.mp3","audioSecondary":["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6236.mp3"],"text":"مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ","numberInSurah":6,"juz":30,"manzil":7,"page":604,"ruku":556,"hizbQuarter":240,"sajda":false}]
/// edition : {"identifier":"ar.alafasy","language":"ar","name":"مشاري العفاسي","englishName":"Alafasy","format":"audio","type":"versebyverse","direction":null}

class Data {
  Data({
      this.number, 
      this.name, 
      this.englishName, 
      this.englishNameTranslation, 
      this.revelationType, 
      this.numberOfAyahs, 
      this.ayahs, 
      this.edition,});

  Data.fromJson(dynamic json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    revelationType = json['revelationType'];
    numberOfAyahs = json['numberOfAyahs'];
    if (json['ayahs'] != null) {
      ayahs = [];
      json['ayahs'].forEach((v) {
        ayahs?.add(Ayahs.fromJson(v));
      });
    }
    edition = json['edition'] != null ? Edition.fromJson(json['edition']) : null;
  }
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  int? numberOfAyahs;
  List<Ayahs>? ayahs;
  Edition? edition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['name'] = name;
    map['englishName'] = englishName;
    map['englishNameTranslation'] = englishNameTranslation;
    map['revelationType'] = revelationType;
    map['numberOfAyahs'] = numberOfAyahs;
    if (ayahs != null) {
      map['ayahs'] = ayahs?.map((v) => v.toJson()).toList();
    }
    if (edition != null) {
      map['edition'] = edition?.toJson();
    }
    return map;
  }

}

/// identifier : "ar.alafasy"
/// language : "ar"
/// name : "مشاري العفاسي"
/// englishName : "Alafasy"
/// format : "audio"
/// type : "versebyverse"
/// direction : null

class Edition {
  Edition({
      this.identifier, 
      this.language, 
      this.name, 
      this.englishName, 
      this.format, 
      this.type, 
      this.direction,});

  Edition.fromJson(dynamic json) {
    identifier = json['identifier'];
    language = json['language'];
    name = json['name'];
    englishName = json['englishName'];
    format = json['format'];
    type = json['type'];
    direction = json['direction'];
  }
  String? identifier;
  String? language;
  String? name;
  String? englishName;
  String? format;
  String? type;
  dynamic direction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['identifier'] = identifier;
    map['language'] = language;
    map['name'] = name;
    map['englishName'] = englishName;
    map['format'] = format;
    map['type'] = type;
    map['direction'] = direction;
    return map;
  }

}

/// number : 6231
/// audio : "https://cdn.islamic.network/quran/audio/128/ar.alafasy/6231.mp3"
/// audioSecondary : ["https://cdn.islamic.network/quran/audio/64/ar.alafasy/6231.mp3"]
/// text : "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ"
/// numberInSurah : 1
/// juz : 30
/// manzil : 7
/// page : 604
/// ruku : 556
/// hizbQuarter : 240
/// sajda : false

class Ayahs {
  Ayahs({
      this.number, 
      this.audio, 
      this.audioSecondary, 
      this.text, 
      this.numberInSurah, 
      this.juz, 
      this.manzil, 
      this.page, 
      this.ruku, 
      this.hizbQuarter, 
      this.sajda,});

  Ayahs.fromJson(dynamic json) {
    number = json['number'];
    audio = json['audio'];
    audioSecondary = json['audioSecondary'] != null ? json['audioSecondary'].cast<String>() : [];
    text = json['text'];
    numberInSurah = json['numberInSurah'];
    juz = json['juz'];
    manzil = json['manzil'];
    page = json['page'];
    ruku = json['ruku'];
    hizbQuarter = json['hizbQuarter'];
    sajda = json['sajda'];
  }
  int? number;
  String? audio;
  List<String>? audioSecondary;
  String? text;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? ruku;
  int? hizbQuarter;
  bool? sajda;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['audio'] = audio;
    map['audioSecondary'] = audioSecondary;
    map['text'] = text;
    map['numberInSurah'] = numberInSurah;
    map['juz'] = juz;
    map['manzil'] = manzil;
    map['page'] = page;
    map['ruku'] = ruku;
    map['hizbQuarter'] = hizbQuarter;
    map['sajda'] = sajda;
    return map;
  }

}