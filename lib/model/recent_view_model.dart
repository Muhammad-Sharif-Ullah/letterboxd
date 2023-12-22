import 'dart:convert';

class RecentViewModel {
  final String avatar;
  final String movieName;
  final String movieImage;
  final String reviewBy;
  final String reviewText;
  final int year;
  final int rate;
  final int message;
  RecentViewModel({
    required this.avatar,
    required this.movieName,
    required this.movieImage,
    required this.reviewBy,
    required this.reviewText,
    required this.year,
    required this.rate,
    required this.message,
  });

  RecentViewModel copyWith({
    String? avatar,
    String? movieName,
    String? movieImage,
    String? reviewBy,
    String? reviewText,
    int? year,
    int? rate,
    int? message,
  }) {
    return RecentViewModel(
      avatar: avatar ?? this.avatar,
      movieName: movieName ?? this.movieName,
      movieImage: movieImage ?? this.movieImage,
      reviewBy: reviewBy ?? this.reviewBy,
      reviewText: reviewText ?? this.reviewText,
      year: year ?? this.year,
      rate: rate ?? this.rate,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'movieName': movieName,
      'movieImage': movieImage,
      'reviewBy': reviewBy,
      'reviewText': reviewText,
      'year': year,
      'rate': rate,
      'message': message,
    };
  }

  factory RecentViewModel.fromMap(Map<String, dynamic> map) {
    return RecentViewModel(
      avatar: map['avatar'] ?? '',
      movieName: map['movieName'] ?? '',
      movieImage: map['movieImage'] ?? '',
      reviewBy: map['reviewBy'] ?? '',
      reviewText: map['reviewText'] ?? '',
      year: map['year']?.toInt() ?? 0,
      rate: map['rate']?.toInt() ?? 0,
      message: map['message']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentViewModel.fromJson(String source) =>
      RecentViewModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecentViewModel(avatar: $avatar, movieName: $movieName, movieImage: $movieImage, reviewBy: $reviewBy, reviewText: $reviewText, year: $year, rate: $rate, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecentViewModel &&
        other.avatar == avatar &&
        other.movieName == movieName &&
        other.movieImage == movieImage &&
        other.reviewBy == reviewBy &&
        other.reviewText == reviewText &&
        other.year == year &&
        other.rate == rate &&
        other.message == message;
  }

  @override
  int get hashCode {
    return avatar.hashCode ^
        movieName.hashCode ^
        movieImage.hashCode ^
        reviewBy.hashCode ^
        reviewText.hashCode ^
        year.hashCode ^
        rate.hashCode ^
        message.hashCode;
  }
}
