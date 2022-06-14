import 'package:equatable/equatable.dart';

/// Image item description info
class ImageItemInfo extends Equatable {
  final String? aVAILNASAID;
  final String? aVAILDescription;
  final String? aVAILDateCreated;
  final String? aVAILTitle;
  final String? aVAILCenter;
  final String? aVAILLocation;

  @override
  List<Object?> get props => [
        aVAILNASAID,
        aVAILDescription,
        aVAILDateCreated,
        aVAILTitle,
        aVAILCenter,
        aVAILLocation,
      ];

  /// Create an instance [ImageItemInfo].
  const ImageItemInfo({
    this.aVAILNASAID,
    this.aVAILDescription,
    this.aVAILDateCreated,
    this.aVAILTitle,
    this.aVAILCenter,
    this.aVAILLocation,
  });
}
