import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:get/get.dart';
import '../Constant/Toast/fllutter_toast.dart';
import '../RoutesAndBindings/app_routes.dart';
import '../Utils/Storage/get_storage_handler.dart';
import '../Utils/alert_box_custom.dart';
import '../Utils/check_connectivity.dart';
import '../Utils/toast_message.dart';
import 'Server/server_error.dart';

class API {
  CheckConnectivityServices connectivityServices = CheckConnectivityServices();
  Future getRequest(
    String apiurl,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();
      var response = await dio
          .get(
        apiurl,
        options: DIO.Options(
            receiveTimeout: Duration(milliseconds: 30000),
            headers: {
              'accept': '*/*',
            }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        // if (onError is DioError) {
        //     toast(msg:"No internet connection!");
        //   }

        debugPrint("GET Error: ${onError.toString()}");
      });

      return response;
    } catch (error) {
      if (error is SocketException) {
        toast(msg:"No internet connection!");
      } else {
        if (error is DIO.DioError) {
          if (ServerError.withError(error: error).getErrorCode() == 401) {
            onSessionExpirePopUp();
          } else {
            toast(msg:ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
          }
        }
      }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future getRequestHeader(String apiurl) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      print("apiurl $apiurl");
      var dio = DIO.Dio();
      var response = await dio
          .get(
        apiurl,
        options: DIO.Options(headers: {
          'accept': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        debugPrint("GET Error: ${onError.toString()}");
        if (onError.toString().contains("401")) {
          onSessionExpirePopUp();
          GetStorageHandler().removeCache();
          Get.offAllNamed(AppRoutes.loginView);
        }
      });
      return response;
    } catch (error) {
      if (error is SocketException) {
        toast(msg:"No internet connection!");
      } else {
        if (error is DIO.DioError) {
          print("--------Print--------");
          print(ServerError.withError(error: error).getErrorCode());

          if (ServerError.withError(error: error).getErrorCode() == 401) {
            onSessionExpirePopUp();
          } else {
            toast(msg:ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
          }
        }
      }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future getRequestHeaderData(String apiurl, data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      print("apiurl $apiurl");
      var dio = DIO.Dio();
      var response = await dio
          .get(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'accept': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
      )
          .whenComplete(() {
        debugPrint("Getting Process is Complete:");
      }).catchError((onError) {
        debugPrint("GET Error: ${onError.toString()}");
      });

      return response;
    } catch (error) {
      if (error is SocketException) {
        toast(msg:"No internet connection!");
      } else {
        if (error is DIO.DioError) {
          print(ServerError.withError(error: error).getErrorCode());

          if (ServerError.withError(error: error).getErrorCode() == 401) {
            onSessionExpirePopUp();
          } else {
            toast(msg:ServerError.withError(error: error)
                .getErrorMessage()
                .toString());
          }
        }
      }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future postRequest(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();
      print(apiurl);
      var response = await dio.post(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type': 'application/json',
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      
      }).catchError((onError) {
        if (ServerError.withError(error: onError).getErrorCode() == 500) {
          toast(msg:"SomeThing Went Wrong");
        }
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(msg:"No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              onSessionExpirePopUp();
            } else {
              toast(msg:
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   toast(msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       onSessionExpirePopUp();
      //     } else {
      //       print("error$error");
      //       toast(msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future postRequestHeader(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      var dio = DIO.Dio();

      var response = await dio.post(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'accept': '*/*',
          'Content-type': 'multipart/form-data',
          "Authorization": "Bearer ${token.toString()}",
        }, responseType: DIO.ResponseType.plain),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(msg:"No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              onSessionExpirePopUp();
            } else {
              toast(msg:
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   toast(msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       onSessionExpirePopUp();
      //     } else {
      //       toast(msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future postRequestHeaderWithoutBody(
    String apiurl,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      print(apiurl);
      String token = GetStorageHandler().getToken();
      var dio = DIO.Dio();

      var response = await dio.post(
        apiurl,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(msg:"No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              onSessionExpirePopUp();
            } else {
              toast(msg:
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   toast(msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       onSessionExpirePopUp();
      //     } else {
      //       toast(msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future patchRequestHeader(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      var dio = DIO.Dio();

      var response = await dio.patch(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Accept': '*/*',
          'Content-type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(msg:"No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              onSessionExpirePopUp();
            } else {
              toast(msg:
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   toast(msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       onSessionExpirePopUp();
      //     } else {
      //       toast(msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future putRequest(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      var dio = DIO.Dio();

      var response = await dio.put(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          // if (firebaseToken != "")
          //   "Authorization": "Firebase ${firebaseToken.toString()}",
          // if (firebaseToken == "")
          //   "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(msg:"No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              onSessionExpirePopUp();
            } else {
              toast(msg:
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   toast(msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       onSessionExpirePopUp();
      //     } else {
      //       toast(msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future putRequestHeader(String apiurl, var data) async {
    // if (await connectivityServices.onConnectivity()) {
    try {
      String token = GetStorageHandler().getToken();
      var dio = DIO.Dio();

      var response = await dio.put(
        apiurl,
        data: data,
        options: DIO.Options(headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:" + token);
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(msg:"No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              onSessionExpirePopUp();
            } else {
              toast(msg:
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });

      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   toast(msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       onSessionExpirePopUp();
      //     } else {
      //       toast(msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future profileUpdateMultiPart(
    String apiurl,
    var data,
  ) async {
    // if (await connectivityServices.onConnectivity()) {
    var token = await GetStorageHandler().getToken();
    DIO.FormData formData;

    String fileName = await data["image"].split('/').last;
    print("fileName $fileName");
    formData = DIO.FormData.fromMap({
      "image": await DIO.MultipartFile.fromFile(File(data["image"]).path,
          filename: fileName),
      "name": data["name"],
      "email": data["email"],
    });
    print("formData ${formData.fields}");

    // try {
    var dio = DIO.Dio();
    var response = await dio.put(
      apiurl,
      data: formData,
      options: DIO.Options(
          receiveTimeout: Duration(milliseconds: 3000000),
          headers: {
            "Accept": 'application/json',
            'Content-Type': 'multipart/form-data',
            "Authorization": "Bearer ${token.toString()}",
          }),
      onSendProgress: (int sent, int total) {
        debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
      },
    ).whenComplete(() {
      debugPrint("POST Complete:");
    }).catchError((onError) {
      debugPrint("POST Error: $onError");
      if (onError is SocketException) {
        toast(msg:"No internet connection!");
      } else {
        if (onError is DIO.DioError) {
          if (ServerError.withError(error: onError).getErrorCode() == 401) {
            onSessionExpirePopUp();
          } else {
            toast(msg:ServerError.withError(error: onError)
                .getErrorMessage()
                .toString());
          }
        }
      }
    });
    print("jhhjjhjhjh");
    print(response);

    return response;
    // } catch (error) {
    //   print("jjijijiji");
    //   print(error);
    //   // if (error is SocketException) {
    //   //   toast(msg:"No internet connection!");
    //   // } else {
    //   //   if (error is DIO.DioError) {
    //   //     if (ServerError.withError(error: error).getErrorCode() == 401) {
    //   //       onSessionExpirePopUp();
    //   //     } else {
    //   //       toast(msg:ServerError.withError(error: error)
    //   //           .getErrorMessage()
    //   //           .toString());
    //   //     }
    //   //   }
    //   // }
    // }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  Future postMultiPart(
    String apiurl,
    var data,
  ) async {
    print(data);
    // if (await connectivityServices.onConnectivity()) {
    var token = await GetStorageHandler().getToken();
    DIO.FormData formData;
    if (data["image"] == null) {
      formData = DIO.FormData.fromMap(
          {"description": data["description"], "_method": "POST"});
      print("formData ${formData.fields}");
    } else {
      String fileName = await data["image"].split('/').last;
      print("fileName $fileName");
      formData = DIO.FormData.fromMap({
        "image":
            await DIO.MultipartFile.fromFile(data["image"], filename: fileName),
        "description": data["description"],
        "_method": "POST"
      });
      print("formData ${formData.fields}");
    }

    try {
      var dio = DIO.Dio();
      var response = await dio.post(
        apiurl,
        data: formData,
        options: DIO.Options(headers: {
          "Accept": 'application/json',
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token.toString()}",
        }),
        onSendProgress: (int sent, int total) {
          debugPrint("total ${total.toString()} " "   sent ${sent.toString()}");
        },
      ).whenComplete(() {
        debugPrint("POST Complete:");
      }).catchError((onError) {
        debugPrint("POST Error: $onError");
        if (onError is SocketException) {
          toast(msg:"No internet connection!");
        } else {
          if (onError is DIO.DioError) {
            if (ServerError.withError(error: onError).getErrorCode() == 401) {
              onSessionExpirePopUp();
            } else {
              toast(msg:
                  ServerError.withError(error: onError)
                      .getErrorMessage()
                      .toString());
            }
          }
        }
      });
      return response;
    } catch (error) {
      // if (error is SocketException) {
      //   toast(msg:"No internet connection!");
      // } else {
      //   if (error is DIO.DioError) {
      //     if (ServerError.withError(error: error).getErrorCode() == 401) {
      //       onSessionExpirePopUp();
      //     } else {
      //       toast(msg:ServerError.withError(error: error)
      //           .getErrorMessage()
      //           .toString());
      //     }
      //   }
      // }
    }
    // } else {
    //   toast(msg:"No internet connection, try later");
    // }
  }

  deleteRequest({
    required String apiUrl,
  }) async {
    try {
      var appToken = GetStorageHandler().getToken();
      print(appToken);
      print(apiUrl);
      if (appToken != null) {
        var token = appToken;
        var dio = DIO.Dio();
        final response = await dio
            .delete(
          apiUrl,
          options: DIO.Options(
              receiveTimeout: Duration(milliseconds: 30000),
              headers: {
                "Accept": 'application/json',
                'Content-Type': 'application/json',
                "Authorization": "Bearer ${token.toString()}",
              }),
        )
            .whenComplete(() {
          debugPrint("POST Complete:");
        }).catchError((onError) {
          debugPrint("POST Error: $onError");
          if (onError is SocketException) {
            toast(msg:"No internet connection!");
          } else {
            if (onError is DIO.DioError) {
              if (ServerError.withError(error: onError).getErrorCode() == 401) {
                onSessionExpirePopUp();
              } else {
                toast(msg:
                    ServerError.withError(error: onError)
                        .getErrorMessage()
                        .toString());
              }
            }
          }
        });
        return response;
      }

      //Connection timed out
    } on SocketException {
      toast(msg:
        "No Internet Connection",
      );
      print('No Internet connection 😑');
      return null;
    }
  }
}
