import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _newTask = TextEditingController();
  List<String> tasks = [];

  void handleAddNewTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        tasks.add(task);
      });
      _newTask.clear();
    }
  }

  void handleRemoveAllTasks() {
    setState(() {
      tasks = [];
    });
  }

  void handleRemoveTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(
          child: Text(
            'Todo List',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                controller: _newTask,
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: Colors.green[700],
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  hintText: 'Nova Tarefa',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 152, 150, 150),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.greenAccent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]),
                    onLongPress: () {
                      handleRemoveTask(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              handleAddNewTask(_newTask.text);
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              handleRemoveAllTasks();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
