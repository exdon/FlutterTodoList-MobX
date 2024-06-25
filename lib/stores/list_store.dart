import 'package:mobx/mobx.dart';
import 'package:todo_mobx/stores/todo_store.dart';

//Para incluir o arquivo gerado
part 'list_store.g.dart';

//Mesclando as classes (atual e gerada)
class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {

  @observable //definindo a variável como observable
  String newTodoTitle = "";

  @action //declarando função como action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;

  //Observable de lista
  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    // adicionando um novo item na lista no topo
    todoList.insert(0, TodoStore(newTodoTitle));
    //resetando texto
    newTodoTitle = "";
  }

}