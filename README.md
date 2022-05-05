json_scheme_validator

the package consists of a single class JsonValidatorByScheme. aims to enables developer to validate
a json record against a scheme.

example:

json scheme :

element name : list [data type, field mandatory or not]

{
          "resourceType": ["String", true],
          "id": ["String", true],
          "meta": ["_InternalLinkedHashMap<String, dynamic>", false],
          "link": ["List<dynamic>", false],
          "entry": ["List<dynamic>", true]
        }

instantiate the class JsonValidatorByScheme passing to constructor the data target as well as the shceme.

JsonValidatorByScheme ValidationObj =
          JsonValidatorByScheme(scheme, data);

call the isValid method on the instance, which returns a bool indicating if json is valid or not

bool isValid=ValidationObj.isValid();

