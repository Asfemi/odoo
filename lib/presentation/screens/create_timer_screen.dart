import 'package:flutter/material.dart';
import 'package:odoo/data/dataproviders/helper.dart';
import 'package:odoo/data/models/task_models.dart';
import 'package:odoo/data/models/timer_model.dart';
import 'package:odoo/logic/bloc/timer_bloc.dart';
import 'package:odoo/presentation/widgets/background.dart';
import 'package:odoo/ticker.dart';

class CreateTimer extends StatefulWidget {
  const CreateTimer({Key? key});

  @override
  State<CreateTimer> createState() => _CreateTimerState();
}

class _CreateTimerState extends State<CreateTimer> {
  String? selectedProject;
  String? selectedTask;
  String timerDescription = '';
  TimerBloc createTimerBloc = TimerBloc(ticker: const Ticker());
  bool? isFavorite;
   List<String> projects = [
    "Firebase Notifications",
    "Android development",
    "Flutter app development",
    "iOS app deployment"
  ];
  List<String> tasks = ["Riverpod", "Getx", "rxDart", "SO056 - Booqio V2"];
  

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
          _buildDropdown(
            hint: 'Project',
            value: selectedProject,
            items: projects,
            onChanged: (value) {
              setState(() {
                selectedProject = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          _buildDropdown(
            hint: 'Task',
            value: selectedTask,
            items: tasks,
            onChanged: (value) {
              setState(() {
                selectedTask = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          _buildTextField(
            hint: 'Description',
            onChanged: (value) {
              setState(() {
                timerDescription = value;
              });
            },
          ),
          const SizedBox(height: 16.0),
          _buildCheckbox(
            value: isFavorite,
            onChanged: (value) {
              setState(() {
                isFavorite = value;
              });
            },
          ),
          const Spacer(),
          _buildButton(
            onTap: () {
              _onCreateTimerButtonPressed(context);
            },
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return SizedBox(
      height: 76,
      child: DropdownButtonFormField<String>(
        value: value,
        icon: const ImageIcon(AssetImage('lib/assets/icons/icon.png')),
        dropdownColor: Colors.blue,
        hint: Text(
          hint,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey.shade700),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        onChanged: onChanged,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required ValueChanged<String> onChanged,
  }) {
    return SizedBox(
      height: 76,
      child: TextField(
        onChanged: onChanged,
        maxLines: null,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade700),
          ),
          labelText: hint,
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required bool? value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
          value: value ?? false,
          checkColor: Colors.white,
          activeColor: Colors.grey,
          onChanged: onChanged,
        ),
        Text(
          'Make Favorite',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildButton({
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Ink.image(
        height: 48,
        width: 361,
        image: const AssetImage('lib/assets/icons/createTimerButton.png'),
      ),
    );
  }

  void _onCreateTimerButtonPressed(BuildContext context) {
    if (selectedProject?.isNotEmpty == true &&
        selectedTask?.isNotEmpty == true &&
        timerDescription.isNotEmpty) {
      TimersData newData = TimersData(
        name: selectedProject!,
        details: selectedTask!,
        deadline: '12/01/2024',
        isFav: isFavorite,
        taskdetails: TaskData(
          date: '01.01.2024',
          day: 'Monday',
          description: timerDescription,
          duration: '00:01:00',
          startTime: '12:00',
          assignedTo: 'New Assignee',
          deadline: '01/01/2025',
          project: 'New Project',
        ),
      );
      Helper.addTimersData(newData);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please fill in all fields.'),
      ));
    }
    Navigator.pop(context);
  }

  AppBar _buildCreateTimerAppBar(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const ImageIcon(AssetImage('lib/assets/icons/Frame 300.png')),
      ),
      backgroundColor: Colors.transparent,
      title: Text(
        'Create Timer',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
