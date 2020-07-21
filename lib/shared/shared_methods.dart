part of 'shared.dart';

Future<File> getImage() async {
  final _picker = ImagePicker();
  final pickedImage = await _picker.getImage(source: ImageSource.gallery);
  final File image = File(pickedImage.path);
  return image;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask task = ref.putFile(image);
  StorageTaskSnapshot snapshot = await task.onComplete;

  return await snapshot.ref.getDownloadURL();
}

formatDate(DateTime date) {
  String formatedDate = DateFormat("dd-MM-yyyy").format(date);
  return formatedDate;
}

formatMonth(DateTime date) {
  String formatedMonth = DateFormat("MM-yyyy").format(date);
  return formatedMonth;
}

formatNumber(var number) {
  String formatedNumber =
      NumberFormat.currency(symbol: "", decimalDigits: 0).format(number);
  return formatedNumber;
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
