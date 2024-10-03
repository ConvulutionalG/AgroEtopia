import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../resources/color_resources.dart';
import '../../resources/image_resources.dart';

class SetCustomImageView extends StatelessWidget {
  final String imageUrl;
  final File? imageFile;
  final bool isNetworkImage;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Uint8List? uintImage;

  SetCustomImageView(
      {required this.imageUrl,
      this.imageFile,
      this.color,
      this.uintImage,
      required this.isNetworkImage,
      this.boxFit,
      this.height,
      this.width,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return setImage(context);
  }

  Widget setImage(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: imageFile != null ? appMainColor : Colors.transparent,
              width: imageFile != null ? 1.0 : 0.0),
          borderRadius: BorderRadius.circular(
            radius ?? 0,
          ),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(
              radius ?? 0,
            ),
            child: isNetworkImage
                ? cachedNetworkImageView(imageUrl, boxFit, context)
                : imageFile != null
                    ? Image.file(
                        imageFile!,
                        fit: boxFit,
                        filterQuality: FilterQuality.high,
                        color: color != null ? color : null,
                      )
                    : uintImage != null
                        ? Image.memory(
                            uintImage!,
                            fit: boxFit,
                            cacheHeight: imageCache.maximumSize,
                            cacheWidth: imageCache.maximumSize,
                            filterQuality: FilterQuality.high,
                          )
                        : Image.asset(
                            imageUrl,
                            fit: boxFit,
                            filterQuality: FilterQuality.high,
                            color: color != null ? color : null,
                          )),
        height: height,
        width: width);
  }

  Widget cachedNetworkImageView(
      String imageURL, BoxFit? boxFit, BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageURL,
        fit: boxFit,
        placeholder: (context, url) => cachedImagePlaceHolder(),
        errorWidget: (context, url, error) => placeImage(context));
  }

  Widget cachedImagePlaceHolder() {
    return Center(
        child: SizedBox(
            width: 40.0,
            height: 40.0,
            child: CircularProgressIndicator(color: appMainColor)));
  }

  placeImage(BuildContext context) {
    return Icon(Icons.person_off);
    //
    // return Image.asset(
    //   // topAppLogo,
    //   icon_place_holder,
    //   fit: BoxFit.contain,
    //   color: Colors.black.withAlpha(30),
    // );
  }
}
