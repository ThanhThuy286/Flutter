class Story {
  // Khai báo các thuộc tính dưới dạng `final` để đảm bảo giá trị không bị thay đổi sau khi khởi tạo
  final String storyTitle;
  final String choice1;
  final String choice2;

  // Constructor với required parameters để đảm bảo các giá trị bắt buộc được cung cấp khi khởi tạo
  Story({
    required this.storyTitle,
    required this.choice1,
    required this.choice2,
  });
}
