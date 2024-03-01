import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DataForGroupContainers extends StatelessWidget {
  final String documentID;
  late final Future<DocumentSnapshot> _databaseInfo;

  DataForGroupContainers({
    super.key,
    required this.documentID,
  }) {
    _databaseInfo = FirebaseFirestore.instance
        .collection('study_groups')
        .doc(documentID)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _databaseInfo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No Data'));
        }

        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Text(data['studyGrppTitle']);
      },
    );
  }
}
