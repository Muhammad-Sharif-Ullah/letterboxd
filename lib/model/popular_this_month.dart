import 'dart:convert';

import 'package:flutter/foundation.dart';

class PopularThisMonth {
  final List<String> images;
  final String title;
  final String avatar;
  final int loved;
  final int comments;
  final String userName;
  PopularThisMonth({
    required this.images,
    required this.title,
    required this.avatar,
    required this.loved,
    required this.comments,
    required this.userName,
  });
  

  PopularThisMonth copyWith({
    List<String>? images,
    String? title,
    String? avatar,
    int? loved,
    int? comments,
    String? userName,
  }) {
    return PopularThisMonth(
      images: images ?? this.images,
      title: title ?? this.title,
      avatar: avatar ?? this.avatar,
      loved: loved ?? this.loved,
      comments: comments ?? this.comments,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'images': images,
      'title': title,
      'avatar': avatar,
      'loved': loved,
      'comments': comments,
      'userName': userName,
    };
  }

  factory PopularThisMonth.fromMap(Map<String, dynamic> map) {
    return PopularThisMonth(
      images: List<String>.from(map['images']),
      title: map['title'] ?? '',
      avatar: map['avatar'] ?? '',
      loved: map['loved']?.toInt() ?? 0,
      comments: map['comments']?.toInt() ?? 0,
      userName: map['userName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PopularThisMonth.fromJson(String source) => PopularThisMonth.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PopularThisMonth(images: $images, title: $title, avatar: $avatar, loved: $loved, comments: $comments, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PopularThisMonth &&
      listEquals(other.images, images) &&
      other.title == title &&
      other.avatar == avatar &&
      other.loved == loved &&
      other.comments == comments &&
      other.userName == userName;
  }

  @override
  int get hashCode {
    return images.hashCode ^
      title.hashCode ^
      avatar.hashCode ^
      loved.hashCode ^
      comments.hashCode ^
      userName.hashCode;
  }
}
