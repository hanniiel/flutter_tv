import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_newest.dart';
import 'package:flutter_tv/bloc/simple_bloc_observer.dart';
import 'package:flutter_tv/repositories/training_repository.dart';
import 'package:flutter_tv/views/video_view.dart';
import 'package:flutter_tv/views/home_view.dart';
//env
//cat .env | xargs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => TrainingFireStoreRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NewestBloc>(
            //lazy: false,
            create: (context) =>
                NewestBloc(context.repository<TrainingFireStoreRepository>())
                  ..add(NewestEventLoad()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TV App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: HomeScreen.id,
          routes: {
            HomeScreen.id: (context) => HomeScreen(),
            VideoScreen.id: (context) => VideoScreen()
          },
        ),
      ),
    );
  }
}
