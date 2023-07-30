import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/home/home_page.dart';
import 'package:flutter_boilerplate/shared_preferences/shared_preferences.dart';
import 'package:flutter_boilerplate/models/user_model.dart';
import 'package:flutter_boilerplate/services/product_service/authentication_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
  static const String routeName = '/';
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';
  bool rememberMe = false;
  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log In',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 300,
            height: 500,
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Text("Please login to continue",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 20),
                  Divider(
                    color: Colors.grey[600],
                    indent: 30,
                    endIndent: 30,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Remember me"),
                      // checkbox to remember the user
                      Checkbox(
                          value: rememberMe,
                          fillColor: MaterialStateProperty.all(Colors.blue),
                          onChanged: (bool? value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          }),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Function to login
  void login() async {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        // handle the states of login process
        return FutureBuilder(
            future: AuthenticateService().login(_email, _password),
            builder: (context, AsyncSnapshot<UserModel> snap) {
              if (snap.hasData && snap.data!.succeeded!) {
                // call the function to save the token to local memory if the user wants to stay signed in
                if (rememberMe) {
                  SPService().saveTokenToMemory(snap.data!.user!.jwToken!);
                }

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Succesfully loged in!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.blue,
                    ),
                  );
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                        // will change to the dashboard page
                        title: '',
                      ),
                    ),
                    (route) => false,
                  );
                });

                return const SizedBox();
              } else if (snap.hasData && !snap.data!.succeeded!) {
                return Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: SimpleDialog(
                      shape: ShapeBorder.lerp(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        1,
                      ),
                      title: const Text("Login failed!"),
                      children: [
                        SizedBox(
                          height: 100,
                          width: 150,
                          child: Column(
                            children: [
                              Text("Error: ${snap.data!.message}"),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Ok"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snap.hasError) {
                return SimpleDialog(
                  title: const Text("There is an issue with connection!"),
                  children: [
                    Text("Error: ${snap.error.toString()}"),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok"),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            });
      },
    );
  }
}
