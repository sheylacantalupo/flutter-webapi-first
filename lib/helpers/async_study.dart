import 'dart:math';

asyncStudy() {
  //execucaoNormal();
  //assincronismoBasico();
  //usandoFuncoesAssincronas();
  esperandoFuncoesAssincronas();

}
void execucaoNormal() {
  print("\nExecução normal");
  print("01");
  print("02");
  print("03");
  print("04");
  print("05");
}

void assincronismoBasico(){
  print("\nAssincronismo Básico");
  print("01");
  print("02");
  Future.delayed(Duration(seconds: 2), (){
    print("03");
  });
  print("04");
  print("05");
}

void usandoFuncoesAssincronas(){
  print("\nUsando Funções Assincronas");
  print("A");
  print("B");
  getRandomInt(3).then((value) {
    print("O número aleatório é ${value}.");
  });
  print("C");
  print("D");
}

void esperandoFuncoesAssincronas() async{
  print("\nUsando Funções Assincronas");
  print("A");
  print("B");
  int number =  await getRandomInt(3);
  print("O outro número aleatório é ${number}");
  print("C");
  print("D");
}

Future<int>getRandomInt(int time) async{
  await Future.delayed(Duration(seconds: time));
  Random rng = Random();
  return rng.nextInt(10);
}