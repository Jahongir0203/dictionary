import 'package:flutter/material.dart';

Widget buildItemBuilder({required String wordEng, required String wordUz}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            wordEng==0 ? 'no': wordEng,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Icon(
              Icons.mic_rounded,
              color: Colors.redAccent,
            ),
          )
        ],
      ),
    ),
  );
}