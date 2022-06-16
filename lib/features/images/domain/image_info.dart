import 'package:equatable/equatable.dart';

class ImageInfo extends Equatable {
  final String? title;
  final String? nasaId;

  @override
  List<Object?> get props => [title, nasaId];

  const ImageInfo({
    this.title,
    this.nasaId,
  });
}
