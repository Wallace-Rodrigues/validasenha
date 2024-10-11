import 'package:flutter/material.dart';

class Segunda extends StatefulWidget {
  const Segunda({super.key});

  @override
  State<Segunda> createState() => _SegundaState();
}

TextEditingController controlaNome = TextEditingController();
TextEditingController controlaSobrenome = TextEditingController();
TextEditingController controlaNasc = TextEditingController();
TextEditingController controlaSenha = TextEditingController();

FocusNode focoNome = FocusNode();

bool contemMaiusc(String text) {
  final regex = RegExp(r'[A-Z]');
  return regex.hasMatch(text);
}

bool contemNum(String text) {
  final regex = RegExp(r'[0-9]');
  return regex.hasMatch(text);
}

/* gi */

class _SegundaState extends State<Segunda> {
  var tamanho = 'A senha deve ter no mínimo 8 caracteres.\n';
  var maiuscula = 'A senha deve conter uma letra maiúscula.\n';
  var numeros = 'A senha deve conter 3 números.\n';
  var especiais =
      'A senha deve conter 2 caracteres especiais: !@#%^&*()?_-+=\n';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              focusNode: focoNome,
              controller: controlaNome,
              decoration: const InputDecoration(
                labelText: ("Nome: "),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: controlaSobrenome,
              decoration: const InputDecoration(
                labelText: ("Sobrenome: "),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: controlaNasc,
              decoration: const InputDecoration(
                labelText: ("Nascimento: "),
                helperText: "Exemplo: 01/01/1970",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: controlaSenha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: ("Senha: "),
                helperText: tamanho + maiuscula + numeros + especiais,
                border: const OutlineInputBorder(),
              ),
              onChanged: (value) {
                if (value.length >= 8) {
                  setState(() {
                    tamanho = "";
                  });
                } else {
                  setState(() {
                    tamanho = 'A senha deve ter no mínimo 8 caracteres.\n';
                  });
                }

                if (contemMaiusc(value) == true) {
                  setState(() {
                    maiuscula = "";
                  });
                } else {
                  setState(() {
                    maiuscula = 'A senha deve conter uma letra maiúscula.\n';
                  });
                }

                if (contemNum(value) == true) {
                  setState(() {
                    numeros = "";
                  });
                } else {
                  setState(() {
                    numeros = 'A senha deve conter 3 números.\n';
                  });
                }

                /* if(contemEspec(value)==true){
                  setState(() {
                    especiais = "";
                  });
                }
                else{
                  setState(() {
                    especiais = 'A senha deve conter 2 caracteres especiais: !@#%^&*()?_-+=\n';
                  });
                } */
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                    onPressed: () {
                      setState(() {
                        controlaNome.clear();
                        controlaSobrenome.clear();
                        controlaNasc.clear();
                        controlaSenha.clear();
                        focoNome.requestFocus();
                        tamanho = 'A senha deve ter no mínimo 8 caracteres.\n';
                      });
                    },
                    child: const Text("Limpar")),
                const SizedBox(
                  width: 10,
                ),
                FilledButton(onPressed: () {}, child: const Text("Enviar")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
