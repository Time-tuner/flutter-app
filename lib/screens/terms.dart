import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);


  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
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
                      child: Text("利用規約",
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
                                        Text('''

第一条　本サービス利用者
  1.本規約は、本サービスの提供に同意し、自己の
    端末にダウンロードした利用者（以下ユーザ）
    に適用されます
  2.利用規約に同意さあれない限り、ユーザはアプ
    リを利用できません
  3.ユーザは、利用規約の定めに従って、アプリを
    利用するものとします

第二条　利用規約の変更について
  1.当アプリケーション（以下アプリ）はユーザの
    承諾なく利用規約を変更することが出来るもの
    とし、ユーザはアプリを利用するにあたり、変
    更後の本規約に従うものとします
  2.当アプリは、前項の変更を行う場合、7日以上
    の予告期間をおいて、変更後の利用規約の内容
    をユーザに通知するものとします。但し、変更
    が軽微かつユーザに特に不利益が生じない場合
    は、通知による予告をしないものとします
  3.前項に定める予告期間経過後に、ユーザがアプ
    リを利用した場合は、ユーザが変更後の利用規
    約の内容に同意したものとみなします

第三条　連絡事項について
  1.アプリに関するユーザから当社への連絡は、設
  定画面の「お問い合わせ」を通じて行うものと
  します

第四条　アカウントおよび個人情報の管理について

第五条　本アプリ利用条件について
  1.ユーザはアプリを利用するに際し、情報端末
    （デバイス）、通信機器・手段、電力などを
    ユーザ自らの責任と負担で準備・用意し、ア
    プリ利用中は維持しなければならないものと
    する

第六条　非保障、免責について
  1.当アプリが提供するサービスについて、完全性
    、有効性、安全性、信頼性、適法性、特定の目
    的への適合性を含む、事実上又は法律上の一切
    の不具合がないことにつき、明示的にも黙示的
    にも保証は行いません。なお、セキュリティ等
    への欠陥・エラー・バグがないことについても
    補償しません。
  2.当アプリは、次の事項について補償を行いませ
    ん①すべての情報端末に対応して正常に動作す
    ること②OS又はバージョンアップなどが行われ
    た場合において正常に動作すること③アプリス
    トア等を含むプラットフォーマーの運営方針、
    規約などの変更が行われた場合において正常に
    動作すること
  3.当アプリは、前2項にかかる一切の不具合につ
    いて、責任と負担で当該不具合の解消を行うこ
    とを保証しません


''',
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