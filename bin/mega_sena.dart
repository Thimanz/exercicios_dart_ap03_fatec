import 'dart:io';
import 'dart:math';

Map<String, List<int>> getListas() {
  List<int> bilhete = [];
  List<int> gabarito = [];
  var gerador = Random();
  stdout.writeln();
  for (int i = 0; i < 6; i++) {
    stdout.write("Digite o ${i + 1} número: ");
    var entrada = stdin.readLineSync();
    int numero = 0;
    if (entrada != null) numero = int.parse(entrada);
    while (entrada == null ||
        numero < 1 ||
        numero > 100 ||
        bilhete.contains(numero)) {
      stdout.write('Digite um numero válido!');
      entrada = stdin.readLineSync();
      if (entrada != null) numero = int.parse(entrada);
    }
    bilhete.add(numero);
    gabarito.add(gerador.nextInt(100) + 1);
  }
  return {"bilhete": bilhete, "gabarito": gabarito};
}

void printResultado(List<int> bilhete, List<int> gabarito) {
  List<int> resultado = [];
  for (final jogada in bilhete) {
    if (gabarito.contains(jogada)) resultado.add(jogada);
  }
  if (resultado.isEmpty) {
    print("Você não acertou nenhum número\n");
  } else {
    print("Você acertou o(s) número(s) ${resultado.join(", ")}\n");
  }
}

void main(List<String> arguments) {
  var listas = getListas();
  var bilhete = listas["bilhete"];
  var gabarito = listas["gabarito"];

  print(
      "\nSeu bilhete: ${bilhete.toString()}  -  Gabarito: ${gabarito.toString()}\n");
  printResultado(bilhete!, gabarito!);
}
