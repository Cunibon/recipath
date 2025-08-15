import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/widgets/screens/settings_screen/providers/material_you_provider.dart';
import 'package:recipe_list/widgets/screens/settings_screen/setting_toggle.dart';

class MaterialYouToggle extends ConsumerWidget {
  const MaterialYouToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final materialYou = ref.watch(materialYouProviderProvider);

    return SettingToggle(
      text: "Material You",
      value: materialYou,
      onChanged: (value) =>
          ref.read(materialYouProviderProvider.notifier).set(value),
    );
  }
}
