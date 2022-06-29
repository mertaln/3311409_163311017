import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/home.dart';
import 'package:flutter_application_4/posts.dart';

import 'kayit.dart';

class Giris extends StatefulWidget {
  const Giris({Key? key}) : super(key: key);

  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Login
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  bool _isObscure = true;
  bool loading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String loginErrorMessage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //LOGIN FORM
                Column(
                  children: [
                    //Email Input
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false ? _isObscure : false,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Color(0xFFffffff),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFfffffff)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFffffff)),
                          ),
                        ),
                      ),
                    ),

                    //Password Input
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        controller: _passwordController,
                        obscureText: true ? _isObscure : false,
                        decoration: InputDecoration(
                            labelText: 'Şifre',
                            labelStyle: const TextStyle(
                              color: Color(0xFFffffff),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFffffff)),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFffffff)),
                            ),
                            suffixIcon: true
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                    icon: _isObscure
                                        ? const Icon(
                                            Icons.visibility_off,
                                            color: Color(0xFF979797),
                                          )
                                        : const Icon(
                                            Icons.visibility,
                                            color: Color(0xFFffffff),
                                          ),
                                  )
                                : null),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                loginErrorMessage != ""
                    ? Center(
                        child: Text(loginErrorMessage),
                      )
                    : SizedBox(),
                const SizedBox(
                  height: 20,
                ),
                //Giriş BUTTON
                InkWell(
                  onTap: () async {
                    setState(() {
                      loginErrorMessage = "";
                    });
                    try {
                      await signIn(
                              _emailController.text, _passwordController.text)
                          .then((value) {
                        return Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      });
                    } catch (e) {
                      setState(() {
                        loginErrorMessage = e.toString();
                      });
                      print(e);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFFffffff)),
                    child: Text(
                      "Giriş",
                      style: const TextStyle(
                        color: Color(0xFF1B383A),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ).copyWith(color: const Color(0xff045C74)),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),

                //Kayıt Ol
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        /*   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AuthenticationRegister())); */
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Kayit()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFFffffff)),
                        child: Text(
                          "Kayıt Oluştur",
                          style: const TextStyle(
                            color: Color(0xFF1B383A),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ).copyWith(color: const Color(0xff045C74)),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /*   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AuthenticationRegister())); */
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PostsPage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFFffffff)),
                        child: Text(
                          "İletişim",
                          style: const TextStyle(
                            color: Color(0xFF1B383A),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ).copyWith(color: const Color(0xff045C74)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
