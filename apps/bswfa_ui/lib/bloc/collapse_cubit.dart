import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collapse_cubit.freezed.dart';

bool isCollapsed(BuildContext context) => !context.watch<CollapseCubit>().state.collapsed;

class CollapseCubit extends Cubit<CollapseState> {
  CollapseCubit() : super(const CollapseState());

  void toggle() {
    emit(CollapseState(collapsed: !state.collapsed));
  }
}

@freezed
abstract class CollapseState with _$CollapseState {
  const factory CollapseState({@Default(false) bool collapsed}) = _CollapseState;
}
