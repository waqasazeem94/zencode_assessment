import 'package:zencode_assessment/all_utils.dart';
import 'package:zencode_assessment/pages/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:zencode_assessment/pages/home/home_page.dart';
import 'package:zencode_assessment/utils/app_theme.dart';

void main() {
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
      child: const BottomNavigation(),
    );
  }
}