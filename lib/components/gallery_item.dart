import 'package:flutter/material.dart';

class GalleryItemCard extends StatelessWidget {
  final String imageTitle;
  final String imageDate;
  final String imageDescription;
  final String imagePath;
 // final double size;

  const GalleryItemCard({
    super.key,
    required this.imageTitle,
    this.imageDate = '',
    this.imageDescription = '',
    required this.imagePath,
 //   this.size = 260,
  });

  @override
  Widget build(BuildContext context) {
 //   const double textAreaHeight = 90;
    return SizedBox(
  //    width: size,
  //    height: size,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
             //     width: size,
                ),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Center(
                  child: Text(
                    imageTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
