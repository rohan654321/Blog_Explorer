import 'package:blog_explorer/controler/provider/blog_provider.dart';
import 'package:blog_explorer/model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'details_blog.dart';

class ListBlogsScreen extends StatefulWidget {
  const ListBlogsScreen({super.key});

  @override
  State<ListBlogsScreen> createState() => _ListBlogsScreenState();
}

class _ListBlogsScreenState extends State<ListBlogsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              backgroundColor: Colors.white,
              title:
                  Image.asset('assets/572.png', fit: BoxFit.cover, height: 100),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          body: Consumer<BlogProvider>(builder: (context, blogProvider, child) {
            if (blogProvider.isLoading == true) {
              return ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey.shade300,
                        child: Container(
                          height: 25.h,
                          width: 100.w,
                          margin: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.sp)),
                        ));
                  });
            } else {
              return ListView.builder(
                  itemCount: blogProvider.blogs.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    BlogModel currentBlog = blogProvider.blogs[index];

                    return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 1.h,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 1.h,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlogDetails(
                                            imageUrl: currentBlog.image!,
                                            title: currentBlog.title!)));
                              },
                              child: Container(
                                height: 20.h, width: 100.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          currentBlog.image!,
                                        ),
                                        fit: BoxFit.cover)),
                                // child: Image.network(
                                //   currentBlog.image!,
                                //   fit: BoxFit.fitWidth,
                                // ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              currentBlog.title!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ));
                  });
            }
          })),
    );
  }
}
