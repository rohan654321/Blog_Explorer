import 'package:flutter/material.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key, required this.imageUrl, required this.title});

  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.blue,
            title: Text(title),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14)
            ],
          ),
        ),
      ),
    );
  }
}
