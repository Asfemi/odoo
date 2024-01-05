import 'package:flutter/material.dart';
import 'package:odoo/presentation/widgets/background.dart';

class CreateTimer extends StatefulWidget {
  const CreateTimer({super.key});

  @override
  State<CreateTimer> createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {
  String selectedProject = 'Project';
  String selectedTask = 'Task';
  String timerDescription = '';
  bool isFavorite = false;

  final List<String> projects = ['Project', 'Project B', 'Project C'];
  final List<String> tasks = ['Task', 'Task 2', 'Task 3'];

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ImageIcon(AssetImage('lib/assets/icons/Frame 300.png'))),
          backgroundColor: Colors.transparent,
          title: Text(
            'Create Timer',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 76,
                child: DropdownButtonFormField<String>(
                  value: selectedProject,
                  icon: ImageIcon(AssetImage('lib/assets/icons/icon.png')),
                  dropdownColor: Colors.blue,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade700),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedProject = value!;
                    });
                  },
                  items: projects.map((project) {
                    return DropdownMenuItem<String>(
                      value: project,
                      child: Text(project),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 76,
                child: DropdownButtonFormField<String>(
                  value: selectedTask,
                  icon: ImageIcon(AssetImage('lib/assets/icons/icon.png')),
                  dropdownColor: Colors.blue,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade700),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedTask = value!;
                    });
                  },
                  items: tasks.map((task) {
                    return DropdownMenuItem<String>(
                      value: task,
                      child: Text(task),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 76,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      timerDescription = value;
                    });
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 1, color: Colors.grey.shade700),
                    ),
                    labelText: 'Description',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: isFavorite,
                    onChanged: (value) {
                      setState(() {
                        isFavorite = value!;
                      });
                    },
                  ),
                  Text(
                    'Make Favorite',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Ink.image(
                    height: 48,
                    width: 361,
                    image: const AssetImage(
                        'lib/assets/icons/createTimerButton.png')),
              ),
              const SizedBox(height: 16.0),
              // ElevatedButton(
              //   onPressed: () {
              //     if (selectedProject.isNotEmpty && selectedTask.isNotEmpty && timerDescription.isNotEmpty) {
              //       Timer newTimer = Timer(
              //         project: selectedProject,
              //         task: selectedTask,
              //         description: timerDescription,
              //         isFavorite: isFavorite,
              //       );
              //       widget.onTimerAdded(newTimer);
              //     } else {
              //       // Show a snackbar or any other validation message
              //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //         content: Text('Please fill in all fields.'),
              //       ));
              //     }
              //   },
              //   child: Text('Add Timer'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
