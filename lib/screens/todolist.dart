import 'package:flutter/material.dart';
import 'package:tododetail/model/todo.dart';
import 'package:tododetail/util/dbhelper.dart';
import 'package:tododetail/screens/tododetail.dart';


final List<String> choices = const <String> [
  'all the Todos',
  'favorite'
  
];
      bool issearch=false;


const mnuAllTodo = 'all the Todos';
const mnuFavorite= 'favorite';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState(); 
  
}

class TodoListState extends State {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (todos == null) {
      todos = List<Todo>();
      getData();
    }
          

    return Scaffold(
      appBar: AppBar(
           // title: const Text('AppBar Bottom Widget'),
           title: issearch ?  Container(
      padding: EdgeInsets.only(left: 10.0),
      height: 35.0,
      width: 250.0,
      child: Center(child:Text('Search',style: TextStyle(
        color: Colors.grey.withOpacity(0.2),
        letterSpacing: 1.0,
        fontStyle: FontStyle.italic
      
      ),)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      )): GestureDetector(child: Text('Search !'),
       onTap: () {
                       setState(() {
                         issearch=true;
                       });
      }),


          leading: issearch ? GestureDetector(child: Icon(Icons.arrow_left,), onTap: () {
                       setState(() {
                         issearch=false;
                       });
                        }
                        ) : Container(),
           actions: <Widget>[
            
            
                    ]
                    
                  
                  ),
                
                  body: todoListItems(),
                  floatingActionButton: FloatingActionButton(
                    onPressed:() {
                      navigateToDetail(Todo('',3,''));
                    }
                    ,
                    tooltip: "Add new Todo",
                    backgroundColor: Colors.orangeAccent,
                    child: new Icon(Icons.add),
                  ),
                
                );
              }
              ListView todoListItems() {
                return ListView.builder(
                  itemCount: count,
                  itemBuilder: (BuildContext context, int position) {
                    return Dismissible(
                      key: Key(todos[position].title),
                       onDismissed: (DismissDirection direction) {
                         if (direction == DismissDirection.endToStart) {
                              helper.deleteTodo(todos[position].id);
                            }
                        
                       },
                      background: Container(color: Colors.red),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: getColor(this.todos[position].priority),
                          child:Text(this.todos[position].priority.toString()),
                        ),
                      title: Text(this.todos[position].title),
                      subtitle: Text(this.todos[position].date),
                      onTap: () {
                        debugPrint("Tapped on " + this.todos[position].id.toString());
                        navigateToDetail(this.todos[position]);
                      },
                      ),
            
            
            
                    );
                  },
                );
              }
              void getData() {
            
                        //if the database does not existe will create it
                final dbFuture = helper.initializeDb();
                dbFuture.then((result) {
                  final todosFuture = helper.getTodos();
            
                  todosFuture.then((result){
                    List<Todo> todoList = List<Todo>();
                    count = result.length;
                    for (int i=0; i<count; i++) {
                      todoList.add(Todo.fromObject(result[i]));
                      debugPrint(todoList[i].title);
                    }
                   
                    setState(() {
                              todos = todoList;
                              count = result.length;
                            });
                    debugPrint("Items " + count.toString());
                  });
                });
              }
            
              Color getColor(int priority) {
                switch (priority) {
                  case 1:
                    return Colors.red;
                    break;
                  case 2:
                    return Colors.purple;
                    break;
                  case 3:
                    return Colors.green;
                    break;
                  
                  default:
                    return Colors.green;
                }
              }
            
              void navigateToDetail(Todo todo) async {
                bool result = await Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => TodoDetail(todo)),
                );
                if (result == true) {
                  getData();
                }
              }
              
            
    void select (String value) async {

    switch (value) {
      case mnuAllTodo:
      setState(() {
        issearch=true;
      });
        break;
      case mnuFavorite:
        break;
        case mnuBack:
          break;
      default:

    }
  }
}