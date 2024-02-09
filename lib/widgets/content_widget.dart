import 'package:flutter/material.dart';
import 'package:ghibli_studio/components/text_format.dart';

class ContentWidget extends StatelessWidget {
  final String title;
  final String releaseDate;
  final String runTime;
  final String originalTitle;
  final String imagePath;
  final Function() onPressed;
  final String score;

  const ContentWidget({
    super.key,
    required this.title,
    required this.releaseDate,
    required this.runTime,
    required this.originalTitle,
    required this.imagePath,
    required this.onPressed,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 25,
          left: 25,
          top: 25,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                imagePath,
                width: 300,
              ),
            ),
            Container(
              width: 300,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PoppinsText(
                        text: title,
                        fontS: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      PoppinsText(
                        text: '($originalTitle)',
                        fontS: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  PoppinsText(
                    text: 'released at: $releaseDate',
                    fontWeight: FontWeight.w600,
                  ),
                  PoppinsText(
                    text: 'Duration: $runTime min',
                    fontWeight: FontWeight.w600,
                  ),
                  PoppinsText(text: 'Rating: $score'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
