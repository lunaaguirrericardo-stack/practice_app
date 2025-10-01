import 'package:flutter/material.dart';
import 'package:practice_app/widgets/widgets.dart';

class FormulariosScreen extends StatefulWidget {

  //Declaramos variables que serán parametros opcionales para la clase CustomInputField
   final String? hintText;
   final String? labelText;
   final String? helperText;
   final IconData? icon;
   final IconData? suffixIcon;
   
  const FormulariosScreen({super.key, this.hintText, this.labelText, this.helperText, this.icon, this.suffixIcon});

  @override
  State<FormulariosScreen> createState() => _FormulariosScreenState();
}

class _FormulariosScreenState extends State<FormulariosScreen> {

  Widget inputField({
    required String hintText,
    required String labelText,
    required String helperText,
    required IconData icon,
  }){
    
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        prefixIcon: Icon(icon),
        suffixIcon: Icon(widget.suffixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  // Devolvemos un Scaffold con un TextField
  return Scaffold(
    
    appBar: AppBar(title: customText(text: 'Formularios')),

    body: SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            inputField(
              hintText: widget.hintText ?? 'Nombre completo',
              labelText: widget.labelText ?? 'Nombre',
              helperText: widget.helperText ?? 'Solo caracteres',
              icon: widget.icon ?? Icons.person,
            ),
            SizedBox(height: 20),
            inputField(
              hintText: 'Telefono',
              labelText: 'Telefono',
              helperText: 'Ingresa tu telefono',
              icon: Icons.phone,
      ),

      SizedBox(height: 10),

      TextButton(
        onPressed: () => {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          minimumSize: Size(size.width * 0.75, 30),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
         ),
         child: Text('Acción'),
       )
    ],
        ),
      ),
    ),
  );
}
}

 