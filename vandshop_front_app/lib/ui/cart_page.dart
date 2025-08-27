import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_cubit.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) return Center(child: Text("Cart is empty"));
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: state.items.entries.map((e) {
                    return ListTile(
                      title: Text("Product ${e.key}"),
                      subtitle: Text("Qty: ${e.value}"),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () =>
                            context.read<CartCubit>().remove(e.key),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Text("Total: ${state.total}"),
              ElevatedButton(
                onPressed: () {
                  // TODO: send checkout to API
                },
                child: Text("Checkout"),
              ),
            ],
          );
        },
      ),
    );
  }
}
