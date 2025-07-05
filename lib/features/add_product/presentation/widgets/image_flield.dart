import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talabaty_dashboard/core/utils/app_colors.dart';

class ImageField extends StatefulWidget {
  final ValueChanged<File?> onImageChanged; // دالة استقبال الصورة عند تغييرها

  const ImageField({super.key, required this.onImageChanged});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  File? _image; // تخزين الصورة المختارة

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      widget.onImageChanged(_image); // إرسال الصورة إلى الخارج
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image != null
            ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
            : const Icon(Icons.image, size: 100, color: Colors.grey),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              text: "اختر من المعرض",
              icon: Icons.image,
              source: ImageSource.gallery,
            ),
            const SizedBox(width: 10),
            _buildButton(
              text: "التقاط صورة",
              icon: Icons.camera,
              source: ImageSource.camera,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required IconData icon,
    required ImageSource source,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
      icon: Icon(icon),
      label: Text(text),
      onPressed: () => _pickImage(source),
    );
  }
}
