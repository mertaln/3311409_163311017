import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/home.dart';

class Kayit extends StatefulWidget {
  const Kayit({Key? key}) : super(key: key);

  @override
  _KayitState createState() => _KayitState();
}

class _KayitState extends State<Kayit> {
  bool _isObscure = true;
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<User?> createPerson(
    String name,
    String email,
    String password,
  ) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await user.user!.sendEmailVerification();

    await _firestore.collection("Users").doc(user.user!.uid).set({
      'Name': name,
      'email': email,
    });
    return user.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Üye Ol',
                style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 32,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 15,
            ),
            //Register Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        controller: _nameController,
                        obscureText: false ? _isObscure : false,
                        decoration: const InputDecoration(
                          hintText: 'İsim',
                          hintStyle: TextStyle(color: Color(0xFF979797)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff045C74)),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false ? _isObscure : false,
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Color(0xFF979797)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff045C74)),
                          ),
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: true ? _isObscure : false,
                        decoration: InputDecoration(
                          hintText: 'Şifre',
                          hintStyle: const TextStyle(color: Color(0xFF979797)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff045C74)),
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
                                          color: Color(0xff045C74),
                                        ))
                              : null,
                        ),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        controller: _passwordAgainController,
                        obscureText: true ? _isObscure : false,
                        decoration: InputDecoration(
                          hintText: 'Şifre(Tekrar)',
                          hintStyle: const TextStyle(color: Color(0xFF979797)),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff045C74)),
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
                                          color: Color(0xff045C74),
                                        ))
                              : null,
                        ),
                      )),
                ],
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            //BUTTON
            InkWell(
              onTap: () async {
                print(_nameController.text);
                if (_passwordController.text == _passwordAgainController.text) {
                  await createPerson(
                          _nameController.text.toLowerCase(),
                          _emailController.text.toLowerCase(),
                          _passwordController.text)
                      .then((value) {
                    return Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xff045C74),
                  ),
                  child: Text(
                    "Kayıt ol",
                    style: const TextStyle(
                      color: Color(0xFF1B383A),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ).copyWith(color: Color(0xFFFFFFFF)),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
