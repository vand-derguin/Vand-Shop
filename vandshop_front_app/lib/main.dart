import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/api_client.dart';
import 'api/token_storage.dart';
import 'blocs/auth/auth_bloc.dart';
import 'blocs/products/products_bloc.dart';
// import 'blocs/cart/cart_cubit.dart';

import 'ui/login_page.dart';
import 'ui/products_page.dart';
// import 'ui/cart_page.dart';

void main() {
  final tokenStorage = TokenStorage();
  final apiClient = ApiClient(
    baseUrl: "http://localhost:3000",
    tokenStorage: tokenStorage,
  ); // Android emulator localhost
  runApp(MyApp(apiClient: apiClient));
}

class MyApp extends StatelessWidget {
  final ApiClient apiClient;
  const MyApp({super.key, required this.apiClient});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(apiClient)),
        BlocProvider(create: (_) => ProductsBloc(apiClient)),
      ],
      child: MaterialApp(
        title: 'VandShop',
        initialRoute: "/login",
        routes: {
          "/login": (_) => const LoginPage(),
          "/products": (_) => const ProductsPage(),
        },
      ),
    );
  }
}
