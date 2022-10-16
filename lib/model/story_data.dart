import 'package:meta/meta.dart';

@immutable
class StoryData {
  final String url;
  final String name;

  const StoryData({required this.url, required this.name});
}
