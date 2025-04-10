import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vision_tech/core/firebase_auth_helper.dart';
import 'package:vision_tech/core/json_helper.dart';
import 'package:vision_tech/services/auth/view_model/auth_cubit.dart';
import 'package:vision_tech/services/auth/views/forget_password_view.dart';
import 'package:vision_tech/services/auth/views/login_view.dart';
import 'package:vision_tech/services/auth/views/register_view.dart';
import 'package:vision_tech/services/home/data/product_model.dart';
import 'package:vision_tech/services/home/data/repos/home_repo_impl.dart';
import 'package:vision_tech/services/home/presentation/view_model/cart/cart_cubit.dart';
import 'package:vision_tech/services/home/presentation/view_model/cart/cart_state.dart';
import 'package:vision_tech/services/home/presentation/view_model/home/home_cubit.dart';
import 'package:vision_tech/services/home/presentation/views/cart/cart_view.dart';
import 'package:vision_tech/services/home/presentation/views/contact_us/view/contact_us_view.dart';
import 'package:vision_tech/services/home/presentation/views/home/Category_products_view.dart';
import 'package:vision_tech/services/home/presentation/views/home/home_view.dart';
import 'package:vision_tech/services/home/presentation/views/product_details/product_details_view.dart';
import 'package:vision_tech/services/home/presentation/views/search/search_view.dart';
import 'package:vision_tech/services/splash_screen/splash_screen.dart';

import 'bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  runApp(const VisionTechApp());
}

class VisionTechApp extends StatelessWidget {
  const VisionTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => AuthCubit(FirebaseAuthHelper())),
        BlocProvider(
          create: (context) => HomeCubit(HomeRepoImpl(JsonHelper()))..getHomeProducts(),
        ),
      ],
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return ScreenUtilInit(
            builder:
                (context, child) => MaterialApp(
                  routes: {
                    LoginView.routeName: (context) => const LoginView(),
                    RegisterView.routeName: (context) => const RegisterView(),
                    ForgetPasswordView.routeName:
                        (context) => const ForgetPasswordView(),
                    HomeView.routeName: (context) => const HomeView(),
                    CategoryProductsView.routeName:
                        (context) => CategoryProductsView(),
                    ProductDetailsScreen.routeName:
                        (context) => ProductDetailsScreen(
                          product:
                              ModalRoute.of(context)?.settings.arguments
                                  as Product,
                        ),
                    CartView.routeName: (context) => CartView(),
                    ContactUsView.routeName: (context) => const ContactUsView(),
                    SearchView.routeName: (context) => const SearchView(),
                  },
                  debugShowCheckedModeBanner: false,
                  home: const SplashScreen(),
                ),
          );
        },
      ),
    );
  }
}
