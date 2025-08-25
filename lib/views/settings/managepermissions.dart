import 'package:fittrack2/widgets/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ManagePermissionsScreen extends StatefulWidget {
  const ManagePermissionsScreen({super.key});

  @override
  State<ManagePermissionsScreen> createState() =>
      _ManagePermissionsScreenState();
}

class _ManagePermissionsScreenState extends State<ManagePermissionsScreen> {
  Map<Permission, PermissionStatus> _permissions = {};

  final List<Permission> _requestedPermissions = [
    Permission.camera,
    Permission.location,
    Permission.storage,
    // Add more if needed
  ];

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final statuses = await _requestedPermissions.request();
    setState(() {
      _permissions = statuses;
    });
  }

  Future<void> _openAppSettings() async {
    await openAppSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Permissions'),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: AppColors.hilighter, fontSize: 20),
        iconTheme: const IconThemeData(color: AppColors.hilighter),
      ),
      backgroundColor: AppColors.black,
      body: ListView(
        children: _requestedPermissions.map((permission) {
          final status = _permissions[permission] ?? PermissionStatus.denied;
          return ListTile(
            title: Text(
              permission.toString().split('.').last.toUpperCase(),
              style: const TextStyle(color: AppColors.hilighter),
            ),
            subtitle: Text(
              status.toString().split('.').last,
              style: const TextStyle(color: AppColors.hilighter),
            ),
            trailing: status.isDenied || status.isPermanentlyDenied
                ? TextButton(
                    onPressed: () => _openAppSettings(),
                    child: const Text(
                      'Open Settings',
                      style: TextStyle(color: AppColors.hilighter),
                    ),
                  )
                : const Icon(Icons.check, color: Colors.green),
          );
        }).toList(),
      ),
    );
  }
}
