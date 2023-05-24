validInput(val, min, max) {
  if (val.isEmpty) {
    return "Value can't be empty";
  }
  if (val.length < min) {
    return "Can't be less than $min";
  }
  if (val.length > max) {
    return "Can't be greater than $max";
  }
}
