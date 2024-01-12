import 'package:flutter/material.dart';
import 'package:odoo/data/dataproviders/helper.dart';
import 'package:odoo/data/models/task_models.dart';
import 'package:odoo/data/models/timer_model.dart';
import 'package:odoo/logic/bloc/timer_bloc.dart';
import 'package:odoo/presentation/widgets/background.dart';
import 'package:odoo/ticker.dart';

class CreateTimer extends StatefulWidget {
  const CreateTimer({super.key});

  @override
  State<CreateTimer> createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {
  String? selectedProject;
  String? selectedTask;
  List<String> projects = [
    "Firebase Notifications",
    "Android development",
    "Flutter app development",
    "iOS app deployment"
  ];
  List<String> tasks = ["Riverpod", "Getx", "rxDart", "SO056 - Booqio V2"];
  String timerDescription = '';
  TimerBloc createTimerBloc = TimerBloc(ticker: const Ticker());
  bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return BackgroundGradient(
      child: Scaffold(
        appBar: _buildCreateTimerAppBar(context),
        body: _buildCreateTimerBody(context),
      ),
    );
  }

  Padding _buildCreateTimerBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 76,
            child: DropdownButtonFormField<String>(
              value: selectedProject,
              icon: const ImageIcon(AssetImage('lib/assets/icons/icon.png')),
              dropdownColor: Colors.blue,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade700),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              hint: const Text(
                'Project',
                style: TextStyle(fontSize: 18),
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
              icon: const ImageIcon(AssetImage('lib/assets/icons/icon.png')),
              dropdownColor: Colors.blue,
              hint: const Text(
                'Task',
                style: TextStyle(fontSize: 18),
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade700),
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
              maxLines: null,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade700),
                ),
                labelText: 'Description',
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Checkbox(
                value: isFavorite ?? false,
                checkColor: Colors.white,
                activeColor: Colors.grey,
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
              if (selectedProject!.isNotEmpty &&
                  selectedTask!.isNotEmpty &&
                  timerDescription.isNotEmpty) {
                TimersData newData = TimersData(
                  name: selectedProject.toString(),
                  details: selectedTask.toString(),
                  deadline: '12/01/2024',
                  isFav: isFavorite,
                  taskdetails: TaskData(
                    date: '01.01.2024',
                    day: 'Monday',
                    description: timerDescription.toString(),
                    duration: '00:01:00',
                    startTime: '12:00',
                    assignedTo: 'New Assignee',
                    deadline: '01/01/2025',
                    project: 'New Project',
                  ),
                );
                Helper.addTimersData(newData);
              } else {
                // Show a snackbar or any other validation message
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please fill in all fields.'),
                ));
              }

              Navigator.pop(context);
            },
            child: Ink.image(
                height: 48,
                width: 361,
                image:
                    const AssetImage('lib/assets/icons/createTimerButton.png')),
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
    );
  }

  AppBar _buildCreateTimerAppBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const ImageIcon(AssetImage('lib/assets/icons/Frame 300.png'))),
      backgroundColor: Colors.transparent,
      title: Text(
        'Create Timer',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
