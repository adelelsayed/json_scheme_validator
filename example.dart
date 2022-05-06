import 'package:json_scheme_validator/JsonValidatorByScheme.dart';
Map<String, List<dynamic>> scheme={
          "resourceType": ["String", true],
          "id": ["String", true],
          "meta": ["_InternalLinkedHashMap<String, dynamic>", false],
          "link": ["List<dynamic>", false],
          "entry": ["List<dynamic>", true]
        };

Map<String, dynamic> target={
    "resourceType":"json record", "id":"1", "entry":[{"salute":"Hello world!"}]
};

JsonValidatorByScheme ValidationObj =
          JsonValidatorByScheme(scheme, target);

print(ValidationObj.isValid().toString());