import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificarIMC() {
    double imc = calcularIMC();
    if (imc < 16) {
      return 'Magreza grave';
    } else if (imc >= 16 && imc < 17) {
      return 'Magreza moderada';
    } else if (imc >= 17 && imc < 18.5) {
      return 'Magreza leve';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Saudável';
    } else if (imc >= 25 && imc < 30) {
      return 'Sobrepeso';
    } else if (imc >= 30 && imc < 35) {
      return 'Obesidade Grau I';
    } else if (imc >= 35 && imc < 40) {
      return 'Obesidade Grau II (severa)';
    } else {
      return 'Obesidade Grau III (mórbida)';
    }
  }
}

void main() {
  try {
    stdout.writeln('Informe seu nome:');
    String nome = stdin.readLineSync()!;

    stdout.writeln('Informe seu peso (kg):');
    double peso = double.parse(stdin.readLineSync()!);

    stdout.writeln('Informe sua altura (m):');
    double altura = double.parse(stdin.readLineSync()!);

    Pessoa pessoa = Pessoa(nome, peso, altura);

    double imc = pessoa.calcularIMC();
    String classificacao = pessoa.classificarIMC();

    print('\nResultado:');
    print('Nome: $nome');
    print('IMC: ${imc.toStringAsFixed(2)}');
    print('Classificação: $classificacao');
  } catch (e) {
    print('Erro: Entrada inválida. Por favor, insira valores numéricos para peso e altura.');
  }
}
