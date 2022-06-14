import 'package:equatable/equatable.dart';

class ImageItemLink extends Equatable {
  final String? href;

  @override
  List<Object?> get props => [href];

  const ImageItemLink({this.href});
}
