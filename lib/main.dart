import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/first": (context) => FirstScreen(),
        // "/second": (context) => SecondScreen(),
      },
      title: 'login',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String done = 'Login';
  int currentIndex = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Registration form',
          textAlign: TextAlign.center,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'MOBILE NUMBER',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Create-Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 100, // Set button width
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => SecondScreen()));
                  },
                  child: Text('Register'),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 100, // Set button width
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => Login()));
                  },
                  child: Text('Login'),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your full name',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'MOBILE NUMBER',
                prefixIcon: Icon(Icons.person),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
                Navigator.pushReplacement(context,
                    CupertinoPageRoute(builder: (context) => SecondScreen()));
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    CupertinoPageRoute(builder: (context) => FirstScreen()));
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int currentIndex = 0;
  String buttonName1 = 'Scan';
  String buttonName2 = 'Leads';
  String buttonName3 = 'Settings';
  String buttonName4 = 'QR code';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120, // Set button width
                height: 120,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonName1 = 'NUMBER-1.clicked';
                    });
                  },
                  child: Text(buttonName1),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 120, // Set button width
                height: 120,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonName2 = 'NUMBER-2.clicked';
                    });
                  },
                  child: Text(buttonName2),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120, // Set button width
                height: 120,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonName3 = 'NUMBER-1.clicked';
                    });
                  },
                  child: Text(buttonName3),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 120, // Set button width
                height: 120,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonName4 = 'NUMBER-2.clicked';
                    });
                  },
                  child: Text(buttonName4),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'SETTINGS')
        ],
        selectedFontSize: 18.0, // Change the size of the selected icon
        unselectedFontSize: 14.0,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
