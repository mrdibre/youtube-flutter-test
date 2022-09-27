import 'package:flutter/material.dart';
import 'package:youtube_getx/modules/auth/factory/auth-facade.factory.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key, required Function onSignIn }): super(key: key) {
    _onSignIn = onSignIn;
  }

  @override
  State<SignIn> createState() => _SignInState();

  late Function _onSignIn;
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _handleSignIn() async {
    var user = await auth().signIn(_emailController.text, _passwordController.text);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Olá ${user.name}")));

      widget._onSignIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236,
      color: Color(0xFF737373),
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )
        ),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: Colors.black54),
                  ),
                  label: Text("Email"),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {},
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 4, color: Colors.black54),
                    ),
                    label: Text("Senha"),
                    prefixIcon: IconButton(
                      icon: Icon(Icons.lock),
                      onPressed: () {},
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40)
                  ),
                  onPressed: _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty ? _handleSignIn : null,
                  child: Text("Acessar")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
