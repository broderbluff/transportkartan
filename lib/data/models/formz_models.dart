import 'package:formz/formz.dart';

enum PasswordInputError {
  empty,
  tooShort,
  noDigit,
  noUppercase,
  noLowercase,
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    if (value.length < 8) {
      return PasswordInputError.tooShort;
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return PasswordInputError.noDigit;
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return PasswordInputError.noUppercase;
    }

    return null;
  }
}

enum EmailInputError { invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&`*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  @override
  EmailInputError? validator(String value) {
    return _emailRegExp.hasMatch(value)
        ? null
        : value.isEmpty
            ? null
            : EmailInputError.invalid;
  }
}

extension Explanation on EmailInputError {
  String? get name {
    switch (this) {
      case EmailInputError.invalid:
        return "This is not a valid email";
      default:
        return null;
    }
  }
}
