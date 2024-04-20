import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'rating_component_model.dart';
export 'rating_component_model.dart';

class RatingComponentWidget extends StatefulWidget {
  const RatingComponentWidget({super.key});

  @override
  State<RatingComponentWidget> createState() => _RatingComponentWidgetState();
}

class _RatingComponentWidgetState extends State<RatingComponentWidget> {
  late RatingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1.0, 0.0),
      child: RatingBar.builder(
        onRatingUpdate: (newValue) =>
            setState(() => _model.ratingBarValue = newValue),
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FlutterFlowTheme.of(context).primary,
        ),
        direction: Axis.horizontal,
        initialRating: _model.ratingBarValue ??= 1.0,
        unratedColor: FlutterFlowTheme.of(context).alternate,
        itemCount: 5,
        itemSize: 20.0,
        glowColor: FlutterFlowTheme.of(context).primary,
      ),
    );
  }
}
