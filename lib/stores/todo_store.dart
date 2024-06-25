import 'package:mobx/mobx.dart';

//Para incluir o arquivo gerado
part 'todo_store.g.dart';

//Mesclando as classes (atual e gerada)
class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {

  _TodoStore(this.title);

  //Como title não irá mudar, não precisa ser um observable
  final String title;

  @observable //definindo a variável como observable
  bool done = false;

  @action //declarando função como action
  void toggleDone() => done = !done;

}