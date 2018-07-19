import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> parsedJson)
    : id = parsedJson['id'],
      deleted = parsedJson['deleted'],
      type = parsedJson['type'],
      by = parsedJson['by'],
      time = parsedJson['time'],
      text = parsedJson['text'],
      dead = parsedJson['dead'],
      parent = parsedJson['parent'],
      kids = parsedJson['kids'],
      url = parsedJson['url'],
      score = parsedJson['score'],
      title = parsedJson['title'],
      descendants = parsedJson['descendants'];

    ItemModel.fromDb(Map<String, dynamic> dbResult)
    : id = dbResult['id'],
      deleted = dbResult['deleted'] == 1,
      type = dbResult['type'],
      by = dbResult['by'],
      time = dbResult['time'],
      text = dbResult['text'],
      dead = dbResult['dead'] == 1,
      parent = dbResult['parent'],
      kids = jsonDecode(dbResult['kids']),
      url = dbResult['url'],
      score = dbResult['score'],
      title = dbResult['title'],
      descendants = dbResult['descendants'];
    
    Map<String, dynamic> toMap() {
      return <String, dynamic>{
        'id': id,
        'deleted': deleted ? 1 : 0,
        'type': type,
        'by': by,
        'time': time,
        'text': text,
        'dead': dead ? 1 : 0,
        'parent': parent,
        'kids': jsonEncode(kids),
        'url': url,
        'score': score,
        'title': title,
        'descendants': descendants
      };
    }
}