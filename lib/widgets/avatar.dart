import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String? url;
  final double radius;

  const Avatar({super.key, this.url, required this.radius});

  const Avatar.small({
    Key? key,
    this.url,
  })  : radius = 18,
        super(key: key);

  const Avatar.medius({
    Key? key,
    this.url,
  })  : radius = 26,
        super(key: key);

  const Avatar.large({
    Key? key,
    this.url,
  })  : radius = 34,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: CachedNetworkImageProvider(url!),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}
