// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/themes/colors.dart';

class GuideProfile extends StatefulWidget {
  final String title;
  final String imageUrl;
  const GuideProfile({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<GuideProfile> createState() => _GuideProfileState();
}

class _GuideProfileState extends State<GuideProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            CachedNetworkImageProvider(widget.imageUrl),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Local Guide',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 5),
                      MaterialButton(
                        color: AppColors.blue,
                        onPressed: () {},
                        child: Text("Hire"),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                UserProfileRow(label: 'Name', value: widget.title),
                const Divider(),
                UserProfileRow(label: 'Rating', value: '4/5'),
                const Divider(),
                UserProfileRow(label: 'Email', value: 'manuelvilla@gmail.com'),
                const Divider(),
                UserProfileRow(label: 'Phone Number', value: '202-555-0159'),
                const Divider(),
                UserProfileRow(label: 'Location', value: 'Banjara Chowk'),
                const Divider(),
                UserProfileRow(label: 'Available', value: 'Offline'),
                const SizedBox(height: 20),
                const Text(
                  "Written Blog",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  // Adjust height as needed
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: 4, // Number of blog posts
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navigate to blog post
                          },
                          child: BlogCard(
                            blogPost: BlogPost(
                              title: 'Blog Post $index',
                              excerpt:
                                  'This is a short excerpt from blog post $index...',
                              imageUrl:
                                  "https://abovethehimalaya.com/wp-content/uploads/2019/08/nepal-visa.jpg",
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfileRow extends StatelessWidget {
  final String label;
  final String value;

  UserProfileRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 89, 88, 88),
                  fontSize: 15,
                  height: 2)),
          Text(value,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              )),
        ],
      ),
    );
  }
}

class BlogPost {
  final String title;
  final String excerpt;
  final String imageUrl;

  BlogPost(
      {required this.title, required this.excerpt, required this.imageUrl});
}

class BlogCard extends StatelessWidget {
  final BlogPost blogPost;

  BlogCard({required this.blogPost});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              blogPost.imageUrl,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    blogPost.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    blogPost.excerpt,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Read More',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> guideImageLink = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyNcJXUzK-LC-8dIAff4UZNHOwddbyMdo9c6qlzhjJWBs5ps-331CnDQhum_5n63MNU8A&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQA6egjwnu74xqAgNjzL1jaCZz98tF5jUuYw&s",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4syribkNb9csmFvW7RKUfth3qcwApken8F-ntMoW0xT4smvmuXsh3exnGYczK9CpjdL4&usqp=CAU",
  "https://res.cloudinary.com/tourhq/image/upload/c_fill,g_face,fl_progressive,h_498,q_auto,w_390/cdn11syfidaeqz37dccd",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6Bn-CGKeniMhgVJga1mYilGgxJJR7y3JpkWz_LgF4A4VAE-H4RndwRL0iuMdgJ9lIBmM&usqp=CAU"
];
