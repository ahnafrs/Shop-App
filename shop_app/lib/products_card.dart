import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductsCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '\$$price',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          Center(
            child: Image(
              image: AssetImage(image),
              height: 170,
            ),
          )
        ],
      ),
    );
  }
}
