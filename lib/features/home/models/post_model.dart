// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  final String id;
  final String text;
  final String createdAt;
  final String authorId;
  final String? authorName;
  final String? authorimageUrl;
  final String? imageUrl;
  final String? videoUrl;
  final List<String>? likes;
  final List<String>? comments;

  const PostModel({
    required this.id,
    required this.text,
    required this.authorId,
    required this.createdAt,
    this.authorName,
    this.authorimageUrl,
    this.imageUrl,
    this.videoUrl,
    this.likes,
    this.comments,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'created_at': createdAt,
      'author_id': authorId,
      'author_name': authorName,
      'author_image_url': authorimageUrl,
      'image_url': imageUrl,
      'video_url': videoUrl,
      'likes': likes,
      'comments': comments,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      createdAt: map['created_at'] ?? '',
      authorId: map['author_id'] ?? ' ',
      authorName: map['authorName'] as String?,
      authorimageUrl: map['authorimageUrl'] as String?,
      imageUrl: map['image_url'] as String?,
      videoUrl: map['video_url'] as String?,
      likes: map['likes'] != null ? List<String>.from(map['likes']) : null,
      comments: map['comments'] != null
          ? List<String>.from(map['comments'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  PostModel copyWith({
    String? id,
    String? text,
    String? createdAt,
    String? authorId,
    String? authorName,
    String? authorimageUrl,
    String? imageUrl,
    String? videoUrl,
    List<String>? likes,
    List<String>? comments,
  }) {
    return PostModel(
      id: id ?? this.id,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      authorimageUrl: authorimageUrl ?? this.authorimageUrl,
      imageUrl: imageUrl ?? this.imageUrl,
      videoUrl: videoUrl ?? this.videoUrl,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }
}
