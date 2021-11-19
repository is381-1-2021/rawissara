import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:midterm_app/controllers/product_controller.dart';
import 'package:midterm_app/models/Product_model.dart';
import 'package:midterm_app/pages/Home.dart';
import 'package:midterm_app/services/services.dart';
import 'package:provider/provider.dart';
import 'ProductDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moodish Store'),
      ),
      body: Container(
        color: Colors.white12,
        child: Column(
            children: <Widget>[
              Image.network('https://firebasestorage.googleapis.com/v0/b/is381-2021-moodish.appspot.com/o/store%20banner%2Fstore%20banner.png?alt=media&token=8348f664-8dcf-4762-98f9-723ddf0bcbb9',
                    fit: BoxFit.cover,
                    height: 300.0,
              ),   
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                  icon: Icon(Icons.storefront),
                  onPressed: () async {
                    Navigator.pushNamed(context, '/11');
                  },
                  label: Text(
                    'View All Product',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF8B82D0),
                    fixedSize: Size(260, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton.icon(
                  icon: Icon(Icons.shopping_cart_outlined),
                  onPressed: () async {
                    Navigator.pushNamed(context, '/6');
                  },
                  label: Text(
                    'Make Order',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF8B82D0),
                    fixedSize: Size(260, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton.icon(
                  icon: Icon(Icons.history),
                  onPressed: () async {
                    Navigator.pushNamed(context, '/12');
                  },
                  label: Text(
                    'Order History',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF8B82D0),
                    fixedSize: Size(260, 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Image.network('https://firebasestorage.googleapis.com/v0/b/is381-2021-moodish.appspot.com/o/store%20banner%2Fstore%20banner%20buttom.png?alt=media&token=debe38eb-77a3-4b91-af88-07626c5c14e9',
                    fit: BoxFit.cover,
              ),
            ],
          ),
      ),
      );
  }
}

class ShowListProduct extends StatefulWidget{
  @override
  _ShowListProductState createState() => _ShowListProductState();
}

class _ShowListProductState extends State<ShowListProduct> {
  var services = FirebaseServices();
  var controller;
  List<ProductModel> products = List.empty();
  bool isLoading = false;

  void initState() {
    super.initState();
    controller = ProductController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getProducts() async {
    var newProducts = await controller.fetchProducts();

    setState(() => products = newProducts);
  }

  Widget get body => isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
            itemCount: products.isEmpty ? 1 : products.length,
            itemBuilder: (ctx, index) {
              if (products.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                  'Refresh to view products',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                  ),
                  ),
                );
              }
              Size size = MediaQuery.of(context).size;
              return GestureDetector(
                onTap: () => showModalBottomSheet( //product detail
		                //backgroundColor: Colors.transparent,
		                isScrollControlled: true,
		                shape: RoundedRectangleBorder(
		                	borderRadius: BorderRadius.vertical(
		                		top: Radius.circular(20.0),
		                	),
		                ),
                        context: context, 
                        builder: (context) => Container(
                          	color: Color(0xFF8B82D0).withOpacity(0.4),
                          	padding: EdgeInsets.all(16.0),
                          	child: Column(
                          	mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${products[index].title}'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                   ),
                                ),
                                SizedBox(height: 5.0),
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    '${products[index].subtitle}'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                     ),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Image.network(
                                  products[index].imgpath,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height:20.0),
                                Container(
                                  height: 50.0,
                                  width: 100.0,
                                  color: Color(products[index].color),
                                  child: Center(
                                    child: Text(
                                      '\฿${products[index].price}',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 30.0),
                                  child: Text(
                                    '${products[index].detail}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                              ],
                            )
                          ),
                        ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  height: 160.0,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      //background product card
                      Container(
                        height: 136.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22.0),
                            color: Color(products[index].color),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22.0),
                          ),
                        ),
                      ),
                      //product image
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: 200.0,
                          height: 160.0,
                          child: Image.network(products[index].imgpath,
                          fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //product title&price
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: SizedBox(
                          height: 136.0,
                          width: size.width - 200.0,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  '${products[index].title} \n ${products[index].subtitle}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 5.0,
                                ),
                                decoration: BoxDecoration(color: Color(products[index].color)),
                                child: Text(
                                  '\฿${products[index].price}',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );

  //UI ของมิดเทอม
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCECAE8),
      floatingActionButton: FloatingActionButton(
        onPressed: _getProducts,
        child: Icon(
          Icons.search,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: Text('Moodish Product'),
      ),
      body: Center(child: body)
    );
  }

}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConfirmPaymentButton(),
        Expanded(
            child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 70.0),
              decoration: BoxDecoration(
                color: Color(0xFF8B82D0).withOpacity(0.4),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
              ),
            ),
          ],
        )),
      ],
    );
  }
}

//Confirmpaymentbutton
class ConfirmPaymentButton extends StatefulWidget {
  @override
  _ConfirmPaymentButtonState createState() => _ConfirmPaymentButtonState();
}

class _ConfirmPaymentButtonState extends State<ConfirmPaymentButton> {
  String? _message = '<You can send payment here>';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            //Padding(
            //  padding: const EdgeInsets.all(5.0),
            //  child: Consumer<PaymentModel>(
            //    builder: (context, model, child) {
            //      return Column(
            //        children: [
            //          Text(
            //            '$_message',
            //            style: TextStyle(
            //              fontSize: 15,
            //              color: Theme.of(context).accentColor,
            //            ),
            //          ),
            //          Text(
            //            'Khun ${model.name} Order: ${model.orderref} Transfer: ฿${model.amount} ${model.datetime} ',
            //            style: TextStyle(
            //              fontSize: 15,
            //              color: Theme.of(context).accentColor,
            //            ),
            //          ),
            //        ],
            //      );
            //    },
            //  ),
            //),
            SizedBox(height: 5.0),
            ElevatedButton.icon(
              icon: Icon(Icons.save_alt_outlined),
              onPressed: () async {
                Navigator.pushNamed(context, '/6');
              },
              label: Text(
                'Confirm Payment',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF8B82D0),
                fixedSize: Size(260, 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                textStyle: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
