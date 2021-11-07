import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget{
  final ProductItem item;

  const ProductDetail({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Product Detail'),
       elevation: 0,
       actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () {},
          ),
       ],
      ),
      body: ListView(
        children:[
          SizedBox(height: 15), 
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              '${item.title}'.toUpperCase(),
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
               ),
            ),
          ),
          SizedBox(height: 5.0),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              '${item.subtitie}'.toUpperCase(),
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
               ),
            ),
          ),
          SizedBox(height: 5.0),
          Image.asset(
            item.image,
            width: 400,
            height: 320,
            fit: BoxFit.contain,
           ),
          Container(
            height: 70.0,
            width: 125.0,
            color: item.color,
            child: Center(
              child: Text(
                '\฿${item.price}',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              'Detail \n ${item.detail}',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              Stack(
                children: [
                  Container(
                    height: 45.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFFE7D6A).withOpacity(0.1),
                          blurRadius: 6.0,
                          spreadRadius: 6.0,
                          offset: Offset(5.0,11.0)
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(Icons.favorite_border,
                        color: Color(0xFFFE7D6A), size: 25.0,
                      ), 
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
                label: Text('Add to cart'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5F478C),
                  fixedSize: Size(250,50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  textStyle: TextStyle(fontSize: 20),
               ),
         ),
                  
            ],
          ),
        ],
      ),
    );
  }
}

//list productitem
class ProductItem {
  final String image, title, subtitie, detail;
  final int price;
  final Color color;

  const ProductItem({
    Key? key, 
    required this.title,
    required this.subtitie,
    required this.price, 
    required this.color,
    required this.image,
    required this.detail,
    });
}

List<ProductItem> products = [
  ProductItem(
    title: 'Digital Notebook:',
    subtitie: 'Sweet Home',
    price: 199,
    color: Color(0xFFFFD376),
    image: 'assets/notebook.PNG',
    detail: '- cover x4 \n - sticker x77 pcs \n - papers x6 templates ',
  ),
  ProductItem(
    title: 'App Icons:',
    subtitie: 'Picnic Day',
    price: 99,
    color: Color(0xFFFFC392),
    image: 'assets/appicon.PNG',
    detail: '- icon 46 pcs \n - widget 7 pcs \n - wallpapers for phone 4 pcs',
  ),
  ProductItem(
    title: 'Digital Memo:',
    subtitie: 'Space Galaxy',
    price: 99,
    color: Color(0xFF9ADCF1),
    image: 'assets/memo.PNG',
    detail: '- memo pad (1500x1500) 20 pcs',
  ),
  ProductItem(
    title: 'Digital Sticker:',
    subtitie: 'Moodish v.2',
    price: 129,
    color: Color(0xFFFFAED4),
    image: 'assets/digisticker.PNG',
    detail: '- sticker 80 pcs',
  ),
];