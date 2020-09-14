import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tv/bloc/bloc_categories.dart';
import 'package:flutter_tv/bloc/bloc_category_selector.dart';
import 'package:flutter_tv/bloc/bloc_newest.dart';
import 'package:flutter_tv/bloc/bloc_overlay.dart';
import 'package:flutter_tv/bloc/bloc_popular.dart';
import 'package:flutter_tv/bloc/bloc_video.dart';
import 'package:flutter_tv/bloc/bloc_video_controls.dart';
import 'package:flutter_tv/bloc/simple_bloc_observer.dart';
import 'package:flutter_tv/models/training_entity.dart';
import 'package:flutter_tv/repositories/category_reposityory.dart';
import 'package:flutter_tv/repositories/training_repository.dart';
import 'package:flutter_tv/views/category_view.dart';
import 'package:flutter_tv/views/detail_view.dart';
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
        RepositoryProvider(create: (context) => TrainingFireStoreRepository()),
        RepositoryProvider(create: (context) => CategoryFireStoreRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NewestBloc>(
            //lazy: false,
            create: (context) =>
                NewestBloc(context.repository<TrainingFireStoreRepository>())
                  ..add(NewestEventLoad()),
          ),
          BlocProvider<PopularBloc>(
            //lazy: false,
            create: (context) =>
                PopularBloc(context.repository<TrainingFireStoreRepository>())
                  ..add(PopularEventLoad()),
          ),
          BlocProvider(
              create: (context) => CategoriesBloc(
                  context.repository<CategoryFireStoreRepository>())
                ..add(CategoryEventLoad()))
        ],
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
          },
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
              DetailScreen.id: (context) => DetailScreen(),
              CategoryScreen.id: (context) => BlocProvider(
                    create: (context) => CategorySelectorBloc(
                        context.repository<TrainingFireStoreRepository>()),
                    child: CategoryScreen(),
                  ),
            },
            onGenerateRoute: (settings) {
              if (settings.name == VideoScreen.id) {
                final TrainingEntity args = settings.arguments;

                return MaterialPageRoute(
                  builder: (context) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => ControlsBloc()),
                        BlocProvider(create: (context) => OverlayBloc()),
                        BlocProvider(
                            create: (context) =>
                                VideoBloc(args.videoId)..add(VideoEvent.LOAD)),
                      ],
                      child: VideoScreen(args),
                    );
                  },
                );
              }
              assert(false, 'Need to implement ${settings.name}');
              return null;
            },
          ),
        ),
      ),
    );
  }
}
