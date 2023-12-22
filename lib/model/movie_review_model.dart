import 'dart:convert';

class MovieReviewModel {
  final String avatar;
  final String reviewBy;
  final int rate;
  final int message;
  final String review;
  MovieReviewModel({
    required this.avatar,
    required this.reviewBy,
    required this.rate,
    required this.message,
    required this.review,
  });

  MovieReviewModel copyWith({
    String? avatar,
    String? reviewBy,
    int? rate,
    int? message,
    String? review,
  }) {
    return MovieReviewModel(
      avatar: avatar ?? this.avatar,
      reviewBy: reviewBy ?? this.reviewBy,
      rate: rate ?? this.rate,
      message: message ?? this.message,
      review: review ?? this.review,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'reviewBy': reviewBy,
      'rate': rate,
      'message': message,
      'review': review,
    };
  }

  factory MovieReviewModel.fromMap(Map<String, dynamic> map) {
    return MovieReviewModel(
      avatar: map['avatar'] ?? '',
      reviewBy: map['reviewBy'] ?? '',
      rate: map['rate']?.toInt() ?? 0,
      message: map['message']?.toInt() ?? 0,
      review: map['review'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieReviewModel.fromJson(String source) =>
      MovieReviewModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieReviewModel(avatar: $avatar, reviewBy: $reviewBy, rate: $rate, message: $message, review: $review)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieReviewModel &&
        other.avatar == avatar &&
        other.reviewBy == reviewBy &&
        other.rate == rate &&
        other.message == message &&
        other.review == review;
  }

  @override
  int get hashCode {
    return avatar.hashCode ^
        reviewBy.hashCode ^
        rate.hashCode ^
        message.hashCode ^
        review.hashCode;
  }
}
