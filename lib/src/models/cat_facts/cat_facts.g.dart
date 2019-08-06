// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_facts.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CatStore on CatFacts, Store {
  final _$dataBBAtom = Atom(name: 'CatFacts.dataBB');

  @override
  int get dataBB {
    _$dataBBAtom.context.enforceReadPolicy(_$dataBBAtom);
    _$dataBBAtom.reportObserved();
    return super.dataBB;
  }

  @override
  set dataBB(int value) {
    _$dataBBAtom.context.conditionallyRunInAction(() {
      super.dataBB = value;
      _$dataBBAtom.reportChanged();
    }, _$dataBBAtom, name: '${_$dataBBAtom.name}_set');
  }

  final _$CatFactsActionController = ActionController(name: 'CatFacts');

  @override
  void increment() {
    final _$actionInfo = _$CatFactsActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$CatFactsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$CatFactsActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$CatFactsActionController.endAction(_$actionInfo);
    }
  }
}
