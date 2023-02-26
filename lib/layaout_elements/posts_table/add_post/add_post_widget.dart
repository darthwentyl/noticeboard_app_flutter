import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_colors.dart';
import 'package:noticeboard/const/app_strings.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/utils/empty_size_box.dart';
import 'package:noticeboard/utils/size_getter.dart';

class AddPostWidget extends StatefulWidget {
  AddPostWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
  final _editController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // TODO: create listener?
    _editController.addListener(() {
      print('text typed:\n${_editController.text}');
    });
  }

  @override
  void dispose() {
    // cleanup controller (listeners, texts etc.)
    _editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: SizeGetter.width(context, 98.0),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.boxBackground,
            borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _title(),
              EmptySizeBox.get(height: 8.0),
              _edit(),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppStrings.addPostTitle,
          style: const TextStyle(
            color: AppColors.customBlue,
            fontSize: 20.0,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }

  _edit() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: _editController,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.customWhite,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(BoxTheme.radius)),
            ),
            hintText: EditStrings.addPostHint,
            hintStyle: TextStyle(
              color: AppColors.customWhite,
              fontSize: 20.0,
              decoration: TextDecoration.none,
            ),
          ),
          style: const TextStyle(
            color: AppColors.customWhite,
            fontSize: 20.0,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
