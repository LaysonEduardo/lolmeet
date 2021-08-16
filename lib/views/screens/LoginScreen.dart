import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lolmeet/core/Fonts.dart';
import 'package:lolmeet/views/components/Dialogs/MainDialog.dart';
import 'package:lolmeet/views/components/LoginInput.dart';
import 'package:lolmeet/views/components/PasswordInput.dart';
import 'package:lolmeet/views/components/SimpleButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  PageController _pageController = PageController(initialPage: 0);
  bool emailRecover = false;
  var passwordWrongCount = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.3,
              0.5,
              1,
            ],
            colors: [
              Color(0xFF040E18),
              Color(0xFF0B1C26),
              Color(0xFF010B14),
            ],
          ),
        ),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Image.asset(
                            'assets/logo/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            'Preparado para encontrar seu duo?',
                            style: AppFonts.simpleText,
                          ),
                        ),
                        SizedBox(height: 20),
                        SimpleInput(
                          controller: _emailController,
                          label: 'Email',
                          icon: Icons.person,
                        ),
                        SizedBox(height: 5),
                        PasswordInput(
                          controller: _passwordController,
                          label: 'Senha',
                        ),
                        SizedBox(height: 20),
                        LoginButton(
                          text: 'Entrar',
                          function: logIn,
                        ),
                        Visibility(
                          visible: emailRecover,
                          child: MaterialButton(
                            onPressed: () {
                              Get.dialog(
                                MainDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Para recuperar sua senha informe o email cadastrado',
                                        textAlign: TextAlign.center,
                                        style: AppFonts.simpleText,
                                      ),
                                      SizedBox(height: 10),
                                      SimpleInput(
                                        controller: _emailController,
                                        label: 'Email Cadastrado',
                                        icon: Icons.person,
                                      )
                                    ],
                                  ),
                                  function: () async {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                            email: _emailController.text)
                                        .then((value) {
                                      MainDialog(
                                        content: Text(
                                          'Email para recuperação de senha encaminhado para o seu email',
                                          textAlign: TextAlign.center,
                                          style: AppFonts.simpleText,
                                        ),
                                        function: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      );
                                    });
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Esqueci minha senha',
                              style: AppFonts.simpleText,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(50), // <-- Radius
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        FittedBox(
                          child: MaterialButton(
                            onPressed: () {
                              _pageController.animateToPage(
                                1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text(
                              'Não possui uma conta? Crie já',
                              style: AppFonts.simpleText,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(50), // <-- Radius
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(
                          child: Text(
                            'Seu duo esta te esperando!',
                            style: AppFonts.simpleText,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            ' Crie sua conta agora',
                            style: AppFonts.simpleText,
                          ),
                        ),
                        SizedBox(height: 20),
                        SimpleInput(
                          controller: _emailController,
                          label: 'Email',
                          icon: Icons.person,
                        ),
                        SizedBox(height: 10),
                        PasswordInput(
                          controller: _passwordController,
                          label: 'Senha',
                        ),
                        SizedBox(height: 10),
                        PasswordInput(
                          controller: _confirmPasswordController,
                          label: 'Confirmar Senha',
                        ),
                        SizedBox(height: 20),
                        LoginButton(
                          text: 'Criar Conta',
                          function: createAccount,
                        ),
                        SizedBox(height: 10),
                        LoginButton(
                          text: 'Cancelar',
                          function: () {
                            _pageController.animateToPage(
                              0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(
            MainDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Este é um aplicativo feito por fã e não afiliado a Riot Games.',
                    textAlign: TextAlign.center,
                    style: AppFonts.helpText,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Qualquer referência ou material semelhante ao conteudo de League of Legends são de propriedades da Riot Games.',
                    textAlign: TextAlign.center,
                    style: AppFonts.helpText,
                  ),
                ],
              ),
              function: () {
                Navigator.pop(context);
              },
            ),
          );
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Icon(
          Icons.help,
          color: Color(0xFFC19C50),
        ),
      ),
    );
  }

  createAccount() async {
    if (_emailController.text == '') {
      Get.dialog(
        MainDialog(
          content: Text(
            'O Campo Email não pode ficar vazio',
            textAlign: TextAlign.center,
            style: AppFonts.simpleText,
          ),
          function: () {
            Navigator.pop(context);
          },
        ),
      );
    } else if (GetUtils.isEmail(_emailController.text) == false) {
      Get.dialog(
        MainDialog(
          content: Text(
            'O Email digitado não é válido',
            textAlign: TextAlign.center,
            style: AppFonts.simpleText,
          ),
          function: () {
            Navigator.pop(context);
          },
        ),
      );
    } else if (_passwordController.text == '' ||
        _confirmPasswordController.text == '') {
      Get.dialog(
        MainDialog(
          content: Text(
            'Os Campos das senhas não podem ficar vazio',
            textAlign: TextAlign.center,
            style: AppFonts.simpleText,
          ),
          function: () {
            Navigator.pop(context);
          },
        ),
      );
    } else if (_passwordController.text != _confirmPasswordController.text) {
      Get.dialog(
        MainDialog(
          content: Text(
            'As Senhas não conferem',
            textAlign: TextAlign.center,
            style: AppFonts.simpleText,
          ),
          function: () {
            Navigator.pop(context);
          },
        ),
      );
    } else {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((value) {
          var users = FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid);
          users.set({
            'displayName': value.user!.displayName ?? '',
            'about': '',
            'nickName': '',
            'games': '',
            'elo': '',
            'preferLane': '',
            'email': value.user!.email,
            'age': '',
            'photoURL': value.user!.photoURL ?? '',
            'photosProfile': '',
            'firstLogin': true,
          }).then((valueFirestore) => Get.dialog(
                MainDialog(
                  content: Text(
                    'Conta criada com sucesso',
                    textAlign: TextAlign.center,
                    style: AppFonts.simpleText,
                  ),
                  function: () {
                    Navigator.pop(context);
                    _pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              ));
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.dialog(
            MainDialog(
              content: Text(
                'Esta senha é muito fraca, capricha nessa senha ai',
                textAlign: TextAlign.center,
                style: AppFonts.simpleText,
              ),
              function: () {
                Navigator.pop(context);
              },
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          Get.dialog(
            MainDialog(
              content: Text(
                'Email ja cadastrado',
                textAlign: TextAlign.center,
                style: AppFonts.simpleText,
              ),
              function: () {
                Navigator.pop(context);
              },
            ),
          );
        }
      } catch (e) {
        Get.dialog(
          MainDialog(
            content: Text(
              'Erro $e, informe ao suporte imediatamente!',
              textAlign: TextAlign.center,
              style: AppFonts.simpleText,
            ),
            function: () {
              Navigator.pop(context);
            },
          ),
        );
      }
    }
  }

  // -- //

  logIn() async {
    if (_emailController.text == '') {
      Get.dialog(
        MainDialog(
          content: Text(
            'O Campo Email não pode ficar vazio',
            textAlign: TextAlign.center,
            style: AppFonts.simpleText,
          ),
          function: () {
            Navigator.pop(context);
          },
        ),
      );
    } else if (GetUtils.isEmail(_emailController.text) == false) {
      Get.dialog(
        MainDialog(
          content: Text(
            'O Email digitado não é válido',
            textAlign: TextAlign.center,
            style: AppFonts.simpleText,
          ),
          function: () {
            Navigator.pop(context);
          },
        ),
      );
    } else if (_passwordController.text == '') {
      Get.dialog(
        MainDialog(
          content: Text(
            'O Campo da senha não pode ficar vazio',
            textAlign: TextAlign.center,
            style: AppFonts.simpleText,
          ),
          function: () {
            Navigator.pop(context);
          },
        ),
      );
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((value) {
          Get.dialog(
            MainDialog(
              content: Text(
                'Ainda estamos em desenvolvimento, volte em breve',
                textAlign: TextAlign.center,
                style: AppFonts.simpleText,
              ),
              function: () async {
                await FirebaseAuth.instance
                    .signOut()
                    .then((value) => Navigator.pop(context));
              },
            ),
          );
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.dialog(
            MainDialog(
              content: Text(
                'Email não cadastrado',
                textAlign: TextAlign.center,
                style: AppFonts.simpleText,
              ),
              function: () {
                Navigator.pop(context);
              },
            ),
          );
        } else if (e.code == 'wrong-password') {
          setState(() {
            passwordWrongCount++;
            if (passwordWrongCount >= 3) {
              emailRecover = true;
            }
          });

          Get.dialog(
            MainDialog(
              content: Text(
                'Email ou senha inválidos',
                textAlign: TextAlign.center,
                style: AppFonts.simpleText,
              ),
              function: () {
                Navigator.pop(context);
              },
            ),
          );
        } else {
          Get.dialog(
            MainDialog(
              content: Text(
                'Erro $e, informe ao suporte imediatamente!',
                textAlign: TextAlign.center,
                style: AppFonts.simpleText,
              ),
              function: () {
                Navigator.pop(context);
              },
            ),
          );
        }
      }
    }
  }
}
