// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class TestingUploadFile extends StatefulWidget {
//   @override
//   _TestingUploadFileState createState() => _TestingUploadFileState();
// }

// class _TestingUploadFileState extends State<TestingUploadFile> {
//   String _filePath = '';

//   Future<void> _pickFile() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       final file = File(result.files.single.path!);
//       setState(() {
//         _filePath = file.path;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Picker Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: _pickFile,
//               child: Text('Pick a File'),
//             ),
//             SizedBox(height: 16),
//             Text('Selected file: $_filePath'),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class TestingBarcode extends StatefulWidget {
//   const TestingBarcode({Key? key}) : super(key: key);

//   @override
//   State<TestingBarcode> createState() => _TestingBarcodeState();
// }

// class _TestingBarcodeState extends State<TestingBarcode> {
//   MobileScannerController cameraController = MobileScannerController();
//   bool _screenOpened = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mobile Scanner"),
//         actions: [
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.torchState,
//               builder: (context, state, child) {
//                 switch (state as TorchState) {
//                   case TorchState.off:
//                     return const Icon(Icons.flash_off, color: Colors.grey);
//                   case TorchState.on:
//                     return const Icon(Icons.flash_on, color: Colors.yellow);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.toggleTorch(),
//           ),
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.cameraFacingState,
//               builder: (context, state, child) {
//                 switch (state as CameraFacing) {
//                   case CameraFacing.front:
//                     return const Icon(Icons.camera_front);
//                   case CameraFacing.back:
//                     return const Icon(Icons.camera_rear);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.switchCamera(),
//           ),
//         ],
//       ),
//       body: MobileScanner(
//         // allowDuplicates: true,
//         controller: cameraController, onDetect: (BarcodeCapture barcodes) {},
//         // onDetect: _foundBarcode,
//       ),
//     );
//   }

//   void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
//     /// open screen
//     if (!_screenOpened) {
//       final String code = barcode.rawValue ?? "---";
//       debugPrint('Barcode found! $code');
//       _screenOpened = true;
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 FoundCodeScreen(screenClosed: _screenWasClosed, value: code),
//           ));
//     }
//   }

//   void _screenWasClosed() {
//     _screenOpened = false;
//   }
// }

// class FoundCodeScreen extends StatefulWidget {
//   final String value;
//   final Function() screenClosed;
//   const FoundCodeScreen({
//     Key? key,
//     required this.value,
//     required this.screenClosed,
//   }) : super(key: key);

//   @override
//   State<FoundCodeScreen> createState() => _FoundCodeScreenState();
// }

// class _FoundCodeScreenState extends State<FoundCodeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Found Code"),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             widget.screenClosed();
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_outlined,
//           ),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 "Scanned Code:",
//                 style: TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 widget.value,
//                 style: TextStyle(
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ContohView extends StatefulWidget {
  const ContohView({super.key});

  @override
  State<ContohView> createState() => _ContohViewState();
}

class _ContohViewState extends State<ContohView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarRounded(context),
      body: Container(),
    );
  }
}

appBarRounded(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        
        Text(""),
        Text("cb"),
        Text("cb"),

      ],
    ),
    automaticallyImplyLeading: false, // True, untuk mengaktifkan tombol back otomatis
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
  );
}
