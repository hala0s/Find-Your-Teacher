// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;

import '../core/bloc_version/version_bloc.dart' as _i3;
import '../core/network/network.dart' as _i6;
import '../features/notfications/data/data_sources/notification_remote_data_source.dart'
    as _i9;
import '../features/notfications/data/repositories/notificatiocs_imp.dart'
    as _i30;
import '../features/notfications/domain/repositories/notfications_domain.dart'
    as _i29;
import '../features/notfications/domain/use_cases/notification_use_case.dart'
    as _i54;
import '../features/notfications/presentation/maneger/notifications_bloc.dart'
    as _i55;
import '../features/notification_student/data/data_sources/student_remote.dart'
    as _i17;
import '../features/notification_student/data/repositories/notification_student_repository.dart'
    as _i23;
import '../features/notification_student/domain/repositories/notification_repository.dart'
    as _i22;
import '../features/notification_student/domain/use_cases/notification_student_usecase.dart'
    as _i26;
import '../features/notification_student/presentation/manager/student_notification/student_notifications_bloc.dart'
    as _i28;
import '../features/search%20and%20filter/data/data_sources/search_remote.dart'
    as _i13;
import '../features/search%20and%20filter/data/repositories/search_repository.dart'
    as _i32;
import '../features/search%20and%20filter/domain/repositories/search_repository.dart'
    as _i31;
import '../features/search%20and%20filter/domain/use_cases/filter_use_case.dart'
    as _i50;
import '../features/search%20and%20filter/domain/use_cases/location_search_usecase.dart'
    as _i64;
import '../features/search%20and%20filter/domain/use_cases/search_usecase.dart'
    as _i65;
import '../features/search%20and%20filter/presentation/manager/search_with_filter/search_and_filter_bloc.dart'
    as _i71;
import '../features/student_auth/data/data_sources/local_data_source.dart'
    as _i7;
import '../features/student_auth/data/data_sources/remote_data_source.dart'
    as _i14;
import '../features/student_auth/data/repositories/auth_repo_implements_student.dart'
    as _i19;
import '../features/student_auth/domain/repositories/AuthRepositories.dart'
    as _i18;
import '../features/student_auth/domain/use_cases/log_in_student.dart' as _i27;
import '../features/student_auth/domain/use_cases/sign_up_student.dart' as _i39;
import '../features/student_auth/presentation/manager/log_in_student_bloc/log_in_student_bloc.dart'
    as _i56;
import '../features/student_auth/presentation/manager/sign_up_student_bloc/sign_up_student__bloc.dart'
    as _i62;
import '../features/student_home/data/data_sources/profile_data_source.dart'
    as _i12;
import '../features/student_home/data/data_sources/top_teachers_remote_data.dart'
    as _i10;
import '../features/student_home/data/repositories/profile_repository.dart'
    as _i16;
import '../features/student_home/data/repositories/top_teachers_repo.dart'
    as _i41;
import '../features/student_home/domain/repositories/profile_repository.dart'
    as _i15;
import '../features/student_home/domain/repositories/top_teachers_repository.dart'
    as _i40;
import '../features/student_home/domain/use_cases/profile_usecase.dart' as _i35;
import '../features/student_home/domain/use_cases/student_profile_usecase.dart'
    as _i36;
import '../features/student_home/domain/use_cases/take_number_usecase.dart'
    as _i37;
import '../features/student_home/domain/use_cases/top_teachers_usecase.dart'
    as _i59;
import '../features/student_home/presentation/manager/student_profile/student_profile_bloc.dart'
    as _i58;
import '../features/student_home/presentation/manager/take_teacher_number/take_teacher_number_bloc.dart'
    as _i68;
import '../features/student_home/presentation/manager/top_teachers/top_teachers_bloc.dart'
    as _i63;
import '../features/teacher%20auth/data/data_sources/remote_teacher_data_source.dart'
    as _i8;
import '../features/teacher%20auth/data/repositories/teacher_repo_imp.dart'
    as _i21;
import '../features/teacher%20auth/domain/repositories/register_repository.dart'
    as _i20;
import '../features/teacher%20auth/domain/use_cases/complete_profile2.dart'
    as _i42;
import '../features/teacher%20auth/domain/use_cases/complete_teacher_profile_1.dart'
    as _i43;
import '../features/teacher%20auth/domain/use_cases/get_complete_profile.dart'
    as _i44;
import '../features/teacher%20auth/domain/use_cases/get_teacher_profile_before_complete.dart'
    as _i45;
import '../features/teacher%20auth/domain/use_cases/location.dart' as _i46;
import '../features/teacher%20auth/domain/use_cases/login_teacher.dart' as _i47;
import '../features/teacher%20auth/domain/use_cases/sign_up_teacher.dart'
    as _i48;
