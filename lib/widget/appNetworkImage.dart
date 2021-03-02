import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppNetWorkIamge extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final BoxFit boxFit;
  const AppNetWorkIamge({Key key, this.imageUrl, this.radius, this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl != null
          ? imageUrl
          : "https://target.scene7.com/is/image/Target//GUEST_6bdfe36e-d26d-4cee-918e-39cb9c377d44",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius != null ? radius : 4),
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit != null ? boxFit : BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => AppPlaceholder(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
    // return AppPlaceholder();
  }
}

class AppPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/image/icon_color.png'),
                  fit: BoxFit.fitHeight)),
        ),
      ),
    );
  }
}
