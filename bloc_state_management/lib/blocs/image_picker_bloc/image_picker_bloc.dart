
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/image_picker_bloc/image_picker_events.dart';
import 'package:flutter_bloc_tutorial/blocs/image_picker_bloc/image_picker_states.dart';
import 'package:flutter_bloc_tutorial/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryImagePicker);
  }

  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerStates> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();

    emit(state.copyWith(file: file));
  }

  void _galleryImagePicker(GalleryPicker event, Emitter emit) async {
    XFile? file = await imagePickerUtils.pickerImageFromGallery();

    emit(state.copyWith(file: file));
  }
}
