// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mealBloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MealEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filtered,
    required TResult Function(dynamic meal) addtocart,
    required TResult Function(dynamic meal) removefromcart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filtered,
    TResult? Function(dynamic meal)? addtocart,
    TResult? Function(dynamic meal)? removefromcart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filtered,
    TResult Function(dynamic meal)? addtocart,
    TResult Function(dynamic meal)? removefromcart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Filtered value) filtered,
    required TResult Function(_Addtocart value) addtocart,
    required TResult Function(_Removefromcart value) removefromcart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Filtered value)? filtered,
    TResult? Function(_Addtocart value)? addtocart,
    TResult? Function(_Removefromcart value)? removefromcart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Filtered value)? filtered,
    TResult Function(_Addtocart value)? addtocart,
    TResult Function(_Removefromcart value)? removefromcart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealEventCopyWith<$Res> {
  factory $MealEventCopyWith(MealEvent value, $Res Function(MealEvent) then) =
      _$MealEventCopyWithImpl<$Res, MealEvent>;
}

/// @nodoc
class _$MealEventCopyWithImpl<$Res, $Val extends MealEvent>
    implements $MealEventCopyWith<$Res> {
  _$MealEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$MealEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchImpl with DiagnosticableTreeMixin implements _Fetch {
  const _$FetchImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MealEvent.fetch()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MealEvent.fetch'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filtered,
    required TResult Function(dynamic meal) addtocart,
    required TResult Function(dynamic meal) removefromcart,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filtered,
    TResult? Function(dynamic meal)? addtocart,
    TResult? Function(dynamic meal)? removefromcart,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filtered,
    TResult Function(dynamic meal)? addtocart,
    TResult Function(dynamic meal)? removefromcart,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Filtered value) filtered,
    required TResult Function(_Addtocart value) addtocart,
    required TResult Function(_Removefromcart value) removefromcart,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Filtered value)? filtered,
    TResult? Function(_Addtocart value)? addtocart,
    TResult? Function(_Removefromcart value)? removefromcart,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Filtered value)? filtered,
    TResult Function(_Addtocart value)? addtocart,
    TResult Function(_Removefromcart value)? removefromcart,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements MealEvent {
  const factory _Fetch() = _$FetchImpl;
}

/// @nodoc
abstract class _$$FilteredImplCopyWith<$Res> {
  factory _$$FilteredImplCopyWith(
          _$FilteredImpl value, $Res Function(_$FilteredImpl) then) =
      __$$FilteredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$FilteredImplCopyWithImpl<$Res>
    extends _$MealEventCopyWithImpl<$Res, _$FilteredImpl>
    implements _$$FilteredImplCopyWith<$Res> {
  __$$FilteredImplCopyWithImpl(
      _$FilteredImpl _value, $Res Function(_$FilteredImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$FilteredImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilteredImpl with DiagnosticableTreeMixin implements _Filtered {
  const _$FilteredImpl(this.category);

  @override
  final String category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MealEvent.filtered(category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MealEvent.filtered'))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteredImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteredImplCopyWith<_$FilteredImpl> get copyWith =>
      __$$FilteredImplCopyWithImpl<_$FilteredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filtered,
    required TResult Function(dynamic meal) addtocart,
    required TResult Function(dynamic meal) removefromcart,
  }) {
    return filtered(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filtered,
    TResult? Function(dynamic meal)? addtocart,
    TResult? Function(dynamic meal)? removefromcart,
  }) {
    return filtered?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filtered,
    TResult Function(dynamic meal)? addtocart,
    TResult Function(dynamic meal)? removefromcart,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Filtered value) filtered,
    required TResult Function(_Addtocart value) addtocart,
    required TResult Function(_Removefromcart value) removefromcart,
  }) {
    return filtered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Filtered value)? filtered,
    TResult? Function(_Addtocart value)? addtocart,
    TResult? Function(_Removefromcart value)? removefromcart,
  }) {
    return filtered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Filtered value)? filtered,
    TResult Function(_Addtocart value)? addtocart,
    TResult Function(_Removefromcart value)? removefromcart,
    required TResult orElse(),
  }) {
    if (filtered != null) {
      return filtered(this);
    }
    return orElse();
  }
}

abstract class _Filtered implements MealEvent {
  const factory _Filtered(final String category) = _$FilteredImpl;

