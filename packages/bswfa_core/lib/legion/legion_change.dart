import 'package:bswfa_core/legion/legion.dart';
import 'package:bswfa_core/legion/named_leader.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'legion_change.freezed.dart';

/// Cambio atómico aplicado a una legión como resultado de resolver una baja.
@freezed
sealed class LegionChange with _$LegionChange {
  const LegionChange._();

  /// Elimina un líder genérico de la legión.
  const factory LegionChange.removeGenericLeader() = RemoveGenericLeader;

  /// Elimina una unidad regular de la legión.
  const factory LegionChange.removeRegularUnit() = RemoveRegularUnit;

  /// Una baja sobre una unidad élite la degrada a unidad regular.
  const factory LegionChange.downgradeEliteUnit() = DowngradeEliteUnit;

  /// Una baja sobre una unidad élite especial la degrada a unidad regular.
  const factory LegionChange.downgradeSpecialEliteUnit() =
      DowngradeSpecialEliteUnit;

  /// Elimina un líder nombrado concreto de la legión.
  const factory LegionChange.removeNamedLeader({required NamedLeader leader}) =
      RemoveNamedLeader;

  Legion apply(Legion legion) {
    return map(
      removeGenericLeader: (_) {
        if (legion.genericLeaders <= 0) {
          throw StateError('Cannot remove a generic leader from this legion.');
        }

        return legion.copyWith(genericLeaders: legion.genericLeaders - 1);
      },
      removeRegularUnit: (_) {
        if (legion.regularUnits <= 0) {
          throw StateError('Cannot remove a regular unit from this legion.');
        }

        return legion.copyWith(regularUnits: legion.regularUnits - 1);
      },
      downgradeEliteUnit: (_) {
        if (legion.eliteUnits <= 0) {
          throw StateError('Cannot downgrade an elite unit from this legion.');
        }

        return legion.copyWith(
          eliteUnits: legion.eliteUnits - 1,
          regularUnits: legion.regularUnits + 1,
        );
      },
      downgradeSpecialEliteUnit: (_) {
        if (legion.specialEliteUnits <= 0) {
          throw StateError(
            'Cannot downgrade a special elite unit from this legion.',
          );
        }

        return legion.copyWith(
          specialEliteUnits: legion.specialEliteUnits - 1,
          regularUnits: legion.regularUnits + 1,
        );
      },
      removeNamedLeader: (RemoveNamedLeader change) {
        final List<NamedLeader> leaders = List<NamedLeader>.from(
          legion.namedLeaders,
        );

        final bool removed = leaders.remove(change.leader);
        if (!removed) {
          throw StateError(
            'Cannot remove named leader ${change.leader}; it is not present in the legion.',
          );
        }

        return legion.copyWith(namedLeaders: leaders);
      },
    );
  }
}
