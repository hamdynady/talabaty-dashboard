import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:talabaty_dashboard/core/utIls/app_text_styles.dart';
import 'package:talabaty_dashboard/core/utils/assets.dart';
import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.onChecked,
    required this.isChecked,
  });
  final ValueChanged<bool> onChecked;
  final bool isChecked;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool _isChecked;
  @override
  initState() {
    _isChecked = widget.isChecked;
    super.initState();
  }

  void togglecheck() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChecked(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: togglecheck,
          child: AnimatedContainer(
            width: 24,
            height: 24,
            duration: const Duration(milliseconds: 100),
            decoration: ShapeDecoration(
              color: _isChecked ? AppColors.primaryColor : Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.50,
                  color:
                      _isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child:
                _isChecked
                    ? Padding(
                      padding: EdgeInsets.all(2),
                      child: SvgPicture.asset(Assets.assetsImagesCheck),
                    )
                    : const SizedBox(),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'is featured item?',
          style: TextStyles.regular13.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
