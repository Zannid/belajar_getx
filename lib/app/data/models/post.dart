class Post {
  final int id;
  final String title;
  final String content;
  final String slug;
  final int status;
  final String foto;
  final String createdAt;
  final String updatedAt;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.slug,
    required this.status,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      slug: json['slug'],
      status: json['status'],
      foto: json['foto'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
