
import 'package:hive/hive.dart';

part 'news_model.g.dart';

@HiveType(typeId: 0)
class Data {
  @HiveField(0)
  String? uuid;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? keywords;
  @HiveField(4)
  String? snippet;
  @HiveField(5)
  String? url;
  @HiveField(6)
  String? imageUrl;
  @HiveField(7)
  String? language;
  @HiveField(8)
  String? publishedAt;
  @HiveField(9)
  String? source;
  @HiveField(10)
  List<String>? categories;
  @HiveField(11)
  dynamic relevanceScore;
  @HiveField(12)
  String? locale;

  Data(
      {this.uuid,
      this.title,
      this.description,
      this.keywords,
      this.snippet,
      this.url,
      this.imageUrl,
      this.language,
      this.publishedAt,
      this.source,
      this.categories,
      this.relevanceScore,
      this.locale});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    description = json['description'];
    keywords = json['keywords'];
    snippet = json['snippet'];
    url = json['url'];
    imageUrl = json['image_url'];
    language = json['language'];
    publishedAt = json['published_at'];
    source = json['source'];
    categories = json['categories'].cast<String>();
    relevanceScore = json['relevance_score'];
    locale = json['locale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['title'] = title;
    data['description'] = description;
    data['keywords'] = keywords;
    data['snippet'] = snippet;
    data['url'] = url;
    data['image_url'] = imageUrl;
    data['language'] = language;
    data['published_at'] = publishedAt;
    data['source'] = source;
    data['categories'] = categories;
    data['relevance_score'] = relevanceScore;
    data['locale'] = locale;
    return data;
  }
}