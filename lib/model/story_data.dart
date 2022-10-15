import 'package:meta/meta.dart';

class StoryData {
  final String url;
  final String name;

  @immutable
  StoryData({required this.url, required this.name});
}
