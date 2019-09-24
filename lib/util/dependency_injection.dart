import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/data/articles/articles_data_mock.dart';
import 'package:your_doctor/data/articles/articles_data_prod.dart';
import 'package:your_doctor/data/chat/get_meeasge_data_mock.dart';
import 'package:your_doctor/data/chat/get_messages_data_prod.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/data/chat/send_message_data_prod.dart';
import 'package:your_doctor/data/doctors/all_doctors_data_mock.dart';
import 'package:your_doctor/data/doctors/all_doctors_data_prod.dart';
import 'package:your_doctor/data/doctors/doctor_details_data_mock.dart';
import 'package:your_doctor/data/doctors/doctors_data.dart';
import 'package:your_doctor/data/doctors/selected_doctor_data_mock.dart';
import 'package:your_doctor/data/user/login_data_prod.dart';
import 'package:your_doctor/data/user/register_data_prod.dart';
import 'package:your_doctor/data/user/user_data.dart';

enum Flavor { MOCK, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

//TODO========|==Get All Wanted Data From Repositories Classes===|==============
//TODO        v                                                  v

////////////////////////////////////////////////////////////////////////////////
  LogInUserRepository get logInRepository {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new ProdLogInRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }

////////////////////////////////////////////////////////////////////////////////
  RegisterUserRepository get regisetrRepository {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new ProdRegisterRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }


///////////////Articles Data////////////////////////////////////////////////////
  ArticlesRepository get articlesRepository {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return ProductionArticlesRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }

  ///////////////All Doctors Data////////////////////////////////////////////////////
  DoctorsRepository get doctorsRepository {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new ProdDoctorRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }

  ///////////////All Doctors Data////////////////////////////////////////////////////
  SelctedDoctorsRepository get selcteddoctorsRepository {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new MockSelctedDoctorsRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }

  ///////////////All Doctors Data////////////////////////////////////////////////////
  DoctorDetailRepository get doctorDetailsRepository {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new MockDoctorDetailsRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }

  ///////////////All Doctors Data////////////////////////////////////////////////////
  SendingMessageRepository get senMessageRepsitory {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new MockSendMessageRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }

  ///////////////All Doctors Data////////////////////////////////////////////////////
  GetMessagesRepository get getMessages {
    // switch (_flavor) {
    //  case Flavor.MOCK:
    return new ProdMessagesRepository();
    // default:
    // return new ProdCategoriesRepository();
    // }
  }
}
