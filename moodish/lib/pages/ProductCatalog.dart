import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:midterm_app/models/formpayment_model.dart';
import 'package:provider/provider.dart';
import 'ProductDetail.dart';

class ProductCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moodish Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConfirmPaymentButton(),
        Categorylist(),
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
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => Productcard(
                itemIndex: index,
                productItem: products[index],
                press: () {},
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Consumer<PaymentModel>(
                builder: (context, model, child) {
                  return Column(
                    children: [
                      Text(
                        '$_message',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      Text(
                        'Khun ${model.name} Order: ${model.orderref} Transfer: ฿${model.amount} ${model.datetime} ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 5.0),
            ElevatedButton.icon(
              icon: Icon(Icons.save_alt_outlined),
              onPressed: () async {
                Navigator.pushNamed(context, '/6');
              },
              label: Text(
                'Confirm Payment',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
                fixedSize: Size(200, 50),
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

//Productcard
class Productcard extends StatelessWidget {
  const Productcard({
    Key? key,
    required this.itemIndex,
    required this.productItem,
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final ProductItem productItem;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(item: products[itemIndex]),
          ),
        );
      },
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
                  color: productItem.color),
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
                child: Image.asset(
                  productItem.image,
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
                        '${productItem.title} \n ${productItem.subtitie}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(color: productItem.color),
                      child: Text(
                        '\฿${productItem.price}',
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
  }
}

//category list
class Categorylist extends StatefulWidget {
  @override
  _CategorylistState createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  int selectedIndex = 0;
  List categories = ['All', 'Memopad', 'Sticker', 'Notebook', 'AppIcons'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 20.0,
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: index == selectedIndex
                  ? Theme.of(context).primaryColor.withOpacity(0.4)
                  : Colors.transparent,
            ),
            child: Text(
              categories[index],
            ),
          ),
        ),
      ),
    );
  }
}
