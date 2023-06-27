import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/blocs/internet_bloc/internet_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MyLoginPage.dart';
import 'MySignupPage.dart';
import 'MyHomePage.dart';
import 'FoodItemList.dart';
import 'BottomSheetButton.dart';
import 'FigmaHome.dart';
import 'BlocArchitecture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: const MaterialApp(
        title: 'Flutter Login Screen',
        // theme: ThemeData(
        //     primarySwatch: Colors.blue,
        //     // scaffoldBackgroundColor: Color.fromARGB(255, 7, 5, 119),
        //     ),
        home: BlacArchitecture(),
        // home: const MySignupPage(),
        // initialRoute: '/login',
        // routes: {
        //   '/login': (context) => const MyLoginPage(),
        //   '/signup': (context) => const MySignupPage(),
        //   '/dash': (context) => const MyHomePage(),
        // },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:login/service/movies_services.dart';

// import 'model/model.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MoviesList extends StatefulWidget {
//   const MoviesList({Key? key}) : super(key: key);

//   @override
//   State<MoviesList> createState() => _MoviesListState();
// }

// class _MoviesListState extends State<MoviesList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Movies List',
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//         backgroundColor: Color(0xFFC70039),
//       ),
//       body: FutureBuilder<List<Movie>>(
//         future: fetchMovies(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final movies = snapshot.data!;
//             return ListView.builder(
//               itemCount: movies.length,
//               itemBuilder: (context, index) {
//                 final movie = movies[index];
//                 return ListTile(
//                   title: Text(movie.title),
//                   subtitle: Text(movie.releaseDate),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           return CircularProgressIndicator(); // Show a loading indicator while fetching data.
//         },
//       ),
//     );
//   }
// }
