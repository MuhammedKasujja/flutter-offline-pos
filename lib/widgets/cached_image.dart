// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// class CacheImage extends StatelessWidget {
//   const CacheImage({
//     Key? key,
//     required this.imageUrl,
//     required this.height,
//     this.width,
//   }) : super(key: key);
//   final String? imageUrl;
//   final double? width;
//   final double height;

//   // final imageUrl =
//   // 'https://www.metoffice.gov.uk/binaries/content/gallery/metofficegovuk/hero-images/advice/maps-satellite-images/satellite-image-of-globe.jpg';

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       width: width ?? double.infinity,
//       height: height,
//       imageUrl: imageUrl ?? '',
//       placeholder: (context, url) =>
//           const Center(child: CircularProgressIndicator()),
//       cacheManager: CacheManager(
//         Config(
//           imageUrl ?? 'customCacheKey',
//           stalePeriod: const Duration(days: 7),
//         ),
//       ),
//       errorWidget: (context, url, error) =>
//           Image.asset('assets/images/dormitory_missing.png'),
//       // const Center(
//       //   child: Icon(
//       //     Icons.error,
//       //     size: 40,
//       //     color: Colors.red,
//       //   ),
//       // ),
//       imageBuilder: (context, imageProvider) => Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: imageProvider,
//             fit: BoxFit.fill,
//           ),
//         ),
//       ),
//     );
//   }
// }