  String get category;

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilteredImplCopyWith<_$FilteredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddtocartImplCopyWith<$Res> {
  factory _$$AddtocartImplCopyWith(
          _$AddtocartImpl value, $Res Function(_$AddtocartImpl) then) =
      __$$AddtocartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic meal});
}

/// @nodoc
class __$$AddtocartImplCopyWithImpl<$Res>
    extends _$MealEventCopyWithImpl<$Res, _$AddtocartImpl>
    implements _$$AddtocartImplCopyWith<$Res> {
  __$$AddtocartImplCopyWithImpl(
      _$AddtocartImpl _value, $Res Function(_$AddtocartImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meal = freezed,
  }) {
    return _then(_$AddtocartImpl(
      freezed == meal ? _value.meal! : meal,
    ));
  }
}

/// @nodoc

class _$AddtocartImpl with DiagnosticableTreeMixin implements _Addtocart {
  const _$AddtocartImpl(this.meal);

  @override
  final dynamic meal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MealEvent.addtocart(meal: $meal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MealEvent.addtocart'))
      ..add(DiagnosticsProperty('meal', meal));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddtocartImpl &&
            const DeepCollectionEquality().equals(other.meal, meal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(meal));

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddtocartImplCopyWith<_$AddtocartImpl> get copyWith =>
      __$$AddtocartImplCopyWithImpl<_$AddtocartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filtered,
    required TResult Function(dynamic meal) addtocart,
    required TResult Function(dynamic meal) removefromcart,
  }) {
    return addtocart(meal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filtered,
    TResult? Function(dynamic meal)? addtocart,
    TResult? Function(dynamic meal)? removefromcart,
  }) {
    return addtocart?.call(meal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filtered,
    TResult Function(dynamic meal)? addtocart,
    TResult Function(dynamic meal)? removefromcart,
    required TResult orElse(),
  }) {
    if (addtocart != null) {
      return addtocart(meal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Filtered value) filtered,
    required TResult Function(_Addtocart value) addtocart,
    required TResult Function(_Removefromcart value) removefromcart,
  }) {
    return addtocart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Filtered value)? filtered,
    TResult? Function(_Addtocart value)? addtocart,
    TResult? Function(_Removefromcart value)? removefromcart,
  }) {
    return addtocart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Filtered value)? filtered,
    TResult Function(_Addtocart value)? addtocart,
    TResult Function(_Removefromcart value)? removefromcart,
    required TResult orElse(),
  }) {
    if (addtocart != null) {
      return addtocart(this);
    }
    return orElse();
  }
}

abstract class _Addtocart implements MealEvent {
  const factory _Addtocart(final dynamic meal) = _$AddtocartImpl;

  dynamic get meal;

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddtocartImplCopyWith<_$AddtocartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovefromcartImplCopyWith<$Res> {
  factory _$$RemovefromcartImplCopyWith(_$RemovefromcartImpl value,
          $Res Function(_$RemovefromcartImpl) then) =
      __$$RemovefromcartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic meal});
}

/// @nodoc
class __$$RemovefromcartImplCopyWithImpl<$Res>
    extends _$MealEventCopyWithImpl<$Res, _$RemovefromcartImpl>
    implements _$$RemovefromcartImplCopyWith<$Res> {
  __$$RemovefromcartImplCopyWithImpl(
      _$RemovefromcartImpl _value, $Res Function(_$RemovefromcartImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meal = freezed,
  }) {
    return _then(_$RemovefromcartImpl(
      freezed == meal ? _value.meal! : meal,
    ));
  }
}

/// @nodoc

