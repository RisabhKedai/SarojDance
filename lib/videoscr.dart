import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:gsheets/gsheets.dart';
import 'package:flutter/material.dart';
import 'videos.dart';

// your google auth credentials
const _credentials = r'''
{
  "type": "service_account",
  "project_id": "saroj-dance-academy",
  "private_key_id": "4fc30410dbe24244386e86c46e94471328012ede",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCrw5YNSDr8yU9r\n4UWiSBJoyDth+6VKVvVRhnhXY5rqVUx3P9wGIstz84u5xxf6oNDeZE5ZX6Q+fLHJ\n9I+kSlJ5wYuZ3m6FvuMKtxW6IDMt2O0dP2KTMdcIr4nGNixZR/2VSKr5H0sOj66n\nOGv+9t52kyT5u1dhnNU/cOrdc33IBQTaJ0s9Gnhtqtr0tfUbZYTJEEOTrAsth3K4\nDEFbHLNAdgGXDUHWBm9ShV/x5D//2sMHdYNlFj/xmBCA2BRFTFLA3s8k61vXHOSQ\nvzDxt11Y/124C1+j+lAq0BBJAiodI6z83vhYqc7es0f/OT110RPsZHtWetG7Ur+E\n1vSbKo4xAgMBAAECggEAMua3yYDdxjrsN+ae6awdFIM+Idfe0Gx7r6i/cfpZFten\nXPGGRSU7kMWcYzYuk33j1/v2wgKXXFM8psI8bS3/SgjC05r4utbqVqsSG8HeGNif\n0BqQHlnXRUIr/JriQqUUb5CE5mXRKuQGmJSeYIUNQSty+jT7/Lfq9C2E1JKctFDX\n8Nw8aQ2IevA6+AD9KlnrF4YupjrCcO7Mxe9g+ab7LYum/rrcr8zvnaHClmLxrd1Q\n6+H8l8bMskicSte5A7/gstM8/uwN4uSfXSF6+5tEtGpqRzlY8vFxZ+EHZC5Zws2c\nyuk8XMPpEW9LBc5s/HXlc8nWyamrpWQljqwY/X2bnwKBgQDenpCBaCvx4Y4EoZaq\ngrwFJPRIxJJnU0scbNFLVM4AWF5XGU2LTStvtdc5Uy1tDewx070iBRpI1JfUaCB+\nGMjWEpDF6gEOP77Vw2PDCctwojFjT89jlbXHF1w+HoW2Lvw6SR/SGsVjdQ8CkwBF\nSsCpMG0V0lyJ7RzLEu4C+0GzywKBgQDFhOTxc2re4cgR13TFCgvYRBzz7fVtyXdH\n77X05bDhu5Mv5n7m3j+qOQ7Rw31Ogj9Ap7/jLjujRCHOcuPWiCNWQur5fwWu4Fa7\ndCRMEzf/CksNeoc78ra0/eHUCPF2t1JaEOeojUDKHZMM6CCMGLREkMEdde3f8xF9\nVAalTB8ecwKBgBUWcBnSBFelRg6qP9tnBuh1164M8NFY0oSeyjSYk+r0c/tMKkxH\nwxWR5BFKD8OEzhrqM8BFO3gqqzczpeBL+LpOh+g3gmIXJ7yYBZs0ElFZC9Scesi0\nJcP2Moav3XqkeMAMrTb50jjZndJgmmX17soYDD1E7/8gttmFsYYWxuKBAoGAL8N7\nOYgXh95Ba08Wxa8wPhP6jGI2v13AonytG5OPuoaJiUPL3DhSXO9/TepgGuQUN6ZZ\nGK7NbSXEpw/RWMeDBBEakUrOLQPC9YGYZW0gVWQ/0fqXST/gPtRGD+g5u+OI3o7H\n9lJyIG4WaUCY3kf7D7mReXZTF5zH1e7DzKUjwVECgYBlQFBsM+YczExJ+0W5Xchj\nLhEUoB+G700F1lZcqkJGNiJs2CJBsBJHrCwfGzgqT6LKf7RqcNk5Tw32FM5Yug1M\nNdL28Iqrh+7zz4T7dePk1VgcKlONqC6RtEsKiMZJG7CkAOMTMHn6lN42Oz183VgR\ne9jy75dEw9KJ7jLlSeJ60g==\n-----END PRIVATE KEY-----\n",
  "client_email": "sarojdance@saroj-dance-academy.iam.gserviceaccount.com",
  "client_id": "101421642497906673208",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sarojdance%40saroj-dance-academy.iam.gserviceaccount.com"
}
''';

// your spreadsheet id
const _spreadsheetId = '177oZXosDW2kAkFEyZv3YTVAjuUeO45uJjNlpQ_78EDI';

Future<dynamic> getSheet(BuildContext context) async {
  print('getting the gsheet');
  try {
    var r = await http.get('https://www.google.com');
  } on SocketException {
    // if (e.toString().contains('SocketException')) {
    //throw new FatalServiceException('Gagal');

    //int numb = await sheet.values.rowIndexOf(sheet.values.lastRow());
    //print(numb);
    print('jvugvvugiu');
    return 'non';
  }
  // init GSheets
  final gsheets = await GSheets(_credentials);
// fetch spreadsheet by its id
  try {
    var r = await http.get('https://www.google.com');
  } on SocketException {
    return 'non';
  }
  final ss = await gsheets.spreadsheet(_spreadsheetId);
// get worksheet by its title
  try {
    var r = await http.get('https://www.google.com');
  } on SocketException {
    return 'non';
  }
  final Worksheet sheet = await ss.worksheetByTitle('videos');
  //var nu = await sheet.values.allRows();
  int numb = await sheet.rowCount;
  print(numb);
  return getVids(sheet);
}

Future<Widget> getVids(Worksheet sheet) async {
  var links = await sheet.values.allRows();
  print(links);
  List<Widget> vids = [];
  for (int i = 1; i < links.length; i++) {
    vids.add(Videos('https://drive.google.com/uc?export=view&id=' + links[i][0],
        links[i][1], links[i][2]));
  }
  return Container(
    child: SingleChildScrollView(
      child: Column(
        children: vids,
      ),
    ),
  );
}

class Vidscr extends StatelessWidget {
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSheet(context),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != 'non') {
          return snapshot.data;
        } else if (snapshot.data == 'non') {
          return Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 4.3),
            child: Column(
              children: <Widget>[
                Text(
                  'NO   INTERNET CONNECTION',
                  style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 20,
                      color: Colors.red.shade700),
                ),
              ],
            ),
          );
        } else
          return Center(child: CircularProgressIndicator());
      },
    );
  }
}
