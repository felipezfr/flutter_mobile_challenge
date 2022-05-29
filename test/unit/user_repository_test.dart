import 'dart:convert';

import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository_imp.dart';
import 'package:flutter_mobile_challenge/services/dio_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class UsersRepositoryMock extends Mock implements IUsersRepository {}

void main() {
  test("deve retornar os usuarios", () async {
    final _repository = UsersRepositoryMock();

    final users = Users.fromJson(jsonDecode(json));

    when(() => _repository.getUsers()).thenAnswer(
      (_) => Future.value(users),
    );

    var result = await _repository.getUsers();

    expect(result, isA<Users>());
    expect(result.results.first.gender, "female");
    expect(result.results.first.email, "hailey.wong@example.com");
    expect(result.results.last.gender, "female");
    expect(result.results.last.email, "ayse.berberoglu@example.com");
  });
}

const json = ''' 
{
    "results": [
        {
            "gender": "female",
            "name": {
                "title": "Miss",
                "first": "Hailey",
                "last": "Wong"
            },
            "location": {
                "street": {
                    "number": 4715,
                    "name": "Regent Ave"
                },
                "city": "Field",
                "state": "New Brunswick",
                "country": "Canada",
                "postcode": "V2Q 2T4",
                "coordinates": {
                    "latitude": "-63.0011",
                    "longitude": "175.4146"
                },
                "timezone": {
                    "offset": "+3:30",
                    "description": "Tehran"
                }
            },
            "email": "hailey.wong@example.com",
            "login": {
                "uuid": "7f397c54-f634-4a80-9473-d7d71ed64149",
                "username": "brownsnake530",
                "password": "hotboy",
                "salt": "zlsNHb1r",
                "md5": "53a404689780471c1ee0961d7cfe4b16",
                "sha1": "854e82061235493234fd11167a4c382331154868",
                "sha256": "3042eea16074b1c7bf5e58f6dd67f531ff6e080e67123f033b0edbefae187c7c"
            },
            "dob": {
                "date": "1991-04-07T22:04:47.142Z",
                "age": 31
            },
            "registered": {
                "date": "2010-10-14T23:52:08.809Z",
                "age": 12
            },
            "phone": "984-312-6413",
            "cell": "606-435-4240",
            "id": {
                "name": "",
                "value": null
            },
            "picture": {
                "large": "https://randomuser.me/api/portraits/women/6.jpg",
                "medium": "https://randomuser.me/api/portraits/med/women/6.jpg",
                "thumbnail": "https://randomuser.me/api/portraits/thumb/women/6.jpg"
            },
            "nat": "CA"
        },
        {
            "gender": "female",
            "name": {
                "title": "Mrs",
                "first": "Ayşe",
                "last": "Berberoğlu"
            },
            "location": {
                "street": {
                    "number": 6869,
                    "name": "Maçka Cd"
                },
                "city": "Karabük",
                "state": "Ordu",
                "country": "Turkey",
                "postcode": 93969,
                "coordinates": {
                    "latitude": "-15.9333",
                    "longitude": "-121.0156"
                },
                "timezone": {
                    "offset": "-10:00",
                    "description": "Hawaii"
                }
            },
            "email": "ayse.berberoglu@example.com",
            "login": {
                "uuid": "5b0a7596-370d-44a4-87ed-0351abfaedef",
                "username": "silvergorilla938",
                "password": "stunner",
                "salt": "Z39PaexL",
                "md5": "f46652ea6c3004970df5152cd055d7e7",
                "sha1": "08395aa7b2b19ea9e580ffacd32a3583c7e4c98e",
                "sha256": "d42021046830973f99c48c7675b2ab6b5cc09117b498ba701e65341d5fd50f3a"
            },
            "dob": {
                "date": "1991-06-14T21:45:09.140Z",
                "age": 31
            },
            "registered": {
                "date": "2009-02-18T08:56:18.194Z",
                "age": 13
            },
            "phone": "(211)-076-5964",
            "cell": "(687)-516-4648",
            "id": {
                "name": "",
                "value": null
            },
            "picture": {
                "large": "https://randomuser.me/api/portraits/women/89.jpg",
                "medium": "https://randomuser.me/api/portraits/med/women/89.jpg",
                "thumbnail": "https://randomuser.me/api/portraits/thumb/women/89.jpg"
            },
            "nat": "TR"
        }
    ],
    "info": {
        "seed": "1e54a61698b0059f",
        "results": 2,
        "page": 1,
        "version": "1.3"
    }
}
''';
