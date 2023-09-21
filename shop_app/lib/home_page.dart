import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/products_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> tagList = ["All", "Adidas", "Nike", "Puma", "Bata"];

  var selected = 0;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Shoes\nCollection",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(height: 40, child: TagList()),
            // ),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Chip(
                        label: Text(tagList[index]),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide(
                          color: selected == index
                              ? Color.fromARGB(255, 250, 202, 29)
                              : Color.fromARGB(255, 233, 243, 248),
                        ),
                        backgroundColor: selected == index
                            ? Color.fromARGB(255, 250, 202, 29)
                            : Color.fromARGB(255, 233, 243, 248),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) => SizedBox(
                  width: 10,
                ),
                itemCount: tagList.length,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductsCard(
                      title: product['title'] as String,
                      price: product['price'] as double,
                      image: product['imageUrl'] as String,
                      backgroundColor: index.isEven
                          ? Color.fromARGB(255, 165, 208, 228)
                          : Color.fromARGB(255, 233, 243, 248),
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: products.length),
            )
          ],
        ),
      ),
    );
  }
}
