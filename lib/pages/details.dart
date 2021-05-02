import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {
  final String articleTitle;
  final String articleImage;
  final String articleDesc;

  NewsDetail(
      {@required this.articleDesc,
      @required this.articleImage,
      @required this.articleTitle});
  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.articleTitle)),
      body: Padding(
        padding: const EdgeInsets.only(top: 17),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: Image.network(widget.articleImage, fit: BoxFit.cover),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  child: ListView(
                    children: [
                      Container(
                        child: Text(
                          widget.articleTitle,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Container(
                        child: Text(
                          widget.articleDesc,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
