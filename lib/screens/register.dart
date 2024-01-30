import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Logo(),
                _Form(),
                _FormLabels(
                  ruta: 'login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: EdgeInsets.only(top: 50),
        child: const Center(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/tag-logo.png'),
              ),
              SizedBox(height: 20),
              Text(
                'Registro',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          Cinput(
              icon: Icons.perm_identity,
              placeholder: 'Nombre',
              keyboardType: TextInputType.emailAddress,
              textController: nameCtrl),
          Cinput(
              icon: Icons.email_outlined,
              placeholder: 'Correo Electronico',
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl),
          Cinput(
              icon: Icons.lock_outline,
              placeholder: 'Contraseña',
              isPassword: true,
              textController: passwdCtrl),
          Rbutton(
            text: 'Ingresar',
            onPressed: () => {print(emailCtrl.text), print(passwdCtrl.text)},
          ),
        ],
      ),
    );
  }
}

class _FormLabels extends StatelessWidget {
  final String ruta;

  const _FormLabels({super.key, required this.ruta});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '¿Ya tienes cuenta?',
          style: TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 10),
        GestureDetector(
          child: Text(
            'Ingresar',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, ruta);
          },
        ),
      ],
    );
  }
}
