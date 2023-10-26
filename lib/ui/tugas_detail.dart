import 'package:flutter/material.dart';
import 'package:manajementugas/model/tugas.dart';
import 'package:manajementugas/ui/tugas_form.dart';

class TugasDetail extends StatefulWidget {
  Tugas? tugas;
  TugasDetail({Key? key, this.tugas}) : super(key: key);
  @override
  _TugasDetailState createState() => _TugasDetailState();
}

class _TugasDetailState extends State<TugasDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tugas'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Judul: ${widget.tugas!.title}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Deskripsi: ${widget.tugas!.description}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Tenggat Waktu: ${widget.tugas!.deadline.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit(),
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton(
          child: const Text("EDIT"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TugasForm(tugas: widget.tugas!,))
            );
          },
        ),
        OutlinedButton(
            child: const Text("DELETE"),
            onPressed: () => confirmHapus()),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Udah Selesai?"),
      actions: [
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> TugasForm(tugas: widget.tugas!,))
            );
          },
        ),
        OutlinedButton(onPressed: () => Navigator.pop(context), child: const Text("Batal")),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
