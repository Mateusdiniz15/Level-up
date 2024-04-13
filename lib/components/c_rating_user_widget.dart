import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'c_rating_user_model.dart';
export 'c_rating_user_model.dart';

class CRatingUserWidget extends StatefulWidget {
  const CRatingUserWidget({
    super.key,
    required this.nota,
  });

  final double? nota;

  @override
  State<CRatingUserWidget> createState() => _CRatingUserWidgetState();
}

class _CRatingUserWidgetState extends State<CRatingUserWidget> {
  late CRatingUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CRatingUserModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RatingBar.builder(
          onRatingUpdate: (newValue) =>
              setState(() => _model.ratingBarValue = newValue),
          itemBuilder: (context, index) => Icon(
            Icons.star_rounded,
            color: FlutterFlowTheme.of(context).tertiary,
          ),
          direction: Axis.horizontal,
          initialRating: _model.ratingBarValue ??= 3.0,
          unratedColor: FlutterFlowTheme.of(context).accent3,
          itemCount: 5,
          itemSize: 18.0,
          glowColor: FlutterFlowTheme.of(context).tertiary,
        ),
      ],
    );
  }
}
