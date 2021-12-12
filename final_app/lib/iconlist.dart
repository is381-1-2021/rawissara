import 'package:flutter/material.dart';

class IconTypes {
  final String image, title;

  const IconTypes({
    Key? key,
    required this.title,
    required this.image,
  });
}

List<IconTypes> types = [
  IconTypes(
    title: 'food', 
    image: 'assets/images/food.png'
  ),
    IconTypes(
    title: 'home', 
    image: 'assets/images/home.png'
  ),

];

class Categorylist extends StatefulWidget{
 @override
 _CategorylistState createState() => _CategorylistState();
}
 
class _CategorylistState extends State<Categorylist> {
 int selectedIndex = 0;
 List categories = ['assets/images/food.png','assets/images/home.png','assets/images/home.png','assets/images/home.png','assets/images/home.png'];
 @override
 Widget build(BuildContext context) {
   return 
   Container(
     margin: EdgeInsets.symmetric(vertical: 3.0),
     height: 50,
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
           margin: EdgeInsets.only(left: 20.0,),
           padding: EdgeInsets.symmetric(horizontal: 20.0),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(6),
             color: index == selectedIndex 
             ? Theme.of(context).primaryColor
             : Colors.transparent,
           ),
           child: Image.asset(
             categories[index],
             width: 30,
           ),
         ),
       ),
     ),
   );
 }
}