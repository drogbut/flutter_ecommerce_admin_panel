import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/enums.dart';
import '../../controllers/media_controller.dart';

class MediaFolderDropDown extends StatelessWidget {
  final Function(MediaCategory?)? onChanged;

  const MediaFolderDropDown({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;

    return Obx(
      () => SizedBox(
        width: 140,
        child: DropdownButtonFormField(
          isExpanded: false,
          value: controller.selectedPath.value,
          items: MediaCategory.values
              .map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(category.name.capitalize.toString(), style: context.textTheme.labelLarge),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
