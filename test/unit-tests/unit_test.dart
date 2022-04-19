import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:truyou/components/components.dart';
import 'package:truyou/components/utils/validators/trust_validator.dart';

void main() async {
  group('Validators tests', () {
    test('Email validator', () {
      //Standard test
      const String? _email1 = 'fox@gmail.com';
      //Invalid gmails
      const String? _email2 = 'foxgmail.com';
      const String? _email3 = '@gmail.com';
      const String? _email4 = 'foxgmail.com';
      const String? _email5 = 'fox@@gmail.com';
      const String? _email6 = 'fox@gmail..com';
      const String? _email7 = 'fox@gmail.com.com';
      //Alternate domains
      const String? _email8 = 'fox@outlook.com';
      const String? _email9 = 'fox@yahoo.com';
      //Custom domain
      const String? _email10 = 'fox@longfoxcustomdomain.com';
      //Invalid emails
      const String? _email11 = '';
      const String? _email12 = '@.com';
      const String? _email13 = 'c@.com';
      const String? _email14 = 'fox^*@gmail.com';
      const String? _email15 = r'fox$^&*#@gmail.com';

      expect(emailValidator(_email1) == null, true, reason: 'fox@gmail.com');
      expect(
          emailValidator(_email2) == Constants.PLEASE_ENTER_A_VALID_EMAIL, true,
          reason: 'foxgmail.com');
      expect(
          emailValidator(_email3) == Constants.PLEASE_ENTER_A_VALID_EMAIL, true,
          reason: '@gmail.com');
      expect(
          emailValidator(_email4) == Constants.PLEASE_ENTER_A_VALID_EMAIL, true,
          reason: 'foxgmail.com');
      expect(
          emailValidator(_email5) == Constants.PLEASE_ENTER_A_VALID_EMAIL, true,
          reason: 'fox@@gmail.com');
      expect(
          emailValidator(_email6) == Constants.PLEASE_ENTER_A_VALID_EMAIL, true,
          reason: 'fox@gmail..com');
      expect(emailValidator(_email7) == null, true,
          reason: 'fox@gmail.com.com');
      expect(emailValidator(_email8) == null, true, reason: 'fox@outlook.com');
      expect(emailValidator(_email9) == null, true, reason: 'fox@yahoo.com');
      expect(emailValidator(_email10) == null, true,
          reason: 'fox@longfoxcustomdomain.com');
      expect(emailValidator(_email11) == Constants.PLEASE_ENTER_AN_EMAIL, true,
          reason: 'Empty Email');
      expect(emailValidator(_email12) == Constants.PLEASE_ENTER_A_VALID_EMAIL,
          true,
          reason: '@.com');
      expect(emailValidator(_email13) == Constants.PLEASE_ENTER_A_VALID_EMAIL,
          true,
          reason: 'c@.com');
      expect(emailValidator(_email14) == Constants.PLEASE_ENTER_A_VALID_EMAIL,
          true,
          reason: 'fox&^@gmail.com');
      expect(emailValidator(_email15) == Constants.PLEASE_ENTER_A_VALID_EMAIL,
          true,
          reason: r'fox$^&*#@gmail.com');
    });

    test('Password validator', () {
      //Invalid passwords
      const String? _p1 = '';
      const String? _p2 = 't3x';
      const String? _p3 = 'pok3r*3';
      //Valid passwords
      const String? _p4 = 'jh415kf233*&';
      const String? _p5 = r'@ctu@lP@$$w0rD';
      const String? _p6 = '                         ';

      //Results
      expect(passwordValidator(_p1) == Constants.PLEASE_ENTER_A_PASSWORD, true,
          reason: 'Empty Password');
      expect(passwordValidator(_p2) == Constants.PLEASE_ENTER_A_LONGER_PASSWORD,
          true,
          reason: _p2);
      expect(passwordValidator(_p3) == Constants.PLEASE_ENTER_A_LONGER_PASSWORD,
          true,
          reason: _p3);
      expect(passwordValidator(_p4) == null, true, reason: _p4);
      expect(passwordValidator(_p5) == null, true, reason: _p5);
      expect(passwordValidator(_p6) == null, true, reason: _p6);
    });

    test('Name validator', () {
      //Invalid names
      const String? _n0 = 'x';
      const String? _n1 = '';
      const String? _n5 = r'$$$$######***&#&*#(&$*(*$#($&*($&*&(#&$*&$';
      const String? _n6 = '&*%#&*#%';
      const String? _n7 = r'BArt#$';
      const String? _n4 = 'supersxmegwgwkgjhwgrlwhrghjwrhgjwrljghwrgwh';
      //Valid names
      const String? _n2 = 'eb';
      const String? _n3 = 'vader';

      //Results
      expect(
          nameValidator(_n0, 'name') ==
              Constants.PLEASE_ENTER_NAME_WITH_ATLEAST_TWO_CHARACTERS('name'),
          true,
          reason: 'Empty name');
      expect(
          nameValidator(_n1, 'name') == Constants.PLEASE_ENTER_A_NAME('name'),
          true,
          reason: 'Empty name');
      expect(nameValidator(_n2, 'name') == null, true, reason: _n2);
      expect(nameValidator(_n3, 'name') == null, true, reason: _n3);
      expect(
          nameValidator(_n4, 'name') ==
              Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
                  'name'),
          true,
          reason: _n4);
      expect(
          nameValidator(_n5, 'name') ==
              Constants.PLEASE_ENTER_NAME_NO_LONGER_THAN_THIRTY_CHARACTERS(
                  'name'),
          true,
          reason: _n5);
      expect(
          nameValidator(_n6, 'name') ==
              Constants.PLEASE_ENTER_A_VALID_NAME('name'),
          true,
          reason: _n6);
      expect(
          nameValidator(_n7, 'name') ==
              Constants.PLEASE_ENTER_A_VALID_NAME('name'),
          true,
          reason: _n7);
    });

    test('Long Text validator', () {
      //Invalid
      const String? _l1 = '';
      const String? _l2 = 'Hello, I am Mark.';
      //Valid
      const String? _l3 =
          'Hello, my name is Sam Ruffalo, I really like the wildness of East Asia';
      const String? _l4 =
          r'Hello 001003$$, !t$ m3 M3O, I $peak in @ st@ange way, because I c@n';
      //Results
      expect(
          longTextValidator(_l1, 'x') ==
              Constants.PLEASE_ENTER_A_LONG_TEXT('x'),
          true,
          reason: 'Empty');
      expect(
          longTextValidator(_l2, 'x') ==
              Constants.PLEASE_ENTER_A_LONG_TEXT_LONGER_THAN_THIRTY_CHARS,
          true,
          reason: _l2);
      expect(longTextValidator(_l3, 'x') == null, true, reason: _l3);
      expect(longTextValidator(_l4, 'x') == null, true, reason: _l4);
    });
    test('Short Text validator', () {
      //Invalid
      const String? _s1 = '';
      const String? _s4 =
          r'Hello 001003$$, !t$ m3 M3O, I $peak in @ st@ange way, because I c@n';
      //Valid
      const String? _s3 = 'Hello, my name is Sam Ruffalo';
      const String? _s2 = 'Hello, I am Mark.';

      //Results
      expect(
          shortTextValidator(_s1, 'x') ==
              Constants.PLEASE_ENTER_A_SHORT_TEXT('x'),
          true,
          reason: 'Empty');
      expect(shortTextValidator(_s2, 'x') == null, true, reason: _s2);
      expect(shortTextValidator(_s3, 'x') == null, true, reason: _s3);
      expect(
          shortTextValidator(_s4, 'x') ==
              Constants.PLEASE_ENTER_SHORT_TEXT_WITH_LESS_THAN_FORTY_CHARS('x'),
          true,
          reason: _s4);
    });

    test('Phone Number validator', () {
      //Invalid
      const String? _p1 = '';
      const String? _p4 = '502';
      //Valid
      const String? _p5 = '1023044560';

      //Results
      expect(phoneNumberValidator(_p1) == Constants.PLEASE_ENTER_A_PHONE_NUMBER,
          true,
          reason: 'Empty');
      expect(
          phoneNumberValidator(_p4) ==
              Constants.PLEASE_ENTER_PHONE_NUMBER_WITH_TEN_DIGITS,
          true,
          reason: _p4);
      expect(phoneNumberValidator(_p5) == null, true, reason: _p5);
    });

    test('Wallet validator', () {
      //Invalid
      const String? _w1 = '';
      const String? _w2 = 'JEWGHJWJ13';
      //Valid
      const String? _w3 =
          'GDA5MWDRLWIQ7G2YZABYYLAA2ZCCZYRZTXR35CTCECL52FNUMXYCC2JXYUX82HXF';

      //Results
      expect(
          walletValidator(_w1) == Constants.PLEASE_ENTER_A_WALLET_ADDRESS, true,
          reason: 'Empty');
      expect(
          walletValidator(_w2) ==
              Constants.PLEASE_ENTER_ADDRESS_EQUAL_TO_SIXTY_FOUR_CHARS,
          true,
          reason: _w2);
      expect(walletValidator(_w3) == null, true, reason: _w3);
    });
  });

  group('Date helper tests', () {
    test('Get age', () {
      expect(DateHelper.getAge(DateTime(1980)) == 42, isTrue);
      expect(DateHelper.getAge(DateTime(1900)) == 122, isTrue);
      expect(DateHelper.getAge(DateTime(1600)) == 422, isTrue);
      expect(DateHelper.getAge(DateTime(2021)) == 1, isTrue);
    });

    test('Convert DateTime to standard date', () {
      //Standard dates
      const String _d1 = '16 February 1960';
      const String _d2 = '1 September 2020';
      const String _d3 = '30 April 2004';
      const String _d4 = '31 December 2021';
      //Results
      expect(
          DateHelper.dateToStandardDate(DateTime(1960, 02, 16)) == _d1, isTrue,
          reason: _d1);
      expect(
          DateHelper.dateToStandardDate(DateTime(2020, 09, 01)) == _d2, isTrue,
          reason: _d2);
      expect(
          DateHelper.dateToStandardDate(DateTime(2004, 04, 30)) == _d3, isTrue,
          reason: _d3);
      expect(
          DateHelper.dateToStandardDate(DateTime(2021, 12, 31)) == _d4, isTrue,
          reason: _d4);
    });
  });

  group('Remove spaces tests', () {
    test('Remove all spaces from string', () {
      //Strings
      const String _s1 = 'Removespace   ';
      const String _s2 = 'Remove    space   ';
      const String _s3 = '    Remove    space   ';
      const String _s4 = 'Remove space';

      //Result
      const String _r = 'Removespace';

      //Results
      expect(SpaceRemover.removeSpaces(_s1) == _r, isTrue, reason: _s1);
      expect(SpaceRemover.removeSpaces(_s2) == _r, isTrue, reason: _s2);
      expect(SpaceRemover.removeSpaces(_s3) == _r, isTrue, reason: _s3);
      expect(SpaceRemover.removeSpaces(_s4) == _r, isTrue, reason: _s4);
    });
  });

  group('Trust validation', () {
    test('Trust validator', () {
      //Strings
      const String _s1 = '';
      const String _s2 = '0';
      const String _s3 = '000000';
      const String _s4 = '123456';
      const String _s5 = '01';
      const String _s6 = '999999';
      const String _s7 = '9-3';
      const String _s8 = '9.3';

      //Results
      expect(
          trustValidator(_s1) == Constants.PLEASE_ENTER_A_TRUST_AMOUNT, isTrue,
          reason: 'Empty String');
      expect(trustValidator(_s2) == Constants.PLEASE_ENTER_AMOUNT_MORE_THAN_0,
          isTrue,
          reason: _s2);
      expect(trustValidator(_s3) == Constants.PLEASE_ENTER_AMOUNT_MORE_THAN_0,
          isTrue,
          reason: _s3);
      expect(trustValidator(_s4) == null, isTrue, reason: _s4);
      expect(trustValidator(_s5) == null, isTrue, reason: _s5);
      expect(trustValidator(_s6) == null, isTrue, reason: _s6);
      expect(
          trustValidator(_s7) ==
              Constants.PLEASE_ENTER_AMOUNT_WITH_NO_ABNORMAL_CHARS,
          isTrue,
          reason: _s7);
      expect(
          trustValidator(_s8) ==
              Constants.PLEASE_ENTER_AMOUNT_WITH_NO_ABNORMAL_CHARS,
          isTrue,
          reason: _s8);
    });
  });

  group('Search validation', () {
    test('Search textfield validation', () {
      const String _empty = '';
      const String _s1 = 'Michael';
      const String _s2 = 'Michelle Barker Junior Senior';

      expect(searchValidator(_empty) == Constants.PLEASE_SEARCH_FOR_SOMETHING,
          isTrue,
          reason: 'Empty');

      expect(searchValidator(_s1) == null, isTrue, reason: _s1);

      expect(searchValidator(_s2) == null, isTrue, reason: _s2);
    });
  });
}
