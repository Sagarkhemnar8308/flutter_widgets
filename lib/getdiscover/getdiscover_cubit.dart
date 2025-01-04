import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_widget/getdiscover/getdiscover_model.dart';
import 'package:http/http.dart';

part 'getdiscover_state.dart';

class GetDiscoverCubit extends Cubit<GetDiscoverState> {
  GetDiscoverCubit() : super(GetDiscoverInitial());

  getDiscover({
    String? gender,
    double? minAge,
    double? maxAge,
    double? maxDistance,
  }) async {
    String targetGender = gender ?? '';
    String ageMin = minAge?.toString() ?? '';
    String ageMax = maxAge?.toString() ?? '';
    String distanceMax = maxDistance?.toString() ?? '';
    try {
      emit(GetDiscoverLoading());
      log("message gender $gender min age  $minAge  max age $maxAge max distance $maxDistance");
      String url =
          "https://api.srd.buzz/api/discover/getuserdiscover/99?filter=&targetGender=$targetGender&minAge=$ageMin&maxAge=$ageMax&maxDistance=$distanceMax";
      log("URL with parameters: $url");
      log("URl is => => => => ${url}");
      var response = await get(Uri.parse(url), headers: {
        "Authorization":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OTksImlhdCI6MTczNDc0MzY0NiwiZXhwIjoxNzM1NjQzNjQ2fQ.ZtPIquPp1slcxNj5mpb3Yg-Ltq_EiUaS8O_rBCD9IuY"
      });
      log("message me $url ${response.statusCode} ");
      final result = jsonDecode(response.body.toString());
      log("message Result : $result");
      if (response.statusCode == 200) {
        var encode = jsonEncode(result);
        log("message is ${result.runtimeType}  ${encode.runtimeType} ${url}");
        emit(
          GetDiscoverLoaded(
            getDiscoverModelFromJson(
              encode,
            ),
          ),
        );
      } else {
        emit(GetDiscoverError(result["message"]));
      }
    } catch (e, s) {
      print("catch error $e, $s");
      emit(
        GetDiscoverError("$e"),
      );
    }
  }
}
