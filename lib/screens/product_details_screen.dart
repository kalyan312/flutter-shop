import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context).settings.arguments as String;
    final products = Provider.of<Products>(context, listen: false);
    final productDetails = products.findByID(productID);
    return Scaffold(
      appBar: AppBar(
        title: Text(productDetails.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 400,
              child: Image.network(
                  productDetails.imageUrl,
                  fit: BoxFit.cover
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('\$${productDetails.price}', style: TextStyle(
              color: Colors.grey,
              fontSize: 20
            ),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                productDetails.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),


            )
          ],
        ),
      )
    );
  }
}
