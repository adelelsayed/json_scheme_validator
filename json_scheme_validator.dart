class JsonValidatorByScheme {
  //class is instantiated via calling constructor passing in scheme of json record and json record
  Map<String, List<dynamic>> scheme = {};
  Map<String, dynamic> targetJSON = {};
  List<String> ErrorFlags = [];

  JsonValidatorByScheme(
      Map<String, List<dynamic>> pscheme, Map<String, dynamic> ptarget) {
    this.scheme = pscheme;
    this.targetJSON = ptarget;
  }

  bool isValid() {
    //isvalid method returns a bool of whether json record is valid to scheme or not and appends any deviations from scheme to ErrorFlags List
    bool retVal = true;

    for (var key in this.scheme.keys) {
      List<dynamic>? currentValue = this.scheme[key];
      //checking existing keys, required keys and data types
      if (this.targetJSON.keys.contains(key) &&
          (this.targetJSON[key].runtimeType.toString() != currentValue?[0])) {
        retVal = false;
        this.ErrorFlags.add(
            "${key} has a different data type of: ${this.targetJSON[key].runtimeType.toString()} while expected is ${currentValue?[0]}");
        break;
      } else if (!this.targetJSON.keys.contains(key) && currentValue?[1]) {
        retVal = false;
        this.ErrorFlags.add("${key} is required but not existing");
        break;
      }
      //checking mandatory values
      if (retVal &&
          (currentValue!.length > 2) &&
          !currentValue[2].contains(this.targetJSON[key])) {
        retVal = false;

        this
            .ErrorFlags
            .add("${key} exists but have different value than the required");
        break;
      }
    }

    return retVal;
  }
}
