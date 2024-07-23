// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  Reviews copyWith({
    int? rating,
    String? comment,
    String? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return Reviews(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewerEmail: reviewerEmail ?? this.reviewerEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating,
      'comment': comment,
      'date': date,
      'reviewerName': reviewerName,
      'reviewerEmail': reviewerEmail,
    };
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      rating: map['rating'] != null ? map['rating'] as int : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      reviewerName:
          map['reviewerName'] != null ? map['reviewerName'] as String : null,
      reviewerEmail:
          map['reviewerEmail'] != null ? map['reviewerEmail'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) =>
      Reviews.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reviews(rating: $rating, comment: $comment, date: $date, reviewerName: $reviewerName, reviewerEmail: $reviewerEmail)';
  }

  @override
  bool operator ==(covariant Reviews other) {
    if (identical(this, other)) return true;

    return other.rating == rating &&
        other.comment == comment &&
        other.date == date &&
        other.reviewerName == reviewerName &&
        other.reviewerEmail == reviewerEmail;
  }

  @override
  int get hashCode {
    return rating.hashCode ^
        comment.hashCode ^
        date.hashCode ^
        reviewerName.hashCode ^
        reviewerEmail.hashCode;
  }
}
