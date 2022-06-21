import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mz_taxi_driver_app/global/global.dart';
import 'package:mz_taxi_driver_app/screens/screens.dart';
import 'package:mz_taxi_driver_app/widgets/app_text.dart';
import 'package:mz_taxi_driver_app/widgets/progress_dialog.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({Key? key}) : super(key: key);

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController carMarcaTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController =
      TextEditingController();
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  List<String> carTypeList = [
    'Veiculo Turismo',
    'Veiculo Txopela',
  ];

  String? selectedCarType;

  validateForm() {
    if (carMarcaTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'A Marca e obrigatoria');
    } else if (carNumberTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'A Matricula e obrigatoria');
    } else if (carModelTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'O modelo e obrigatorio');
    } else if (carColorTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'A Cor e obrigatoria');
    } else {
      saveCarInfo();
    }
  }

  saveCarInfo() async {
    Map driverCarInfoMap = {
      "car_color": carColorTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference driversRef =
        FirebaseDatabase.instance.ref().child("drivers");
    driversRef
        .child(currentFirebaseUser!.uid)
        .child("car_details")
        .set(driverCarInfoMap);

    Fluttertoast.showToast(
        msg: "Detalhes do carro salvo com sucesso, Parabens.");
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
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
                height: 2,
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
                text: 'Informacao do veiculo',
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              TextField(
                controller: carMarcaTextEditingController,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.model_training),
                  labelText: "Marca",
                  hintText: "Marca",
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
                controller: carModelTextEditingController,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.model_training),
                  labelText: "Modelo",
                  hintText: "Modelo",
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
                controller: carNumberTextEditingController,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.abc),
                  labelText: "Matricula",
                  hintText: "Matricula",
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
                controller: carColorTextEditingController,
                style: const TextStyle(
                  color: Colors.blue,
                ),
                decoration: const InputDecoration(
                  icon: Icon(Icons.color_lens),
                  labelText: "Cor",
                  hintText: "Cor",
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
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton(
                    hint: const AppText(
                      fontSize: 14,
                      text: "Selecione o Tipo",
                      color: Colors.blue,
                    ),
                    value: selectedCarType,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCarType = newValue.toString();
                      });
                    },
                    items: carTypeList.map((car) {
                      return DropdownMenuItem(
                        child: Text(
                          car,
                          style: TextStyle(color: Colors.blue),
                        ),
                        value: car,
                      );
                    }).toList()),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  validateForm();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                child: const AppText(
                  text: "Registar Veiculo",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
