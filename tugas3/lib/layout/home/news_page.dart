import 'package:flutter/material.dart';
import 'package:tugas3/layout/model/get_news.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'api_page/news_card.dart';

class Newspage extends StatefulWidget {
  Newspage({Key? key})  : super(key: key);

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  Future<List<GetNews>> fetchPosts() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    print(response.statusCode);
    print(response.body);

if (response.statusCode == 200 ) {
  var getPostsData = json.decode(response.body) as List;
  var listsPosts = getPostsData.map((i) => GetNews.fromJson(i)).toList();
  return listsPosts;
 } else {
   throw Exception('Failed to load Posts');
 }
}

late Future<List<GetNews>> futurePosts;

@override
void initState() {
  super.initState();
  futurePosts = fetchPosts();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Post List'),
      centerTitle: true,
    ),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: FutureBuilder<List<GetNews>>(
          future: futurePosts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
              itemBuilder: ((context, index) {
                var post = (snapshot.data as List<GetNews>)[index];
                return Column(
                  children: [
                    NewsCard(
                      getnews: GetNews(
                          id: post.id,
                          title: post.title,
                          body: post.body),  // Getnews
                    ),
                    SizedBox(height: 20)
                  ],
                );
              }),
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: (snapshot.data as List<GetNews>).length);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } 
          return const CircularProgressIndicator();
        }),
      ),
    ),
  );
 }
}