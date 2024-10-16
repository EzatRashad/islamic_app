class AdhanTimeModel {
  int? code;
  String? status;
  Data? data;

  AdhanTimeModel({this.code, this.status, this.data});

  AdhanTimeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Timings? timings;
  Date? date;

  Data({this.timings, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    timings = json['timings'] != null ? Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
  }
}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
    firstthird = json['Firstthird'];
    lastthird = json['Lastthird'];
  }
}

class Date {
  String? readable;
  String? timestamp;
  Hijri? hijri;

  Date({this.readable, this.timestamp, this.hijri});

  Date.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? Hijri.fromJson(json['hijri']) : null;
  }
}

class Hijri {
  String? date;
  String? format;
  HijriMonth? month;
  String? day;
  String? year;

  Hijri({this.date, this.format, this.day, this.year,this.month});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
     month = json['month'] != null ? HijriMonth.fromJson(json['month']) : null;
    year = json['year'];
  }
}

class HijriMonth {
  int? number;
  String? en;
  String? ar;

  HijriMonth({this.number, this.en, this.ar});

  HijriMonth.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }
}
