
import 'package:flutter/material.dart';
import 'package:medion/infrastructure/services/alice/model/alice_translation.dart';
import 'package:medion/infrastructure/services/alice/ui/common/alice_context_ext.dart';
import 'package:medion/infrastructure/services/alice/ui/common/alice_theme.dart';

/// Widget which renders empty text for calls list.
class AliceErrorLogsWidget extends StatelessWidget {
  const AliceErrorLogsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: AliceTheme.red,
            ),
            const SizedBox(height: 6),
            Text(
              context.i18n(AliceTranslationKey.logsItemError),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
