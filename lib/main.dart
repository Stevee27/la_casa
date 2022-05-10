import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:la_casa/app_navigator.dart';
import 'package:la_casa/casa_error_widget.dart';
import 'package:la_casa/home/home_repository.dart';
import 'package:la_casa/loading_view.dart';
import 'package:la_casa/nav/bloc/nav_cubit.dart';
import 'package:la_casa/user/bloc/user_bloc.dart';

import 'amplifyconfiguration.dart';
import 'app_bloc_observer.dart';
import 'auth/bloc/auth_bloc.dart';
import 'cart/bloc/cart_bloc.dart';
import 'home/bloc/store_hours_bloc.dart';
import 'menu/bloc/menu_bloc.dart';
import 'menu/menu_repository.dart';
import 'models/ModelProvider.dart';

Future main() async {
  // await dotenv.load(fileName: "assets/.env");
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: const [
          Locale('en'),
          Locale('it'),
          Locale('es'),
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        title: 'La Casa Del Pane',
        theme: ThemeData(primarySwatch: Colors.cyan),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (BuildContext context) => HomeRepository()),
            RepositoryProvider(create: (BuildContext context) => MenuRepository()),
          ],
          child: MultiBlocProvider(providers: [
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => UserCubit()),
            BlocProvider(create: (context) => NavCubit()),
            BlocProvider(create: (context) => StoreHoursCubit()..getStoreHours()),
            BlocProvider(create: (context) => MenuCubit()..getMenu()),
            BlocProvider(create: (context) => CartCubit()),
          ], child: _amplifyConfigured ? AppNavigator() : const LoadingView()),
        ));
  }

  void _configureAmplify() async {
    await Amplify.addPlugin(AmplifyDataStore(modelProvider: ModelProvider.instance));

    // Once Plugins are added, configure Amplify
    try {
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
      // BlocProvider.of<UserCubit>(context).getUser('steve');
      // print('steve');
      // Amplify.DataStore.clear();
    } catch (e) {
      CasaErrorWidget(
        exception: e as Exception,
      );
    }
  }
}