class _$RemovefromcartImpl
    with DiagnosticableTreeMixin
    implements _Removefromcart {
  const _$RemovefromcartImpl(this.meal);

  @override
  final dynamic meal;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MealEvent.removefromcart(meal: $meal)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MealEvent.removefromcart'))
      ..add(DiagnosticsProperty('meal', meal));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovefromcartImpl &&
            const DeepCollectionEquality().equals(other.meal, meal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(meal));

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovefromcartImplCopyWith<_$RemovefromcartImpl> get copyWith =>
      __$$RemovefromcartImplCopyWithImpl<_$RemovefromcartImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
    required TResult Function(String category) filtered,
    required TResult Function(dynamic meal) addtocart,
    required TResult Function(dynamic meal) removefromcart,
  }) {
    return removefromcart(meal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
    TResult? Function(String category)? filtered,
    TResult? Function(dynamic meal)? addtocart,
    TResult? Function(dynamic meal)? removefromcart,
  }) {
    return removefromcart?.call(meal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    TResult Function(String category)? filtered,
    TResult Function(dynamic meal)? addtocart,
    TResult Function(dynamic meal)? removefromcart,
    required TResult orElse(),
  }) {
    if (removefromcart != null) {
      return removefromcart(meal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Filtered value) filtered,
    required TResult Function(_Addtocart value) addtocart,
    required TResult Function(_Removefromcart value) removefromcart,
  }) {
    return removefromcart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Filtered value)? filtered,
    TResult? Function(_Addtocart value)? addtocart,
    TResult? Function(_Removefromcart value)? removefromcart,
  }) {
    return removefromcart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Filtered value)? filtered,
    TResult Function(_Addtocart value)? addtocart,
    TResult Function(_Removefromcart value)? removefromcart,
    required TResult orElse(),
  }) {
    if (removefromcart != null) {
      return removefromcart(this);
    }
    return orElse();
  }
}

abstract class _Removefromcart implements MealEvent {
  const factory _Removefromcart(final dynamic meal) = _$RemovefromcartImpl;

  dynamic get meal;

  /// Create a copy of MealEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemovefromcartImplCopyWith<_$RemovefromcartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MealState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealStateCopyWith<$Res> {
  factory $MealStateCopyWith(MealState value, $Res Function(MealState) then) =
      _$MealStateCopyWithImpl<$Res, MealState>;
}

/// @nodoc
class _$MealStateCopyWithImpl<$Res, $Val extends MealState>
    implements $MealStateCopyWith<$Res> {
  _$MealStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MealState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MealState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MealState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MealState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'MealState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MealState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Meal> meals,
      List<Meal> filtered,
      Set<String> categories,
      String selectedCat});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meals = null,
    Object? filtered = null,
    Object? categories = null,
    Object? selectedCat = null,
  }) {
    return _then(_$LoadedImpl(
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      filtered: null == filtered
          ? _value._filtered
          : filtered // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectedCat: null == selectedCat
          ? _value.selectedCat
          : selectedCat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl(
      {required final List<Meal> meals,
      required final List<Meal> filtered,
      required final Set<String> categories,
      required this.selectedCat})
      : _meals = meals,
        _filtered = filtered,
        _categories = categories;

  final List<Meal> _meals;
  @override
  List<Meal> get meals {
    if (_meals is EqualUnmodifiableListView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_meals);
  }

  final List<Meal> _filtered;
  @override
  List<Meal> get filtered {
    if (_filtered is EqualUnmodifiableListView) return _filtered;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filtered);
  }

  final Set<String> _categories;
  @override
  Set<String> get categories {
    if (_categories is EqualUnmodifiableSetView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_categories);
  }

  @override
  final String selectedCat;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MealState.loaded(meals: $meals, filtered: $filtered, categories: $categories, selectedCat: $selectedCat)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MealState.loaded'))
      ..add(DiagnosticsProperty('meals', meals))
      ..add(DiagnosticsProperty('filtered', filtered))
      ..add(DiagnosticsProperty('categories', categories))
      ..add(DiagnosticsProperty('selectedCat', selectedCat));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._meals, _meals) &&
            const DeepCollectionEquality().equals(other._filtered, _filtered) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.selectedCat, selectedCat) ||
                other.selectedCat == selectedCat));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_meals),
      const DeepCollectionEquality().hash(_filtered),
      const DeepCollectionEquality().hash(_categories),
      selectedCat);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(meals, filtered, categories, selectedCat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(meals, filtered, categories, selectedCat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(meals, filtered, categories, selectedCat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements MealState {
  const factory _Loaded(
      {required final List<Meal> meals,
      required final List<Meal> filtered,
      required final Set<String> categories,
      required final String selectedCat}) = _$LoadedImpl;

  List<Meal> get meals;
  List<Meal> get filtered;
  Set<String> get categories;
  String get selectedCat;

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MealState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MealState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Meal> meals, List<Meal> filtered,
            Set<String> categories, String selectedCat)?
        loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MealState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of MealState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
