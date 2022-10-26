import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Screens/screens.dart';
import 'package:flutter_chat_app/helpers.dart';
import 'package:flutter_chat_app/theme.dart';
import 'package:flutter_chat_app/widgets/widget.dart';
import 'package:jiffy/jiffy.dart';

import '../model/models.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
         const SliverToBoxAdapter(
          child: _Stories(),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate(_delegate),
              
        ),
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final Faker faker = Faker();
    final date = Helpers.randomDate();
            return _MessageTile(messageData: MessageData(senderName: faker.person.name(),
             message: faker.lorem.sentence(), 
             messageDate: date, 
             dateMessage: Jiffy(date).fromNow(),
              profilePic: Helpers.randomPictureUrl()));
         }
}
class _MessageTile extends StatelessWidget {

  final MessageData messageData;
  const _MessageTile({super.key, required this.messageData});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(ChatScreen.route(messageData));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: 90,
        
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
         child: Padding(
           padding: const EdgeInsets.all(4.0),
           child: Row(
            children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Avatar.medius(url: messageData.profilePic,),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 
                  Text(messageData.senderName, 
                  overflow: TextOverflow.ellipsis, 
                  style: const TextStyle(letterSpacing: 0.5,
                   wordSpacing: 1.5, fontSize: 14, 
                   ),),
                   const SizedBox(height: 6,),
                  
                  Text(messageData.message,  overflow: TextOverflow.ellipsis, 
                  style: const TextStyle(
                  fontSize: 12, 
                   color: AppColors.textFaded),),
                ],
              ),
            ),
    
    
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(messageData.dateMessage.toLowerCase(), style: const TextStyle(fontSize: 10,
                  fontWeight: FontWeight.w400, 
                  letterSpacing: -0.2 ),),
                  const SizedBox(height: 8,),
                  Container(
                    height: 18,
                    width: 18,
                    decoration: const BoxDecoration(shape: BoxShape.circle,
                     color: AppColors.secondary,),
    
                     child: const Center(child: Text('1', style: TextStyle(fontSize: 10, color: AppColors.textLight, fontWeight: FontWeight.w900),)),
                  ),
    
                ],
              ),
            )
    
        ],
            
        ),
         ),
      ),
    );
  }
}

class _Stories extends StatelessWidget {
  const _Stories();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(0),
      child: SizedBox(
        height: 134,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, left: 10, bottom: 5),
              child: Text(
                'Stories',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.textLight),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 70,
                      child: _StroyCard(
                          storyData: StoryData(
                              url: Helpers.randomPictureUrl(),
                              name: faker.person.name())),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class _StroyCard extends StatelessWidget {
  final StoryData storyData;

  const _StroyCard({required this.storyData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 3),
          child: Avatar.medius(
            url: storyData.url,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16.5),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, letterSpacing: 0.3),
            ),
          ),
        ),
      ],
    );
  }
}
