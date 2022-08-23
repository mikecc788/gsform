import 'dart:ui';

import 'field_model.dart';


class GSImagePickerModel extends GSFieldModel {
  String? hint;
  String iconAsset;
  Color? iconColor;
  String? cameraPopupTitle;
  String? galleryPopupTitle;
  String? cameraPopupIcon;
  String? galleryPopupIcon;
  bool? allowPickedFromGallery;
  bool? showCropper;

  GSImagePickerModel(
      {type,
      tag,
      title,
      errorMessage,
      helpMessage,
      required,
      status,
      weight,
      showTitle,
      required this.iconAsset,
      this.cameraPopupIcon,
      this.galleryPopupIcon,
      this.showCropper,
      this.cameraPopupTitle,
      this.galleryPopupTitle,
      this.allowPickedFromGallery,
      this.hint,
      this.iconColor})
      : super(
          type: type,
          tag: tag,
          title: title,
          errorMessage: errorMessage,
          helpMessage: helpMessage,
          required: required,
          status: status,
          weight: weight,
          showTitle: showTitle,
        );
}
