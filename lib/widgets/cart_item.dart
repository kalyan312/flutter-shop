import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productID;
  final String title;
  final int quantity;
  final double price;

  CartItem(this.id, this.productID, this.title, this.quantity, this.price);

  @override
  Widget build(BuildContext context) {
    print(productID);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        Cart cart = Provider.of<Cart>(context, listen: false);
        cart.removeItem(productID);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: FittedBox(
                  child:  Text('\$$price'),
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
