import 'package:checkshopsonline/shop_admin/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../conf.dart';
abstract class AuthEvents{}
class AuthLoginEvent extends AuthEvents{
 final  String email;
 final String password;
  AuthLoginEvent({this.email,this.password});
}
class AuthRegisterEvent extends AuthEvents{
  dynamic formData;
  AuthRegisterEvent(this.formData);
}
class InitializeAuth extends AuthEvents{}
class AuthLogoutEvent extends AuthEvents{}

abstract class AuthState{}
class AuthNotLoggedInState extends AuthState{}
class AuthLoggedInState extends AuthState{
  final User user;
  AuthLoggedInState({this.user});
}
class AuthRegisterCompletedState extends AuthState{}
class AuthFailedState extends AuthState{
  final String message;
  AuthFailedState({this.message});
}
class AuthTryingState extends AuthState{}
class AuthBloc extends Bloc<AuthEvents,AuthState>{
  User user;
  FlutterSecureStorage storage=FlutterSecureStorage();
  @override
  AuthState get initialState => AuthNotLoggedInState();
  @override
  Stream<AuthState> mapEventToState(AuthEvents event)async* {
    if(event is InitializeAuth){
       //fetch user from db
      
      var email=await storage.read(key: "email");
      if(email==null){
        AuthNotLoggedInState();
      }
      else{
        user=User();
        user.email=email;
        user.token=await storage.read(key: "token");
        yield AuthLoggedInState(user: user);
      }
     
    }
    else if(event is AuthLogoutEvent){
      yield AuthNotLoggedInState();
      try{
      await storage.delete(key: "email");
      await storage.delete(key: "token");
      }
      catch(e){
      
      }

    }
    else if(event is AuthLoginEvent){
        yield AuthTryingState();
        //send http request for login
          Dio dio = Dio(BaseOptions(headers: {
          "apikey": apiKey,
        }, validateStatus: (status) => true, baseUrl: baseUrl));
        //make http request to server
        try {
          var response = await dio.post("account/login",data: {"email":event.email,"password":event.password});
          if (response.statusCode == 200) {
             FlutterSecureStorage storage=FlutterSecureStorage();
             user=User();
             user.token=response.data['token'];
             user.email=event.email;
             yield AuthLoggedInState(user: user);
             await storage.write(key: "email", value: event.email);
             await storage.write(key: "token", value: user.token);
            //  user.name=event.password;
          } else if(response.statusCode==401) {
            yield AuthFailedState(message:response.data['message']);
            //yield ProductLoadingErrorState();
          }
          else{
            yield AuthFailedState(message:"Server Error");


          }
        } catch (e) {
          yield AuthFailedState(message:"Internet Error");

        }

    }
  if(event is AuthRegisterEvent){
    //send http request to serer for registeration;
     yield AuthTryingState();
        //send http request for register
          Dio dio = Dio(BaseOptions(headers: {
          "apikey": apiKey,
        }, validateStatus: (status) => true, baseUrl: baseUrl));
        //make http request to server
        try {
          var response = await dio.post("shop/",data:event.formData);
          if (response.statusCode == 200) {
             yield AuthRegisterCompletedState();
          } else if(response.statusCode==409) {
            yield AuthFailedState(message:response.data['message']);
            //yield ProductLoadingErrorState();
          }
          else{
            yield AuthFailedState(message:"Server Error");


          }
        } catch (e) {
          yield AuthFailedState(message:"Internet Error");

        }
  }

  }
  
}
