import 'package:json_annotation/json_annotation.dart';

part 'course_price.g.dart';

@JsonSerializable()
class CoursePrice {
  final String id;
  final String courseName;
  final int coursePrice;
  final DateTime dateTime;
  CoursePrice(
      {required this.id,
      required this.courseName,
      required this.coursePrice,
      required this.dateTime});

  factory CoursePrice.fromJson(Map<String, dynamic> json) =>
      _$CoursePriceFromJson(json);
  Map<String, dynamic> toJson() => _$CoursePriceToJson(this);

  CoursePrice copyWith({
    String? id,
    String? courseName,
    int? coursePrice,
  }) =>
      CoursePrice(
        id: id ?? this.id,
        courseName: courseName ?? this.courseName,
        coursePrice: coursePrice ?? this.coursePrice,
        dateTime: dateTime,
      );
}
