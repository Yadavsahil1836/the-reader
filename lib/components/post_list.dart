import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shimmer/shimmer.dart';
import 'post_item.dart';

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<dynamic> posts = [];
  bool isLoading = true;
  late ScrollController _scrollController;
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController =
        ScrollController()..addListener(() {
          setState(() {
            _showBackToTopButton = _scrollController.offset > 300;
          });
        });
    fetchPosts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        posts = jsonDecode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('𝚝𝚑𝚎 𝚛𝚎𝚊𝚍𝚎𝚛'), centerTitle: true),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF21272C), Color(0xFF2C333A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: isLoading ? buildShimmer() : buildAnimatedList(),
      ),
      floatingActionButton:
          _showBackToTopButton
              ? FloatingActionButton(
                onPressed: _scrollToTop,
                child: Icon(Icons.keyboard_arrow_up, color: Colors.blueAccent),
              )
              : null,
    );
  }

  Widget buildShimmer() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder:
          (_, __) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade700,
              highlightColor: Colors.grey.shade500,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
    );
  }

  Widget buildAnimatedList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: Duration(milliseconds: 500 + (index * 100)),
          builder:
              (context, value, child) => Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              ),
          child: PostItem(title: post['title'], body: post['body']),
        );
      },
    );
  }
}
