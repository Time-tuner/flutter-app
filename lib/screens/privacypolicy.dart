import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);


  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  bool _isObscure = true;

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: const Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0092ac),
      body: Stack(
        children: [
          Positioned(
            top:-30,
            left: 260,
            child: Image.asset(
              'images/cloud2.png',
              width: 300,
            ),
          ),
          Positioned(
            top: 730,
            left: -50,
            child: Image.asset(
              'images/cloud2.png',
              width: 300,
            ),
          ),
          Positioned(
            top: 500,
            left: 230,
            child: Image.asset(
              'images/cloud2.png',
              width: 300,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 80),
              Container(
                alignment: Alignment.center,
              ),
              SizedBox(height: 50),
              Container(
                width: 400,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xff0092ac),
                    width: 2
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    Container(
                      alignment: Alignment.topLeft,
                      width: 350,
                      child: TextButton(
                        child: Text("＜戻る",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {  },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: 340,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xff0092ac),
                            width: 2
                          )
                        )
                      ),
                      padding: EdgeInsets.only(left: 20),
                      child: Text("プライバシーポリシー",
                          style: TextStyle(fontSize: 25),
                        ),
                    ),
                    SizedBox(height: 40,),

                    Expanded(
                      child: ListView(
                        children: [
                          Container(
                            width: 320,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    width: 320,
                                    child: Column(
                                      children: [
                                        Text('''情報総合学科卒業研究３Ｂ６班（以下「当班」という。）は、個人情報について以下の通りプライバシーポリシー（以下、「本ポリシー」という。）を定めます。本ポリシーは、当班がどのような個人情報を取得し、どのように利用・共有するか、ユーザーがどのようにご自身の個人情報を管理できるかをご説明するものです。
                                        
  1. 製作者情報登録名：情報総合学科卒業研究
     3B６班住所：愛知県名古屋市熱田区神宮4
     丁目７－２１代表者：渡辺　明佳音
                                          
  2. 個人情報の取得方法当アプリは、ユーザー
     が利用登録するとき、電話番号・メールア
     ドレスなどの個人を特定できる情報を取得
     させていただきます。お問い合わせフォー
     ムの送信時には、ユーザー名・電話番号・
     メールアドレスを取得させていただきます。

  3. 個人情報の利用目的・ユーザーからのお問
     い合わせの回答するため・当アプリのサー
     ビスの一部に利用するため

  4. 個人データを安全に管理するための措置当
     アプリは、個人情報を正確かつ最新の内容
     に保つように努め、不正なアクセス・改ざ
     ん・漏洩・滅失及び毀損から保護するため
     全作業員及び役員に対して教育研修を実施
     しています。また、個人情報保護規定を設
     け、現場での管理について定期的な点検を
     行っています。

  5. 個人データの第三者提供について当社は以
     下の場合を除き、同意を得ないで第三者に
     個人情報を提供することは致しません・法
     令に基づく場合・人の生命、身体又は財産
     の保護のために必要がある場合であって、
     本人の同意を得ることが困難であるとき・
     公衆衛生の向上又は児童の健全な育成の促
     進のために特に必要がある場合であって、
     本人の同意を得ることが困難であるとき・
     国の機関もしくは地方公共団体又はその委
     託を受けたものが法令の定める事務を遂行
     することに対して協力する必要があり、本
     人の同意を得ることにより当該事務の遂行
     に支障を及ばす恐れがあるとき・次に掲げ
     る事項をあらかじめ本人に通知または公表
     し、かつ当班が個人情報保護委員会に届け
     出を出した時①第三者への提供を利用目的
     とすること②第三者に提供される個人デー
     タの項目③第三者にへの提供の方法④本人の
     求めに応じて当該個人情報の第三者への提
     供を停止すること⑤本人の求めの受け付け
     る方法

  6. 匿名個人情報に関する取扱い当班は、匿名
     加工情報（特定の個人を識別できないよう
     加工した個人情報であって、復元ができな
     いようにしたもの）を作成する場合、以下
     の対応を行います。・法令で定める基準に
     従い適正な加工を施す・法令で定める基準
     に従い安全管理措置に講じる・匿名加工情
     報に含まれる個人に関する情報の項目を公
     表する・作成元となった個人情報の目的を
     識別するため、ほかの情報と照合すること

  7. 個人情報取扱いに関する相談や苦情の連絡
     先当班の個人情報の取扱いに関するご質問
     やご不明点、苦情、その他お問い合わせは
     お問い合わせフォームよりご連絡ください''',
                                          style: TextStyle(
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    )
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ]
      ),
    );
  }
}