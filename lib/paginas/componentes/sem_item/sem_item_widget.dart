import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'sem_item_model.dart';
export 'sem_item_model.dart';

class SemItemWidget extends StatefulWidget {
  const SemItemWidget({super.key});

  @override
  State<SemItemWidget> createState() => _SemItemWidgetState();
}

class _SemItemWidgetState extends State<SemItemWidget> {
  late SemItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SemItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        'assets/images/Imagem.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}
