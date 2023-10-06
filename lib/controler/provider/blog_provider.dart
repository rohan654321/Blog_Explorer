import 'package:flutter/material.dart';

import '../../model/blog_model.dart';
import '../Services/CRUD_services.dart';

class BlogProvider extends ChangeNotifier {
  bool isLoading = true;
  List<BlogModel> blogs = [];
  BlogProvider() {
    fetchBlog();
  }
  Future<void> fetchBlog() async {
    List<dynamic> data = await CRUDServices.getBlogData();
    List<BlogModel> temp = [];
    for (var blogData in data) {
      BlogModel newData = BlogModel.fromJSON(blogData);

      temp.add(newData);
    }

    blogs = temp;
    isLoading = false;
    notifyListeners();
  }
}
