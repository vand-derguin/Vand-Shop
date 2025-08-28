import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          double totalPrice = 0;
          for (var item in state.items) {
            totalPrice +=
                double.tryParse(item["price"]?.toString() ?? "0") ?? 0;
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final product = state.items[index];
                      final imageUrl =
                          (product["images"] != null &&
                              product["images"].isNotEmpty)
                          ? product["images"][0]["url"]
                          : "https://via.placeholder.com/150";

                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          leading: Image.network(
                            imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(product["name"] ?? "Unnamed"),
                          subtitle: Text("Price: ${product["price"]}"),
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Total: \$${totalPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // Here you can call your API to finalize the sale
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Order placed successfully!"),
                      ),
                    );
                    context.read<CartBloc>().add(ClearCart());
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName('/products'),
                    );
                  },
                  child: const Text("Confirm Payment"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
