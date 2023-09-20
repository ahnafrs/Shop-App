import 'package:flutter/material.dart';

class TagList extends StatefulWidget {
  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  final _tagList = <String>["All", "Adidas", "Nike", "Puma", "Bata"];

  var selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selected = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  color: selected == index
                      ? Color.fromARGB(255, 250, 202, 29)
                      : Color.fromARGB(255, 245, 245, 245),
                  border: Border.all(
                    color: selected == index
                        ? Color.fromARGB(255, 255, 230, 0).withOpacity(0.2)
                        : Color.fromARGB(255, 245, 245, 245),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _tagList[index],
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          separatorBuilder: (_, index) => SizedBox(
                width: 10,
              ),
          itemCount: _tagList.length),
    );
  }
}
