import 'package:flutter/material.dart';
import 'package:correios/models/pacote.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:get/get.dart';

class finalizar extends StatefulWidget {
  Pacote pacote;
  finalizar({Key? key, required this.pacote}) : super(key: key);

  @override
  State<finalizar> createState() => _finalizarState();
}

class _finalizarState extends State<finalizar> {
  final _formfim = GlobalKey<FormState>();
  final TextEditingController CPFcontrolador = TextEditingController();
  confirmar(){
    if(_formfim.currentState!.validate()) {

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Entrega encerrada com sucesso.'),)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          size: 30.0,
          color: Colors.white,

        ),
        title: Text('Encerrar entrega',
            style: TextStyle(
              color: Colors.white,
            )),

      ),
    body: Padding(

    padding: const EdgeInsets.all(16.0),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Form(
        key: _formfim,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(16),
                child: Text(
                  'Informe o CPF e foto da assinatura de ${widget.pacote.proprietario} ou equivalente:',
                  textAlign: TextAlign.center,

                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),

                child: TextFormField(

                  controller: CPFcontrolador,
                  textCapitalization: TextCapitalization.words,

                  decoration: InputDecoration(hintText: "000.000.000-00",
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                        borderSide:  BorderSide(color: Colors.deepOrange),

                      ),
                      labelText: "CPF do recebedor",
                      prefixIcon: Icon(Icons.person)

                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Informe um cpf válido';
                    }
                    return null;
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(6),
                child: Text(
                  'Foto:',
                  textAlign: TextAlign.center,

                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: SizedBox(
                  width: 150,
                  height: 45,

                  child: ElevatedButton.icon(
                    icon: Icon(Icons.camera_alt, color: Colors.white,),
                    label: Text(
                      'Tirar foto',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,

                      ),
                    ),

                    onPressed: () => Get.to(
                          () => CameraCamera(onFile: (file) => print(file)),
                    ),


                  ),
                ),

              ),
              Container(
                margin: const EdgeInsets.only(top: 300.0),
                child: SizedBox(
                  width: 350,
                  height: 45,

                  child: ElevatedButton.icon(

                    icon: Icon(Icons.check, color: Colors.white,),
                    label: Text(
                      'Finalizar',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,

                      ),
                    ),

                onPressed: () async {
                if(_formfim.currentState!.validate()) {
                print('Botão funciona');

                setState(() {


                confirmar();
                Navigator.pushNamed(context, "/Home");


                });
                }


                },


                  ),
                ),
              ),
            ],
          )
      ),
    ],
    ),
    ),
    ),
    );
  }
}
