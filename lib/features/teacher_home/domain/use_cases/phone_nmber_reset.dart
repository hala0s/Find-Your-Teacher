import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/feilurs.dart';
import '../repositories/profile_repository.dart';
@lazySingleton
class PhoneNumberResetUseCase{
  final ProfileRepository profileRepository;

  PhoneNumberResetUseCase({required this.profileRepository});
  Future<Either<Failure,Unit>>call(PhoneNumberResetParams phoneNumberResetParams)async{
    return await profileRepository.phoneNumberReset(phoneNumberResetParams);
  }

}
class PhoneNumberResetParams{
  final String phoneNumber;

  PhoneNumberResetParams({required this.phoneNumber});
  Map<String,dynamic>get map=>{
    'phoneNumber':phoneNumber,
  };

}