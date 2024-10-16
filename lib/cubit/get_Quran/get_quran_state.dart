
abstract class GetQuranState {}

 class GetQuranInitial extends GetQuranState {}
 class QuranLoadingStates extends GetQuranState{}
class QuranGetSuccessDataStates extends GetQuranState{}
class QuranGetErrorDataStates extends GetQuranState{
  late final String error;
  QuranGetErrorDataStates(this.error);
}
class GetAdhanTimeLoadingStates extends GetQuranState{}
class GetAdhanTimeSuccessDataStates extends GetQuranState{}
class GetAdhanTimeErrorDataStates extends GetQuranState{
  late final String error;
  GetAdhanTimeErrorDataStates(this.error);
}

 class VersesLoadingStates extends GetQuranState{}
class VersesGetSuccessDataStates extends GetQuranState{}
class VersesGetErrorDataStates extends GetQuranState{
  late final String error;
  VersesGetErrorDataStates(this.error);
}
class ChangeIconStates extends GetQuranState{}

