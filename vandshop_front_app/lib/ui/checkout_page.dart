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

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      final product = item['product'];
                      final quantity = item['quantity'] ?? 1;

                      final imageUrl =
                          (product['images'] != null &&
                              product['images'].isNotEmpty &&
                              product['images'][0]['url'] != null)
                          ? product['images'][0]['url']
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
                          title: Text(product['name'] ?? 'Unnamed'),
                          subtitle: Text(
                            "Price: fcfa ${product['price']} x $quantity = fcfa ${(double.tryParse(product['price'].toString()) ?? 0) * quantity}",
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                    DecrementQuantity(product['id'].toString()),
                                  );
                                },
                              ),
                              Text(
                                "$quantity",
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                    IncrementQuantity(product['id'].toString()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Total: fcfa ${state.total.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    // Finalize the sale
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
