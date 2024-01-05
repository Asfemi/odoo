import 'package:odoo/data/models/default_data.dart';

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
      DefaultData(
        icon: 'lib/assets/icons/clockBig.png',
        title: '',
        subtitle: '',
        button: '',
      ),
    ];
  }
}
