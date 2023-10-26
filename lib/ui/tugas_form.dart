import 'package:flutter/material.dart';
import 'package:manajementugas/bloc/tugas_bloc.dart';
import 'package:manajementugas/model/tugas.dart';
import 'package:manajementugas/ui/tugas_page.dart';
import 'package:manajementugas/widget/warning_dialog.dart';

class TugasForm extends StatefulWidget {
  Tugas? tugas;
  TugasForm({Key? key, this.tugas}) : super(key: key);
  @override
  _TugasFormState createState() => _TugasFormState();
}

class _TugasFormState extends State<TugasForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH TUGAS";
  String tombolSubmit = "SIMPAN";

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _deadlineController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.tugas != null) {
      setState(() {
        judul = "UBAH TUGAS";
        tombolSubmit = "UBAH";
        _titleController.text = widget.tugas!.title!;
        _descriptionController.text = widget.tugas!.description!;
        _deadlineController.text = widget.tugas!.deadline.toString();
      });
    } else {
      judul = "TAMBAH TUGAS";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _titleTextField(),
                _descriptionTextField(),
                _deadlineTextField(),
                _buttonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Judul Tugas"),
      keyboardType: TextInputType.text,
      controller: _titleController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Judul Tugas harus diisi";
        }
        return null;
      },
    );
  }

  Widget _descriptionTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Deskripsi Tugas"),
      keyboardType: TextInputType.text,
      controller: _descriptionController,
    );
  }

  Widget _deadlineTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tenggat Waktu"),
      keyboardType: TextInputType.datetime,
      controller: _deadlineController,
    );
  }

  Widget _buttonSubmit() {
    return OutlinedButton(
      child: Text(tombolSubmit),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          if (!_isLoading) {
            if (widget.tugas != null) {
              ubah();
            } else {
              simpan();
            }
          }
        }
      },
    );
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Tugas createTugas = Tugas(id: null);
    createTugas.title = _titleController.text;
    createTugas.description = _descriptionController.text;
    createTugas.deadline = DateTime.parse(_deadlineController.text);
    TugasBloc.addTugas(tugas: createTugas).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const TugasPage()));
    }, onError: (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) => const WarningDialog(
          description: "Simpan gagal, silahkan coba lagi",
        ),
      );
    });
    setState(() {
      _isLoading = false;
    });
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Tugas updateTugas = Tugas(id: widget.tugas!.id);
    updateTugas.title = _titleController.text;
    updateTugas.description = _descriptionController.text;
    updateTugas.deadline = DateTime.parse(_deadlineController.text);
    TugasBloc.updateTugas(tugas: updateTugas).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const TugasPage()));
    }, onError: (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) => const WarningDialog(
          description: "Permintaan ubah data gagal, silahkan coba lagi",
        ),
      );
    });
    setState(() {
      _isLoading = false;
    });
  }
}
