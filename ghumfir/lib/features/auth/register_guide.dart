import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ghumfir/features/auth/login.dart';

class RegisterGuide extends StatefulWidget {
  const RegisterGuide({super.key});

  @override
  State<RegisterGuide> createState() => _RegisterGuideState();
}

class _RegisterGuideState extends State<RegisterGuide> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    "assets/images/GhumfirLogo.png",
                  ),
                  height: 250,
                  color: Color.fromARGB(255, 112, 128, 144),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: " Name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 112, 128, 144),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 30),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: "PhoneNumber",
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Color.fromARGB(255, 112, 128, 144),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 112, 128, 144))),
                  child: const Center(
                    child: Text(
                      "Register as Tourist",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(TextSpan(children: [
                  const TextSpan(
                    text: "Already have an account ?",
                  ),
                  TextSpan(
                      text: ' Login Here',
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        }),
                ])),
                const SizedBox(
                  height: 20,
                ),
              ]),
        ),
      ),
    ));
  }
}
