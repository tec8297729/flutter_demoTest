// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$Counter on CounterBase, Store {
  final _$valueAtom = Atom(name: 'CounterBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$CounterBaseActionController = ActionController(name: 'CounterBase');

  @override
  void increment() {
    final _$actionInfo = _$CounterBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$CounterBaseActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }
}
