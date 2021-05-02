import 'package:flutter/material.dart';
import 'package:pp_news_app_api/models/newsinfo.dart';
import 'package:pp_news_app_api/pages/details.dart';
import 'package:pp_news_app_api/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModels> _newsModels;

  @override
  void initState() {
    // TODO: implement initState
    _newsModels = API_manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
          child: FutureBuilder<NewsModels>(
        future: _newsModels,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var article = snapshot.data.articles[index];
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => NewsDetail(
                              articleDesc: article.content,
                              articleImage: article.urlToImage,
                              articleTitle: article.title,
                            )),
                  ),
                  child: Container(
                      height: 90,
                      color: Colors.grey,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: ListTile(
                            leading: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Container(
                                // color: Colors.red,
                                width: 100,
                                height: 180,
                                child: Card(
                                  elevation: 2,
                                  clipBehavior: Clip.hardEdge,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Image.network(
                                    article.urlToImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              article.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                            contentPadding: EdgeInsets.all(2),
                            minVerticalPadding: 10,
                            subtitle: Text(
                              article.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      )),
                );
              },
              itemCount: snapshot.data.articles.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }
}
