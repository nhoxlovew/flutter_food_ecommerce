class UnboardingContent {
  String image;
  String title;
  String description;
  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description:
          'Dành thời gian khám phá và lựa chọn những món ăn yêu thích từ thực đơn phong phú của chúng tôi.Với vô vàn lựa chọn hấp dẫn trên thực đơn, bạn sẽ dễ dàng tìm thấy món ăn ưng ý.',
      image: "images/screen1.png",
      title: 'Lựa chọn những điều tốt nhất '),
  UnboardingContent(
      description:
          'Bạn có thể trả bằng tiền mặt và\n     Trả bằng thẻ tín dụng 1 cách tiện lợi',
      image: "images/screen2.png",
      title: 'Giao dịch online tiện lợi\n           và dễ dàng'),
  UnboardingContent(
      description: 'Deliver your food at your\n               Doorstep',
      image: "images/screen3.png",
      title: 'Giao đồ nhanh\n    Đến tận cửa')
];
