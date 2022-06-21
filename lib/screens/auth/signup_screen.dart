import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mz_taxi_driver_app/global/global.dart';
import 'package:mz_taxi_driver_app/screens/screens.dart';
import 'package:mz_taxi_driver_app/widgets/app_text.dart';
import 'package:mz_taxi_driver_app/widgets/progress_dialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  saveDriverInfo() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext c) {
        return const ProgressDialog(
            message: 'Processando, Por favor espere...');
      },
    );

    final User? firebaseUser = (await firebaseAuth
            .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
            .catchError(
      (msg) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Error: " + msg.toString());
      },
    ))
        .user;

    if (firebaseUser != null) {
      Map driverMap = {
        "id": firebaseUser.uid,
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
      DatabaseReference driversRef =
          FirebaseDatabase.instance.ref().child('drivers');
      driversRef.child(firebaseUser.uid).set(driverMap);
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "A sua conta foi criada com sucesso.");
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => CarInfoScreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Erro ao criar Usuario');
    }
  }

  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      Fluttertoast.showToast(msg: 'O nome deve ter pelo menos 3 caracteres');
    } else if (emailTextEditingController.text.isNotEmpty &&
        !emailTextEditingController.text.contains('@') &&
        !emailTextEditingController.text.contains('.')) {
      Fluttertoast.showToast(
          msg: 'O email esta incorrecto, siga o examplo (john@email.com)');
    } else if (emailTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'O email e obrigatorio');
    } else if (phoneTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'O telefone deve ser fornecido');
    } else if (passwordTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'A Senha e obrigatoria');
    } else if (passwordTextEditingController.text.isNotEmpty &&
        passwordTextEditingController.text.length < 6) {
      Fluttertoast.showToast(msg: 'A Senha deve conter 6 ou mais caracteres');
    } else {
      saveDriverInfo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/desarrollo-app-taxi.jpg"),
              ),
              const SizedBox(
                height: 10,
              ),
              const AppText(
                fontSize: 26,
                text: 'Cadastre-se como motorista',
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              TextField(
                controller: nameTextEditingController,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Nome",
                  hintText: "Nome",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "Email",
                  hintText: "Email",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: "Telefone",
                  hintText: "Telefone",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: "Senha",
                  hintText: "Senha",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 10,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  validateForm();
                  /*   Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const CarInfoScreen())); */
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                child: const AppText(
                  text: "Criar a conta",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: const Text(
                  "Tens uma conta? Login aqui",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
