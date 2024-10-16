
abstract class GetAdhanTimeState {}

 class GetQuranInitial extends GetAdhanTimeState {}
 
class GetAdhanTimeLoadingStates extends GetAdhanTimeState{}
class GetAdhanTimeSuccessDataStates extends GetAdhanTimeState{}
class GetAdhanTimeErrorDataStates extends GetAdhanTimeState{
  late final String error;
  GetAdhanTimeErrorDataStates(this.error);
}

 
