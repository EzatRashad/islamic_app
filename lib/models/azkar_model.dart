class AzkarM
{
  int? id;
  String? category;
  String? audio;
  String? filename;
  List<Array>? array;

  AzkarM.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    audio = json['audio'];
    filename = json['filename'];
    if (json['array'] != null) {
      array = <Array>[];
      json['array'].forEach((e) {
        array!.add(Array.fromMap(e));
      });
    }
  }
}

class Array
{
  int? id;
  String? text;
  int? count;
  String? audio;
  String? filename;
  Array.fromMap(Map<String, dynamic> json)
  {
    id = json['id'];
    text = json['text'];
    count = json['count'];
    audio = json['audio'];
    filename = json['filename'];
  }

}