import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ghibli_studio/components/text_format.dart';
import 'package:ghibli_studio/model/post_model.dart';
import 'package:ghibli_studio/services/api_service.dart';
import 'package:ghibli_studio/widgets/content_widget.dart';
import 'package:ghibli_studio/widgets/file_details.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const PoppinsText(
          text: 'Ghibli Studio',
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF124559),
      ),
      body: FutureBuilder(
          future: futurePost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Post data = snapshot.data![index];
                  return ContentWidget(
                    title: data.title,
                    originalTitle: data.originalTitle,
                    releaseDate: data.releaseDate,
                    runTime: data.runningTime,
                    imagePath: data.image,
                    score: data.score,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        FilmDetails.routeName,
                        arguments: data,
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator.adaptive(),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              alignment: Alignment.center,
              color: Colors.white,
              child: const SpinKitSquareCircle(
                color: Colors.blueGrey,
                size: 50.0,
              ),
            );
          }),
    );
  }
}
