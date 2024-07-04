import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:find_your_teacher/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.aboutMeIcon).existsSync(), isTrue);
    expect(File(Images.academicIcon).existsSync(), isTrue);
    expect(File(Images.atmthaLogo).existsSync(), isTrue);
    expect(File(Images.button).existsSync(), isTrue);
    expect(File(Images.checkYourPhone).existsSync(), isTrue);
    expect(File(Images.choose).existsSync(), isTrue);
    expect(File(Images.eduIcon).existsSync(), isTrue);
    expect(File(Images.faceBook).existsSync(), isTrue);
    expect(File(Images.facebookNew).existsSync(), isTrue);
    expect(File(Images.file).existsSync(), isTrue);
    expect(File(Images.files).existsSync(), isTrue);
    expect(File(Images.filterPhoto).existsSync(), isTrue);
    expect(File(Images.fytTagline).existsSync(), isTrue);
    expect(File(Images.fytLogo2).existsSync(), isTrue);
    expect(File(Images.imageEdit).existsSync(), isTrue);
    expect(File(Images.img).existsSync(), isTrue);
    expect(File(Images.instagramNew).existsSync(), isTrue);
    expect(File(Images.instagram).existsSync(), isTrue);
    expect(File(Images.linkedIn).existsSync(), isTrue);
    expect(File(Images.locationIcon).existsSync(), isTrue);
    expect(File(Images.logo).existsSync(), isTrue);
    expect(File(Images.logout).existsSync(), isTrue);
    expect(File(Images.noResults).existsSync(), isTrue);
    expect(File(Images.notActiveTeacher).existsSync(), isTrue);
    expect(File(Images.notifications).existsSync(), isTrue);
    expect(File(Images.password).existsSync(), isTrue);
    expect(File(Images.profileBackground).existsSync(), isTrue);
    expect(File(Images.putPhoneNumber).existsSync(), isTrue);
    expect(File(Images.student).existsSync(), isTrue);
    expect(File(Images.studentLastt).existsSync(), isTrue);
    expect(File(Images.subjectIcon).existsSync(), isTrue);
    expect(File(Images.teacher).existsSync(), isTrue);
    expect(File(Images.teacher1).existsSync(), isTrue);
    expect(File(Images.teacherLast).existsSync(), isTrue);
    expect(File(Images.telegramNew).existsSync(), isTrue);
    expect(File(Images.telegram).existsSync(), isTrue);
    expect(File(Images.telegram2).existsSync(), isTrue);
    expect(File(Images.undrawEducatorReJu47).existsSync(), isTrue);
    expect(File(Images.wlcScreen).existsSync(), isTrue);
  });
}
