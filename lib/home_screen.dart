import 'package:adapter_dp2/adapter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = FinalPosts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('adapter design pattern'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0).copyWith(top: 0, bottom: 0),
              child: ListView.builder(
                itemBuilder: (_, index) {
                  final post = data.getPosts()[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Card(
                      elevation: 6,
                      child: ListTile(
                        title: Text(
                          post.title.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          post.desc.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: data.getPosts().length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
