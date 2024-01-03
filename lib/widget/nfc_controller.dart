import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../utils/colorz.dart';
import 'custom_text_button.dart';

class NfcController extends StatefulWidget {
  final Function(String url) getUrl;
  final Uri url;
  
  const NfcController({super.key, required this.getUrl, required this.url});

  @override
  State<NfcController> createState() => _NfcControllerState();
}

class _NfcControllerState extends State<NfcController> {
  @override
  void initState() {
    super.initState();
    NfcManager.instance.startSession(
      onDiscovered: (NfcTag tag) async {
        Ndef? ndef = Ndef.from(tag);
        // NdefMessage message = ndef!.cachedMessage!;
        // final List<int> nfcData = message.records.first.payload.toList();
        // nfcData.removeAt(0);
        // final String url = 'https://${ascii.decode(nfcData)}';

        NdefMessage message =
              NdefMessage([NdefRecord.createUri(widget.url)]);

            
            
          await Ndef.from(tag)?.write(message);//If it supports NDEF, create an NDEF message and write it to the tag.
          // await Ndef.from(tag)?.//If it supports NDEF, create an NDEF message and write it to the tag.
          debugPrint('Data emitted successfully');
          Uint8List payload = message.records.first.payload;
          String text = String.fromCharCodes(payload);

          
        Timer(const Duration(seconds: 1), () async {
          widget.getUrl(widget.url.toString());
          NfcManager.instance.stopSession();
          Navigator.of(context).pop();
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    NfcManager.instance.stopSession();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: Colorz.screenBackground,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('images/nfc.json'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Ready to scan",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colorz.textSecondary),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Hold your card on the upper back of your phone",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colorz.textSecondary),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextButton(
            text: 'Cancel',
            onPressed: () {
              NfcManager.instance.stopSession();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
