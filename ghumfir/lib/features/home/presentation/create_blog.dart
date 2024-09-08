import 'package:flutter/material.dart';
import 'package:ghumfir/themes/colors.dart';

class CreateBlog extends StatefulWidget {
  const CreateBlog({super.key});

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Blog'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your blog title',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 22),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Enter your blog content',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                children: [
                  ...List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        "",
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              OutlinedButton(
                onPressed: () {},
                child: SizedBox(
                    height: 46,
                    width: double.maxFinite,
                    child: Center(child: Text("Upload Images"))),
              ),
              const SizedBox(height: 16),
              MaterialButton(
                color: AppColors.blue,
                onPressed: () {},
                child: SizedBox(
                    height: 46,
                    width: double.maxFinite,
                    child: Center(child: Text("Create Blog"))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
