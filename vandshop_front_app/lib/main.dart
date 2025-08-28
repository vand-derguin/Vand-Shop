import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/cart/cart_bloc.dart';

import 'api/api_client.dart';
import 'api/token_storage.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/products/products_bloc.dart';

import 'ui/login_page.dart';
import 'ui/products_page.dart';
import 'ui/cart_page.dart';
import 'ui/checkout_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final tokenStorage = TokenStorage();
  final apiClient = ApiClient(
    baseUrl: "http://192.168.164.234:3000/api",
    tokenStorage: tokenStorage,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(apiClient)),
        BlocProvider<ProductsBloc>(create: (_) => ProductsBloc(apiClient)),
        BlocProvider<CartBloc>(create: (_) => CartBloc()),
      ],
      child: MyApp(apiClient: apiClient),
    ),
  );
}

class MyApp extends StatelessWidget {
  final ApiClient apiClient;
  const MyApp({super.key, required this.apiClient});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VandShop',
      debugShowCheckedModeBanner: false,
      initialRoute: '/products', // Start with products page
      routes: {
        '/login': (_) => const LoginPage(),
        '/products': (_) => const ProductsPage(),
        '/cart': (_) => const CartPage(),
        '/checkout': (_) => const CheckoutPage(),
      },
    );
  }
}
