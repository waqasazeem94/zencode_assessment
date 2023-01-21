import 'package:zencode_assessment/all_utils.dart';
import 'package:zencode_assessment/utils/app_theme.dart';

Future<void> main() async {
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.buildTheme(),
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}