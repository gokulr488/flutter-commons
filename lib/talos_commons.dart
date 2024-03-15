export './widgets/base_screen.dart' show BaseScreen;
export './widgets/check_box_widget.dart' show CheckBoxWidget;
export './widgets/date_picker.dart' show DatePicker;

import 'talos_commons_platform_interface.dart';

class TalosCommons {
  Future<String?> getPlatformVersion() {
    return TalosCommonsPlatform.instance.getPlatformVersion();
  }
}
