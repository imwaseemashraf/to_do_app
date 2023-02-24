import 'package:flutter/material.dart';

Widget searchField() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(color: Colors.black12),
      ],
      borderRadius: BorderRadius.circular(20),
      color: Colors.white30,
    ),
    child: TextField(
      onChanged: (val) {},
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black45,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            minHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Search"),
    ),
  );
}
