class PostModel {
  final int id;
  final String title;
  final String body;
  PostModel({required this.id, required this.title, required this.body});
  // server ma Json => Dart object
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}