import '../features/teacher%20auth/domain/use_cases/teacher_activate_usecase.dart'
    as _i49;
import '../features/teacher%20auth/presentation/manager/comple_teacher_profile_1/complete_teacher_profile1_bloc.dart'
    as _i70;
import '../features/teacher%20auth/presentation/manager/get_teacher_profile_before_complete_/get_teacher_profile_before_complete_bloc.dart'
    as _i69;
import '../features/teacher%20auth/presentation/manager/location/location_bloc.dart'
    as _i67;
import '../features/teacher%20auth/presentation/manager/second_complete_profile/second_complete_profile_bloc.dart'
    as _i66;
import '../features/teacher%20auth/presentation/manager/teacher_activate/teacher_activate_bloc.dart'
    as _i57;
import '../features/teacher%20auth/presentation/manager/teacher_log_in_bloc/log_in_teacher_bloc.dart'
    as _i53;
import '../features/teacher%20auth/presentation/manager/teacher_sign_up_bloc/sign_up_teacher_bloc.dart'
    as _i61;
import '../features/teacher_home/data/data_sources/profile_remote.dart' as _i11;
import '../features/teacher_home/data/repositories/profile_repository.dart'
    as _i25;
import '../features/teacher_home/domain/repositories/profile_repository.dart'
    as _i24;
import '../features/teacher_home/domain/use_cases/avaible_forStudents.dart'
    as _i33;
import '../features/teacher_home/domain/use_cases/phone_nmber_reset.dart'
    as _i34;
import '../features/teacher_home/domain/use_cases/profile_usecase.dart' as _i52;
import '../features/teacher_home/presentation/manager/available_for_students/available_for_students_bloc.dart'
    as _i51;
import '../features/teacher_home/presentation/manager/get_teacher_profile_bloc.dart'
    as _i60;
import '../features/teacher_home/presentation/manager/reset_phone_number/reset_phone_number_bloc.dart'
    as _i38;
