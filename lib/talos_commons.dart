// export './widgets/base_screen.dart' show BaseScreen;
// export './widgets/check_box_widget.dart' show CheckBoxWidget;
// export './widgets/date_picker.dart' show DatePicker;
// export './widgets/build_text_field.dart' show BuildTextField;
// export './widgets/drop_down_button.dart' show DropDownButton;
// export './widgets/drop_down_cell.dart' show DropdownCell;
// export './widgets/drop_down_data.dart' show DropDownData;
// export './widgets/form_field_widget.dart' show FormFieldWidget;
// export './widgets/grid_layout.dart' show GridLayout;
// export './widgets/lines.dart' show HorLine, VerLine;
// export './widgets/drop_down.dart' show DropDown;
// export './widgets/loading_dots.dart' show LoadingDots, LoadingCircle;
// export './widgets/number_input.dart' show NumericInputField;
// export './widgets/pop_up_container.dart' show PopUpContainer;
// export './widgets/pulse_circle.dart' show PulseCircle;
// export './widgets/radio_button_selector.dart' show RadioButtonSelector;
// export './widgets/responsive.dart' show Responsive;
// export './widgets/rounded_button.dart' show RoundedButton;
// export './widgets/scrollable_list.dart' show ScrollableList;
// export './widgets/scrollable_pane.dart' show ScrollPane;
// export './widgets/searchable_text_box.dart' show SearchableTextBox;
// export './widgets/text_info.dart' show TextInfo;
// export './widgets/text_input.dart' show TextInput;
// export './widgets/cards/base_card.dart' show BaseCard;
// export './widgets/cards/button_card.dart' show ButtonCard;
// export './utils/Alerts.dart' show Alerts;
// export './utils/call_context.dart' show CallContext;
// export './utils/log_level.dart';
// export './utils/no_transitions_on_web .dart' show NoTransitionsOnWeb;
// export './utils/socket.dart' show Socket;
// export './utils/utils.dart' show Utils;
// export './utils/web_socket.dart' show WebSocket;
// export './utils/ws_utils.dart' show WsUtils;
// export './base_classes/base_api.dart' show BaseApi;
// export './base_classes/base_json.dart' show Basejson;
// export './base_classes/base_packet.dart' show BasePacket;
// export './base_classes/error_resp.dart' show ErrorResp;
// export './base_classes/base_resp.dart' show BaseResp;
// export './base_classes/json.dart' show JsonSerializable;
// export './base_classes/page_req.dart' show PageReq;
// export './base_classes/page_resp.dart' show PageResp;

import './talos_commons_platform_interface.dart';
import 'package:flutter/material.dart';

BuildContext? currentContext;

class TalosCommons {
  Future<String?> getPlatformVersion() {
    return TalosCommonsPlatform.instance.getPlatformVersion();
  }
}
