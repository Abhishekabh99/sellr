import 'package:flutter/services.dart';
import 'package:sellr/pages/home/controller/home_controller.dart';
import 'package:sellr/pages/home/home.dart';
import 'package:sellr/pages/splash/splash.dart';
import 'package:sellr/web/repository_provider.dart';
import '../../common_imports.dart';
import 'pages/productDetail/product_detail.dart';
import 'pages/products/products.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initServices();
  runApp(const MyApp());
}

_initServices() => Get.lazyPut(() => RepositoryProvider(), fenix: true);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      theme: ThemeData(
        primaryColor: AppColors.colorPrimary,
        fontFamily: "Rubik",
        hintColor: AppColors.colorDisabled,
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: AppColors.colorPrimary),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.colorPrimary,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.colorPrimary,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      initialRoute: NavigationPath.splashPage,
      getPages: _AppPages.pages,
      transitionDuration: _AppPages.defaultDuration,
      defaultTransition: _AppPages.defaultTransition,
      scrollBehavior: NoGrowBehaviour(),
      // onGenerateRoute: NavigationPath.generateRoute,
    );
  }
}

//-------------App Pages----------
class _AppPages {
  static const Duration defaultDuration = Duration(milliseconds: 500);
  static const _defaultCurve = Curves.easeInQuad;
  static const Transition defaultTransition = Transition.rightToLeft;

  static List<GetPage<dynamic>>? pages = [
    GetPage(
        name: NavigationPath.splashPage,
        page: () => const SplashPage(),
        curve: _defaultCurve),
    GetPage(
        binding: BindingsBuilder(() {
          Get.lazyPut(() => HomeController());
        }),
        name: NavigationPath.homePage,
        page: () => const HomePage(),
        curve: _defaultCurve),
    GetPage(
        name: NavigationPath.productsPage,
        page: () => const ProductsPage(),
        curve: _defaultCurve),
    GetPage(
        name: NavigationPath.productDetailPage,
        page: () => const ProductDetailPage(),
        curve: _defaultCurve),
  ];
}
