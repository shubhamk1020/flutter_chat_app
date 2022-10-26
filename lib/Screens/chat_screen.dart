import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/message_data.dart';
import 'package:flutter_chat_app/theme.dart';
import 'package:flutter_chat_app/widgets/avatar.dart';
import 'package:flutter_chat_app/widgets/glowing_action_button.dart';
import 'package:flutter_chat_app/widgets/icon_background.dart';

class ChatScreen extends StatelessWidget {

  static Route route(MessageData data) => MaterialPageRoute(builder: (context) => ChatScreen(messageData: data));
  
 final MessageData messageData;
  const ChatScreen({super.key, required this.messageData});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 54,
        leading:  Align(
          alignment: Alignment.centerRight,
          child: IconBackground(icon: CupertinoIcons.back, onTap: () { Navigator.of(context).pop(); 
          },),
          ),
        centerTitle: false,
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.transparent,
      title:  _AppBarTitle(messageData: messageData,),
      
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: IconBorder(
              icon: CupertinoIcons.video_camera_solid, onTap: () {},
             ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Center(
            child: IconBorder(
              icon: CupertinoIcons.phone_solid, onTap: () {},
              ),
              ),
        ),
      ],
      ),
      body: 
         Column(
          children: const [
            Expanded(child: _DemoMessageTile()
            ),
             _ACtionBar(),
          ],
        ),
              
    );
  }
}


class _DemoMessageTile extends StatelessWidget {
  const _DemoMessageTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          _DateLable(lable: 'yesterday'),
          _MessageList(message: "Heyy I am shubam I leave at khajuri and post Banjari DistRotas", messageDate: '12:04AM'),
          _MessageOwnList(message: "Heeyy I am Ravi I leave at khajuri and post Banjari DistRotas", messageDate: '15:40PM')
          
        ],
      ),
    );
  }
}
class _MessageList extends StatelessWidget {
  final String message;
  final String messageDate;

  const _MessageList({super.key, required this.message, required this.messageDate});
  static const _borderRadius = 26.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
         // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
               margin: const EdgeInsets.only(right: 75),
              decoration:const BoxDecoration(borderRadius: BorderRadius.only(
                topRight: Radius.circular(_borderRadius), 
                topLeft: Radius.circular(_borderRadius),
                bottomRight: Radius.circular(_borderRadius),
              ),
              color: AppColors.secondary
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
                child: Text(message, 
                style: const TextStyle(color: AppColors.textLight, fontSize: 18),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(messageDate, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textFaded),),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageOwnList extends StatelessWidget {
   final String message;
  final String messageDate;
  static const _borderRadius = 26.5;
  const _MessageOwnList({super.key, required this.message, required this.messageDate});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
         // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 75),
              decoration:const BoxDecoration(borderRadius: BorderRadius.only(
                topRight: Radius.circular(_borderRadius), 
                topLeft: Radius.circular(_borderRadius),
                bottomLeft: Radius.circular(_borderRadius),
              ),
              color: AppColors.cardDark
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
                child: Text(message, style: const TextStyle(color: AppColors.textLight, fontSize: 18),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(messageDate, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textFaded),),
            )
          ],
        ),
      ),
    );
  }
}

class _DateLable extends StatelessWidget {
   final String lable;

  const _DateLable({super.key, required this.lable});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Center(
        child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.cardDark,
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
                  child: Text(lable, style: const TextStyle(color: AppColors.textFaded, fontSize: 12, fontWeight: FontWeight.bold ),),
                ),
              ),
      ),
    );
  }
}

class _ACtionBar extends StatelessWidget {
  const _ACtionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 2),
      child: SafeArea(
        bottom: true,
        top: false,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(border: Border(right: BorderSide(width: 2, 
              color: Theme.of(context).dividerColor)), 
              
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(CupertinoIcons.camera_fill),
            ),

            ),
           const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(hintText: "Typing here...", border: InputBorder.none),
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: GlowingActionButton(color: AppColors.accent, icon: Icons.send_rounded, size: 40, onPressed: (){}),
            )
          ],
        ),
      ),
    );
  }
}


class _AppBarTitle extends StatelessWidget {
  final MessageData messageData;

  const _AppBarTitle({super.key, required this.messageData});


  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Avatar.small(url: messageData.profilePic,),
      const SizedBox(width: 16,),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(messageData.senderName, style: const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),),
           const SizedBox(height: 3,),
           const Text("Online now", style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),)
          ],

        ),
      )
    ],);
  }
}