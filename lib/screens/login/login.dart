import 'package:flutter/material.dart';
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
  String _email = 'mehmetkmobil@gmail.com';
  String _password = '320732';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {}

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
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ElevatedButton(
                    onPressed: () {
                      login(
                          email: _email, password: _password, context: context);
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

  FutureBuilder<UserModel> login(
      {required String email,
      required String password,
      required BuildContext context}) {
    return FutureBuilder<UserModel>(
      future: AuthenticateService().login(email, password),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.user!.email!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
