import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  startGame();
}

startGame() {
  print('Выберите режим игры: 1 или 2');
  print('1-Угадывать будете Вы , режим Рандом');
  print('2-Угадывать будет компьютер , режим Бинарный');

  String answer = stdin.readLineSync()!;

  if (answer == '1') {
    mode1();
  } else if (answer == '2') {
    mode2();
  } else {
    print('Ошибка. Введите цифру 1 или 2 , чтобы запустить игру');
  }
}

mode1() {
  print('Вы выбрали режим номер 1');
  int min = 1;
  int max = 100;
  int count = 0;
  int compNumber = Random().nextInt(max - min) + min;
  print(
      'Компьютер загадал число : $compNumber'); // написал чтобы быстро найти и проверить

  int myInput = 0;

  print('Введите ваше число :');
  while (myInput != compNumber) {
    print('Я загадал число :${myInput = int.parse(stdin.readLineSync()!)} ');
    if (myInput < compNumber) {
      print('Число компьютера Больше');
      print('Введите число снова:');
    } else if (myInput > compNumber) {
      print('Число компьютера Мешьше');
      print('Введите число снова:');
    } else {
      print('Да, все верно, Вы угадали загаданное число');
    }
    count++;
    print('Вы угадали число компьютера $compNumber за $count шагa(ов)');
  }
}

mode2() {
  print('Вы выбрали режим номер 2');
  int min = 1;
  int max = 100;
  int middle = (max + min) ~/ 2;
  int count = 0;
  int compNumber = Random().nextInt(max - min) + min;
  print('Компьютер загадал число $compNumber');// написал чтобы быстро найти и проверить

  while (middle != compNumber) {
    middle = (max + min) ~/ 2;
    print('Это число $middle?');

    if (middle > compNumber) {
      print('Меньше');
      max = middle - 1;
    } else if (middle < compNumber) {
      print('Больше');
      min = middle + 1;
    } else {
      print('Да, все верно, Вы угадали загаданное число');
      print('Вы угадали число компьютера $compNumber за $count шагa(ов)');
    }
    count++;
  }
}
