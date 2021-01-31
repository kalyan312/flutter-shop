import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/cart.dart';
import '../screens/product_details_screen.dart';
import '../providers/product.dart';
class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child:       GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(product.imageUrl),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
                icon: Icon(
                  product.isFavorite == true ? Icons.favorite : Icons.favorite_border,
                ),
                color: Theme.of(context).accentColor,
                onPressed: (){
                  product.toggleFavoriteState();
                }
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).accentColor,
              ),
              onPressed: (){
                cart.addItem(product.id, product.price, product.title);
              }
          ),
        ),
      ),
    );
  }
}
