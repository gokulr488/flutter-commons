import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:talos_commons/talos_commons.dart';
import 'package:talos_commons/widgets/loading_dots.dart';
import 'package:talos_commons/utils/log_level.dart';

class Alerts extends StatelessWidget {
  const Alerts({
    super.key,
    required this.title,
    required this.actions,
    this.icon,
    this.iconColor,
  });
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        actions: actions,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
        //backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))));
  }
}

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Alerts(
        title: 'Please Wait',
        actions: [
          Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: LoadingCircle(size: 80),
          )
        ],
      );
    },
  );
}

void showSendingDialogue() {
  showDialog(
    context: currentContext!,
    builder: (BuildContext context) {
      return const Alerts(
        title: 'Submitting...',
        actions: [LoadingDots(size: 50)],
      );
    },
  );
}

void showSubmitResponse(String resp) {
  showDialog(
    context: currentContext!,
    builder: (BuildContext context) {
      return Alerts(title: resp, actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'))
      ]);
    },
  );
}

void showErrorAlert(String errorMessage) {
  log(errorMessage, logLevel: CONSOLE_LOG);
  showDialog(
    context: currentContext!,
    builder: (BuildContext context) {
      return Alerts(
        title: 'ERROR',
        actions: [
          Text(errorMessage, style: const TextStyle(fontSize: 18)),
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'))
        ],
      );
    },
  );
}

void showWarningAlert(String errorMessage, Function onConfirmed) {
  showDialog(
    context: currentContext!,
    builder: (BuildContext context) {
      return Alerts(
        title: 'Warning',
        icon: Icons.warning,
        iconColor: Colors.orange,
        actions: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(errorMessage, style: const TextStyle(fontSize: 18))),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('No')),
                TextButton(
                    onPressed: () => onConfirmed(), child: const Text('Yes'))
              ],
            ),
          ),
        ],
      );
    },
  );
}

void _showInfoAlert(String infoMessage) {
  showDialog(
    context: currentContext!,
    builder: (BuildContext context) {
      return Alerts(
        title: 'Info',
        actions: [
          Text(infoMessage, style: const TextStyle(fontSize: 18)),
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK')),
        ],
      );
    },
  );
}

void Function(String)? onConsoleLog;

void log(String? log, {BuildContext? context, String logLevel = PRINTED_LOG}) {
  if (log != null && currentContext != null) {
    debugPrint(log);
    BuildContext ctx = context ?? currentContext!;
    try {
      switch (logLevel) {
        case CONSOLE_LOG:
          if (onConsoleLog != null) onConsoleLog!(log);
          // Provider.of<UiState>(ctx, listen: false).addLog(log);
          break;
        case TOAST_MESSAGE:
          showToast(log,
              context: ctx,
              backgroundColor: Theme.of(ctx).colorScheme.inversePrimary,
              position: const ToastPosition(align: Alignment.topRight));
          break;
        case POP_UP_MESSAGE:
          _showInfoAlert(log);
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

void messagePopupBox(BuildContext context, Widget child) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          // backgroundColor: const Color.fromARGB(255, 14, 29, 30),
          contentPadding: const EdgeInsets.all(2),
          insetPadding: const EdgeInsets.all(2),
          content: child);
    },
  );
}
