import 'package:flutter/material.dart';
import 'package:ghibli_studio/components/text_format.dart';
import 'package:ghibli_studio/model/post_model.dart';

class FilmDetails extends StatelessWidget {
  static const String routeName = 'FilmDetails';
  const FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.network(
                      data.image,
                      fit: BoxFit.cover,
                      height: 600,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText(
                    text: data.title,
                    fontS: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  PoppinsText(
                    text: '(${data.originalTitle})',
                    fontS: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PoppinsText(
                    text: data.description,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
