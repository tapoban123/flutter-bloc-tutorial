import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_tutorial/blocs/image_picker_bloc/image_picker_events.dart';
import 'package:flutter_bloc_tutorial/blocs/image_picker_bloc/image_picker_states.dart';

class ImagePickerApp extends StatelessWidget {
  const ImagePickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Demo"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
          builder: (context, state) {
            if (state.file == null) {
              return _pickImageOptions(context);
            } else {
              return Column(
                children: [
                  _pickImageOptions(context),
                  const SizedBox(height: 10),
                  Image.file((File(state.file!.path))),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _pickImageOptions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            context.read<ImagePickerBloc>().add(GalleryPicker());
          },
          icon: const Icon(
            Icons.folder_rounded,
            size: 50,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            context.read<ImagePickerBloc>().add(CameraCapture());
          },
          icon: const Icon(
            Icons.camera,
            size: 50,
          ),
        ),
      ],
    );
  }
}
