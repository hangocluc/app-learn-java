import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'snack_bar_utils.dart';

class ShareUtils {
  static void share(String permalink) {
  }

  static void shareFiles(BuildContext context, File file, Uint8List picData,
      {String? text}) {
    _showCustomShareSheet(context, file, text, picData);
  }

  static void _showCustomShareSheet(
      BuildContext context, File file, String? text, Uint8List picData) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildShareOption(
              icon: Icons.copy,
              text: 'Copy',
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: file.path));
                if (context.mounted) {
                  showSnackBarSuccess(
                    context,
                    title: 'Copy Success',
                  );
                  Navigator.pop(context);
                }
              },
            ),
            _buildShareOption(
              icon: Icons.download,
              text: 'Save',
              onTap: () async {
                saveUint8ListAsImage(picData);

                showSnackBarSuccess(
                  context,
                  title: 'Save Success',
                );
                Navigator.pop(context);
              },
            ),
            _buildShareOption(
              icon: Icons.share,
              text: 'Share',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static Widget _buildShareOption(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}

Future<File> saveUint8ListAsImage(Uint8List picData) async {
  final directory = await getApplicationDocumentsDirectory();
  final String filePath = '${directory.path}/saved_image.png';
  File file = File(filePath);
  await file.writeAsBytes(picData);

  return file;
}
