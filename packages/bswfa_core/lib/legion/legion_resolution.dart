import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/legion_change.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'legion_resolution.freezed.dart';

@freezed
abstract class LegionResolution with _$LegionResolution {
  const LegionResolution._();

  const factory LegionResolution({
    @Default(<LegionChange>[]) List<LegionChange> appliedChanges,
  }) = _LegionResolution;

  bool get isEmpty => appliedChanges.isEmpty;

  Legion applyTo(Legion legion) => legion.applyChanges(appliedChanges);
}
