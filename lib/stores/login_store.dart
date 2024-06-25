
import 'dart:ui';

import 'package:mobx/mobx.dart';

//Para incluir o arquivo gerado
part 'login_store.g.dart';

//Mesclando as classes (atual e gerada)
class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  //Store - indica que deverá pegar e observar todos os annotation (@observable, @action)
  // e fazer algo com eles

  @observable //definindo a variável como observable
  String email = "";

  @action //declarando função como action
  void setEmail(String value) => email = value;

  @observable //definindo a variável como observable
  String password = "";

  @action //declarando função como action
  void setPassword(String value) => password = value;

  @observable //definindo a variável como observable
  bool passwordVisible = false;

  @action //declarando função como action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable //definindo a variável como observable
  bool loading = false;

  @observable //definindo a variável como observable
  bool loggedIn = false;

  //@computed é usado para combinar estados de observables
  //sempre que utilizarmos um @computed, precisamos declarar um Getter
  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  //Combinando @computeds
  @computed
  VoidCallback? get loginPressed =>
      (isEmailValid && isPasswordValid && !loading) ? login : null;

  // estou validando os dois observables (email, senha) e através do @computed
  // fazendo as validações/operações e retornando um novo valor

  @action //declarando função como action
  Future<void> login() async {
    loading = true;

    //processando dados
    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;

    //resetando os valores
    email = "";
    password = "";
  }

  @action
  void logout() {
    loggedIn = false;
  }


}





// _LoginStore() {
//   // autorun é uma reação que é chamada sempre que um observable contido nela tem seu dado lido e/ou modificado.
//   autorun((_) {
//     //aqui será chamado
//     print(isFormValid);
//   });
// }
