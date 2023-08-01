import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/dashboard/dasboard.dart';
import 'package:flutter_boilerplate/models/user_model.dart';
import 'package:flutter_boilerplate/services/product_service/authentication_service.dart';
import 'package:flutter_boilerplate/shared_preferences/shared_preferences.dart';

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
  bool passwordVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          primary: true,
          child: Row(
            children: [
              Expanded(
                flex: 13,
                child: Stack(
                  children: [
                    Positioned(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Opacity(
                          opacity: 0.7,
                          child: Image.asset(
                            "assets/images/cat.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Positioned(
                          bottom: 0,
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.black.withOpacity(0.5)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(bottom: 30.0),
                                child: AnimatedText()),
                            const Divider(
                              color: Colors.white,
                              thickness: 2,
                              indent: 100,
                              endIndent: 100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            side: const BorderSide(
                                                color: Colors.grey)))),
                                onPressed: () {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Will be available soon!",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        duration: const Duration(seconds: 2),
                                        backgroundColor: Colors.amber,
                                      ),
                                    );
                                  });
                                },
                                icon: const Image(
                                  image: AssetImage('assets/images/google.png'),
                                  height: 20,
                                ),
                                label: const Text(
                                  "Google ile giriş yap",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Başlamak için giriş yapın:)",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold)),
                          const SizedBox(height: 40),
                          TextFormField(
                            enableSuggestions: true,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber)),
                              fillColor: Colors.black,
                              labelText: 'E-posta',
                              labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(Icons.mail, color: Colors.amber),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 3)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Lütfen e-posta adresinizi giriniz!';
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
                            style: const TextStyle(color: Colors.black),
                            textInputAction: TextInputAction.go,
                            obscureText: passwordVisible,
                            onFieldSubmitted: (value) => login(),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amber)),
                              labelText: 'Parola',
                              labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.amber),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              suffixIcon: IconButton(
                                color: Colors.amber,
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
                                return 'Lütfen parolanızı giriniz!';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Beni Hatırla",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                              // checkbox to remember the user
                              Checkbox(
                                  value: rememberMe,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.amber),
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberMe = value ?? false;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.amber[600]),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        side: const BorderSide(
                                            color: Colors.amber)))),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                            child: Text(
                              'Giriş Yap',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .fontSize),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                  SPService().saveToken(snap.data!.user!.jwToken!);
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
                      backgroundColor: Colors.amber,
                    ),
                  );
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
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

// animated text widget to show the text "Merhaba, Hoş Geldiniz"
class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation and repeat it indefinitely
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: Text(
            "Merhaba\nHoş Geldiniz:)",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        );
      },
    );
  }
}