import 'injection.dart' as _i72;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i3.VersionBloc>(() => _i3.VersionBloc());
    gh.factory<_i4.BaseOptions>(() => appModule.dioOption);
    gh.singleton<_i5.Logger>(() => appModule.logger);
    gh.factory<_i6.NetworkInfo>(() => _i6.NetworkInfoImpl());
    gh.lazySingleton<_i7.AuthLocalDataSource>(
        () => _i7.AuthImpLocalDataSource());
    gh.lazySingleton<_i4.Dio>(() => appModule.dio(
          gh<_i4.BaseOptions>(),
          gh<_i5.Logger>(),
        ));
    gh.lazySingleton<_i8.AuthTeacherRemoteDataSource>(
        () => _i8.AutTeacherRemoteDataSourceImp(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i9.NotificationRemoteDataSource>(
        () => _i9.NotificationImpRemoteDataSource(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i10.TopTeachersRemote>(
        () => _i10.TopTeachersRemoteImpl(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i11.ProfileRemote>(
        () => _i11.ProfileRemoteImpl(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i12.StudentProfileRemote>(
        () => _i12.StudentProfileRemoteImpl(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i13.SearchAndFilterRemote>(
        () => _i13.SearchAndFilterRemoteImp(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i14.AutStudentRemoteDataSource>(
        () => _i14.AutStudentRemoteDataSourceImp(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i15.StudentProfileRepository>(
        () => _i16.StudentProfileRepositoryImpl(
              studentProfileRemote: gh<_i12.StudentProfileRemote>(),
              networkInfo: gh<_i6.NetworkInfo>(),
            ));
    gh.lazySingleton<_i17.StudentRemoteData>(
        () => _i17.StudentRemoteImpl(dio: gh<_i4.Dio>()));
    gh.lazySingleton<_i18.AuthStudentRepo>(
        () => _i19.AuthStudentRepositoriesImp(
              autStudentRemoteDataSource: gh<_i14.AutStudentRemoteDataSource>(),
              networkInfo: gh<_i6.NetworkInfo>(),
              authLocalDataSource: gh<_i7.AuthLocalDataSource>(),
            ));
    gh.lazySingleton<_i20.AuthTeacherRepo>(() => _i21.AuthTeacherRepoImp(
          authTeacherRemoteDataSource: gh<_i8.AuthTeacherRemoteDataSource>(),
          authLocalDataSource: gh<_i7.AuthLocalDataSource>(),
          networkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.lazySingleton<_i22.NotificationStudentRepository>(() =>
        _i23.StudentNotificationImp(
          studentNotificationImpRemoteDataSource: gh<_i17.StudentRemoteData>(),
          netWorkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.lazySingleton<_i24.ProfileRepository>(
        () => _i25.ProfileTeacherRepositoryImpl(
              profileRemote: gh<_i11.ProfileRemote>(),
              networkInfo: gh<_i6.NetworkInfo>(),
            ));
    gh.lazySingleton<_i26.NotificationsStudentUseCase>(() =>
        _i26.NotificationsStudentUseCase(
            notificationStudentRepository:
                gh<_i22.NotificationStudentRepository>()));
    gh.lazySingleton<_i27.LogInStudentUseCase>(() =>
        _i27.LogInStudentUseCase(authStudentRepo: gh<_i18.AuthStudentRepo>()));
    gh.factory<_i28.StudentNotificationsBloc>(() =>
        _i28.StudentNotificationsBloc(gh<_i26.NotificationsStudentUseCase>()));
    gh.lazySingleton<_i29.NotificationRepoDomain>(() => _i30.NotificationImp(
          notificationRemoteDataSource: gh<_i9.NotificationRemoteDataSource>(),
          netWorkInfo: gh<_i6.NetworkInfo>(),
        ));
    gh.lazySingleton<_i31.SearchAndFilterRepository>(
        () => _i32.SearchAndFilterRepositoryImpl(
              searchAndFilterRemote: gh<_i13.SearchAndFilterRemote>(),
              networkInfo: gh<_i6.NetworkInfo>(),
            ));
    gh.lazySingleton<_i33.AvailableForStudentUseCase>(() =>
        _i33.AvailableForStudentUseCase(
            profileRepository: gh<_i24.ProfileRepository>()));
    gh.lazySingleton<_i34.PhoneNumberResetUseCase>(() =>
        _i34.PhoneNumberResetUseCase(
            profileRepository: gh<_i24.ProfileRepository>()));
    gh.lazySingleton<_i35.StudentProfileUseCase>(() =>
        _i35.StudentProfileUseCase(
            studentProfileRepository: gh<_i15.StudentProfileRepository>()));
    gh.lazySingleton<_i35.StudentSubjectsUseCase>(() =>
        _i35.StudentSubjectsUseCase(
            studentProfileRepository: gh<_i15.StudentProfileRepository>()));
    gh.lazySingleton<_i36.GetStudentProfileUseCase>(() =>
        _i36.GetStudentProfileUseCase(
            studentProfileRepository: gh<_i15.StudentProfileRepository>()));
    gh.lazySingleton<_i37.TakeTeacherNumberUseCase>(() =>
        _i37.TakeTeacherNumberUseCase(
            studentProfileRepository: gh<_i15.StudentProfileRepository>()));
    gh.factory<_i38.ResetPhoneNumberBloc>(
        () => _i38.ResetPhoneNumberBloc(gh<_i34.PhoneNumberResetUseCase>()));
    gh.lazySingleton<_i39.SignUpStudentUseCase>(() => _i39.SignUpStudentUseCase(
        authStudentRepositories: gh<_i18.AuthStudentRepo>()));
    gh.lazySingleton<_i40.TopTeacherRepository>(() => _i41.TopTeachersImpl(
          networkInfo: gh<_i6.NetworkInfo>(),
          topTeachersRemote: gh<_i10.TopTeachersRemote>(),
        ));
    gh.lazySingleton<_i42.SecondRegisterUseCase>(() =>
        _i42.SecondRegisterUseCase(
            authTeacherRepo: gh<_i20.AuthTeacherRepo>()));
    gh.lazySingleton<_i43.CompleteTeacherProfileUseCase1>(() =>
        _i43.CompleteTeacherProfileUseCase1(
            authTeacherRepo: gh<_i20.AuthTeacherRepo>()));
    gh.lazySingleton<_i44.GetCompleteProfileUseCase>(() =>
        _i44.GetCompleteProfileUseCase(
            authTeacherRepo: gh<_i20.AuthTeacherRepo>()));
    gh.lazySingleton<_i45.GetTeacherProfileBeforeCompleteUseCase>(() =>
        _i45.GetTeacherProfileBeforeCompleteUseCase(
            authTeacherRepo: gh<_i20.AuthTeacherRepo>()));
    gh.lazySingleton<_i46.LocationUseCase>(() =>
        _i46.LocationUseCase(authTeacherRepo: gh<_i20.AuthTeacherRepo>()));
    gh.lazySingleton<_i47.LogInTeacherUseCase>(() =>
        _i47.LogInTeacherUseCase(authTeacherRepo: gh<_i20.AuthTeacherRepo>()));
    gh.lazySingleton<_i48.SignUpTeacherUseCase>(() =>
        _i48.SignUpTeacherUseCase(authTeacherRepo: gh<_i20.AuthTeacherRepo>()));
    gh.lazySingleton<_i49.TeacherActivateUseCase>(() =>
        _i49.TeacherActivateUseCase(
            authTeacherRepo: gh<_i20.AuthTeacherRepo>()));
    gh.lazySingleton<_i50.GetFilterUseCase>(() => _i50.GetFilterUseCase(
        searchAndFilterRepository: gh<_i31.SearchAndFilterRepository>()));
    gh.factory<_i51.AvailableForStudentsBloc>(() =>
        _i51.AvailableForStudentsBloc(gh<_i33.AvailableForStudentUseCase>()));
    gh.lazySingleton<_i52.TeacherProfileUseCase>(() =>
        _i52.TeacherProfileUseCase(
            iProfileRepository: gh<_i24.ProfileRepository>()));
    gh.factory<_i53.LogInTeacherBloc>(
        () => _i53.LogInTeacherBloc(gh<_i47.LogInTeacherUseCase>()));
    gh.lazySingleton<_i54.NotificationsUseCase>(() => _i54.NotificationsUseCase(
        notificationDomain: gh<_i29.NotificationRepoDomain>()));
    gh.factory<_i55.NotificationsBloc>(
        () => _i55.NotificationsBloc(gh<_i54.NotificationsUseCase>()));
    gh.factory<_i56.LogInStudentBloc>(
        () => _i56.LogInStudentBloc(gh<_i27.LogInStudentUseCase>()));
    gh.factory<_i57.TeacherActivateBloc>(() => _i57.TeacherActivateBloc(
        teacherActivateUseCase: gh<_i49.TeacherActivateUseCase>()));
    gh.factory<_i58.StudentProfileBloc>(() => _i58.StudentProfileBloc(
          gh<_i35.StudentProfileUseCase>(),
          gh<_i35.StudentSubjectsUseCase>(),
          gh<_i36.GetStudentProfileUseCase>(),
        ));
    gh.lazySingleton<_i59.TopTeachersUseCase>(() => _i59.TopTeachersUseCase(
        topTeacherRepository: gh<_i40.TopTeacherRepository>()));
    gh.lazySingleton<_i59.TopTeachersByIdUseCase>(() =>
        _i59.TopTeachersByIdUseCase(
            topTeacherRepository: gh<_i40.TopTeacherRepository>()));
    gh.factory<_i60.GetTeacherProfileBloc>(
        () => _i60.GetTeacherProfileBloc(gh<_i52.TeacherProfileUseCase>()));
    gh.factory<_i61.SignUpTeacherBloc>(
        () => _i61.SignUpTeacherBloc(gh<_i48.SignUpTeacherUseCase>()));
    gh.factory<_i62.SignUpStudentBloc>(
        () => _i62.SignUpStudentBloc(gh<_i39.SignUpStudentUseCase>()));
    gh.factory<_i63.TopTeachersBloc>(() => _i63.TopTeachersBloc(
          gh<_i59.TopTeachersUseCase>(),
          gh<_i59.TopTeachersByIdUseCase>(),
        ));
    gh.lazySingleton<_i50.FilterTeacherUseCase>(() => _i50.FilterTeacherUseCase(
        searchRepository: gh<_i31.SearchAndFilterRepository>()));
    gh.lazySingleton<_i64.LocationSearchUseCase>(() =>
        _i64.LocationSearchUseCase(
            searchRepository: gh<_i31.SearchAndFilterRepository>()));
    gh.lazySingleton<_i65.SearchUseCase>(() => _i65.SearchUseCase(
        searchRepository: gh<_i31.SearchAndFilterRepository>()));
    gh.factory<_i66.SecondCompleteProfileBloc>(
        () => _i66.SecondCompleteProfileBloc(
              gh<_i42.SecondRegisterUseCase>(),
              gh<_i44.GetCompleteProfileUseCase>(),
            ));
    gh.factory<_i67.LocationBloc>(
        () => _i67.LocationBloc(gh<_i46.LocationUseCase>()));
    gh.factory<_i68.TakeTeacherNumberBloc>(
        () => _i68.TakeTeacherNumberBloc(gh<_i37.TakeTeacherNumberUseCase>()));
    gh.factory<_i69.GetTeacherProfileBeforeCompleteBloc>(() =>
        _i69.GetTeacherProfileBeforeCompleteBloc(
            gh<_i45.GetTeacherProfileBeforeCompleteUseCase>()));
    gh.factory<_i70.CompleteTeacherProfile1Bloc>(() =>
        _i70.CompleteTeacherProfile1Bloc(
            gh<_i43.CompleteTeacherProfileUseCase1>()));
    gh.factory<_i71.SearchAndFilterBloc>(() => _i71.SearchAndFilterBloc(
          gh<_i50.FilterTeacherUseCase>(),
          gh<_i65.SearchUseCase>(),
          gh<_i50.GetFilterUseCase>(),
          gh<_i64.LocationSearchUseCase>(),
        ));
    return this;
  }
}

class _$AppModule extends _i72.AppModule {}
