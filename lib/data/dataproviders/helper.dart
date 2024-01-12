import 'package:odoo/data/models/default_data.dart';
import 'package:odoo/data/models/task_models.dart';
import 'package:odoo/data/models/timer_model.dart';

class Helper {
  static List<DefaultData> getDefaultData() {
    return [
      DefaultData(
        icon: 'lib/assets/icons/starBig.png',
        title: 'No favorited timers yet',
        subtitle:
            'You can mark a timer as favorite either on the timer creation page or within an existing timer',
        button: 'lib/assets/icons/Button.png',
      ),
      DefaultData(
        icon: 'lib/assets/icons/Frame 18.png',
        title: 'You don’t have any odoo timesheets',
        subtitle: 'Synchronize with odoo to get started',
        button: 'lib/assets/icons/Button.png',
      ),
      DefaultData(
        icon: 'lib/assets/icons/clockBig.png',
        title: 'You don’t have any local timesheets',
        subtitle: 'Create a timer to to begin tracking time',
        button: 'lib/assets/icons/Button.png',
      ),
    ];
  }

  static List<TaskData> getTaskData() {
    return [
      TaskData(
        date: '17.07.2023',
        day: 'Monday',
        description:
            'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
        duration: '08:08:20',
        startTime: '10:00',
        assignedTo: 'Ivan Zhuikov',
        deadline: '10/11/2023',
        project: 'Apexive: Content Planning',
      ),
      TaskData(
        date: '16.06.2023',
        day: 'Sunday',
        description:
            'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
        duration: '08:08:20',
        startTime: '10:00',
        assignedTo: 'Ivan Zhuikov',
        deadline: '10/11/2023',
        project: 'Apexive: Content Planning',
      ),
      TaskData(
        date: '16.06.2023',
        day: 'Sunday',
        description:
            'As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis',
        duration: '08:08:20',
        startTime: '10:00',
        assignedTo: 'Ivan Zhuikov',
        deadline: '10/11/2023',
        project: 'Apexive: Content Planning',
      ),
      TaskData(
        date: '17.07.2023',
        day: 'Monday',
        description:
            'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
        duration: '08:08:20',
        startTime: '10:00',
        assignedTo: 'Ivan Zhuikov',
        deadline: '10/11/2023',
        project: 'Apexive: Content Planning',
      ),
    ];
  }

  static List<TimersData> timersData = [
    // dummy timer
    TimersData(
      name: 'ios app deployment',
      deadline: '07/20/2023',
      details: 'SO056 - Booqio V2',
      taskdetails: TaskData(
        date: '17.07.2023',
        day: 'Monday',
        description:
            'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
        duration: '08:08:20',
        startTime: '10:00',
        assignedTo: 'Ivan Zhuikov',
        deadline: '10/11/2023',
        project: 'Apexive: Content Planning',
      ),
    ),

    //dummy timer end
    TimersData(
      name: 'ios app deployment',
      deadline: '07/20/2023',
      details: 'SO056 - Booqio V2',
      taskdetails: TaskData(
        date: '17.07.2023',
        day: 'Monday',
        description:
            'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
        duration: '08:08:20',
        startTime: '10:00',
        assignedTo: 'Ivan Zhuikov',
        deadline: '10/11/2023',
        project: 'Apexive: Content Planning',
      ),
    ),

    TimersData(
      name: 'iOS app deployment with odd',
      deadline: '07/20/2023',
      details: 'SO056 - Booqio V2',
      taskdetails: TaskData(
        date: '16.06.2023',
        day: 'Sunday',
        description:
            'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
        duration: '08:08:20',
        startTime: '10:00',
        assignedTo: 'Ivan Zhuikov',
        deadline: '10/11/2023',
        project: 'Apexive: Content Planning',
      ),
    ),
    TimersData(
      name: 'iOS app deployment with odd',
      deadline: '07/20/2023',
      details: 'SO056 - Booqio V2',
      taskdetails: TaskData(
        date: '16.06.2023',
        day: 'Sunday',
        description:
            'As a user, I would like to be able to buy a subscription, this would allow me to get a discount on the products and on the second stage of diagnosis',
        duration: '08:08:20',
        startTime: '10:00',
        assignedTo: 'Ivan Zhuikov',
        deadline: '10/11/2023',
        project: 'Apexive: Content Planning',
      ),
    ),
  ];

  static List<TimersData> getTimersData() {
    return timersData;
  }

  static void addTimersData(TimersData newData) {
    timersData.add(newData);
  }
}
