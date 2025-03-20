import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  const ImagePickerEvents();

  @override
  List<Object?> get props => [];
}

class CameraCapture extends ImagePickerEvents {}

class GalleryPicker extends ImagePickerEvents {}
