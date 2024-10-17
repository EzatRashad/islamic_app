import 'package:api_islamic/models/SoundModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/quran_api.dart';
import '../../data/surah_api.dart';
import '../../models/quran_model.dart';
import '../../models/suraModel.dart';
import 'get_quran_state.dart';

class GetQuranCubit extends Cubit<GetQuranState> {
  GetQuranCubit() : super(GetQuranInitial());

  static GetQuranCubit get(context) => BlocProvider.of(context);

  ChapterModel? cm;

  // Fetch chapter data
  void getChapterData() async {
    emit(QuranLoadingStates());
    await DioHelper.getData(
      url: 'chapters',
      query: {
        'language': 'ar',
      },
    ).then((value) {
      cm = ChapterModel.fromJson(value.data);
      emit(QuranGetSuccessDataStates());
    }).catchError((error) {
      print("ErrorChapter is : $error");
      emit(QuranGetErrorDataStates(error.toString()));
    });
  }

  SurahModel? surahModel;

  // Fetch Surah data
  getSurahData({required String translationKey, required int chapterId , var lang}) async {
    emit(VersesLoadingStates());

    try {
      var value = await SurahDioHelper.getData(
        translationKey: translationKey,
        suraNumber: chapterId, language: lang.toString(),
      );
      surahModel = SurahModel.fromJson(value.data);

      print("Fetching Quran Data...");
      await fetchQuranData(chapterId.toString());

      // Only print audio URLs if the list is not empty
      if (audioUrls.isNotEmpty) {
        print("First audio URL: ${audioUrls[0]}");
      } else {
        print("No audio URLs found for this Surah.");
      }

      emit(VersesGetSuccessDataStates());
    } catch (error) {
      print("Error fetching Surah data: $error");
      emit(VersesGetErrorDataStates(error.toString()));
    }
  }

  SoundModel? soundModel;
  List<String> audioUrls = [];

  // Fetch Quran audio data
  fetchQuranData(String id) async {
    try {
      audioUrls = [];
      var response =
          await Dio().get('http://api.alquran.cloud/v1/surah/$id/ar.alafasy');
      soundModel = SoundModel.fromJson(response.data);

      // Collect all audio URLs from the fetched data
      if (soundModel?.data?.ayahs != null) {
        for (var ayah in soundModel!.data!.ayahs!) {
          if (ayah.audio != null) {
            audioUrls.add(ayah.audio!);
          }
        }
      } else {
        print("No ayahs data found in the response.");
      }
    } catch (error) {
      print("Error fetching Quran data: $error");
    }
  }

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  Future<void> playOneAudio(String url) async {
    if (isPlaying) {
      await _audioPlayer.stop();
      isPlaying = false;
    }

    try {
      await _audioPlayer.setUrl(url);
      await _audioPlayer.play();
      isPlaying = true;
      emit(ChangeIconStates()); // Update UI to reflect play state
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  bool isSurahPlaying = false;


  Future<void> playSurahAudio(List<String> urls) async {
    if (isSurahPlaying) {
      await _audioPlayer.stop();
      isSurahPlaying = false;
    }

    try {

      emit(ChangeIconStates());
    } catch (e) {
      print("Error playing audio: $e");
      isSurahPlaying = false;
    }
  }


  }



