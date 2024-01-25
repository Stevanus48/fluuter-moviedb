import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pertemuan11/model/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie selectedMovie;
  const MovieDetail({Key? key, required this.selectedMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    double screenHeight = MediaQuery.of(context).size.height;

    if (selectedMovie.posterPath != null) {
      path = 'https://image.tmdb.org/t/p/w500/${selectedMovie.posterPath}';
    } else {
      path =
          'https://image.freeimages.com/images/large-previews/5eb/movie-clapboard-11844399.jpg';
    }

    var date = selectedMovie.releaseDate ?? "2001-01-01";
    var formattedDate = DateTime.parse(date);

    date = DateFormat("d MMM yyyy").format(formattedDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMovie.title}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: screenHeight / 1.5,
                child: Image.network(path),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('${selectedMovie.overview}'),
              ),
              Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    'Rating : ${selectedMovie.voteAverage}',
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    'Release Date: $date',
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Dibuat Oleh Stevanus Dwi Rizki, NIM : 21201046'),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
