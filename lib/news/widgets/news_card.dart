import 'package:flutter/material.dart';
import 'package:week2/news/widgets/news_view_page.dart';

class CustomNewsCard extends StatefulWidget {
  final String title, author;
  const CustomNewsCard({super.key, required this.author, required this.title});

  @override
  State<CustomNewsCard> createState() => _CustomNewsCardState();
}

class _CustomNewsCardState extends State<CustomNewsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 195, 207, 224),
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
              width: MediaQuery.sizeOf(context).width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.justify,
                  ),
                  Text(widget.author),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.1,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsViewPage(
                              title: widget.title,
                              author: widget.author,
                            )),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
