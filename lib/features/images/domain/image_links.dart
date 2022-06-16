import 'package:equatable/equatable.dart';

class ImageLinks extends Equatable {
  final String? href;

  @override
  List<Object?> get props => [href];

  const ImageLinks({this.href});
}
