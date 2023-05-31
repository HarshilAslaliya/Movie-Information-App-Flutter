import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api/api.dart';
import '../models/movie.dart';
import '../screens/details_screen.dart';

class TopRatedItem extends StatelessWidget {
  const TopRatedItem({
    Key? key,
    required this.movie,
    required this.index,
  }) : super(key: key);

  final Movie movie;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.to(
            DetailsScreen(movie: movie),
          ),
          child: Container(
            margin: const EdgeInsets.only(left: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                Api.imageBaseUrl + movie.posterPath,
                fit: BoxFit.cover,
                height: 250,
                width: 180,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.broken_image,
                  size: 180,
                ),
                loadingBuilder: (_, __, ___) {
                  if (___ == null) return __;
                  return FadeShimmer(
                    width: 180,
                    height: 250,
                    highlightColor: Colors.tealAccent.shade100.withOpacity(0.2),
                    baseColor: Colors.teal.shade100.withOpacity(0.2),
                  );
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0,1),
          child: Text(
            (index).toString(),
            style: const TextStyle(
              fontSize: 120,
              fontWeight: FontWeight.w600,
              color: Colors.teal,
            ),
          ),
        )
      ],
    );
  }
}
