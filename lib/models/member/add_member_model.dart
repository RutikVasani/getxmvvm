class AddMember {
  String profilePhoto;
  String name;
  String mobileNo;
  String reason;
  DateTime joiningDate;
  String plan;
  DateTime endDate;
  String totalPayment;
  String pay;
  String batchTime;
  String level;

  AddMember(
      this.profilePhoto,
      this.name,
      this.mobileNo,
      this.reason,
      this.joiningDate,
      this.plan,
      this.endDate,
      this.totalPayment,
      this.pay,
      this.batchTime,
      this.level);

  // Map<String, dynamic> toJson() => {
  //       "profile photo": profilePhoto,
  //       "name": name,
  //       "mobile no": mobileNo,
  //       "reason": reason,
  //       // "joinging date": joingingDate,
  //       "plan": plan,
  //       // "end date": endDate,
  //       "total payment": totalPayment,
  //       "pay": pay,
  //       "batch time": batchTime,
  //       "level": level,
  //     };

  // static AddMember fromSnap(DocumentSnapshot snap) {
  //   var data = snap.data() as Map<String, dynamic>;
  //   return AddMember(
  //       profilePhoto: data['profile photo'],
  //       name: data['name'],
  //       mobileNo: data['mobile no'],
  //       reason: data['reason'],
  //       // joingingDate: data['joinging date'],
  //       plan: data['plan'],
  //       // endDate: data['end date'],
  //       totalPayment: data['total payment'],
  //       pay: data['pay'],
  //       batchTime: data['batch time'],
  //       level: data['level']);
  // }
}
