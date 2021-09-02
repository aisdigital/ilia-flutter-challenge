import 'package:equatable/equatable.dart';

class MovieVideo extends Equatable {
  final String key;
  final String type;
  MovieVideo({
    required this.key,
    required this.type,
  });

  MovieVideo copyWith({
    String? key,
    String? type,
  }) {
    return MovieVideo(
      key: key ?? this.key,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [key, type];
}
