import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {Key? key, required this.size, required this.asset, this.borderWidth = 0})
      : super(key: key);
  final double size;
  final String asset;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    //2 formas para hacer iamgen circular
    final bool fromNetwork =
        asset.startsWith("http://") || asset.startsWith("https://");

    final imageProvider = fromNetwork ? CachedNetworkImageProvider(asset) : AssetImage(asset);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth,
          color: Colors.white,
        ),
        color: Colors.grey,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: imageProvider as ImageProvider,
          fit: BoxFit.cover
        ),
      ),
    );
    /*return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size*0.5),
        child: Image.asset(asset, width: size, height: size),
      ),
    );*/
  }
}
