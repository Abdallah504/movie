import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  final String name,description,bannerUrl,posterUrl,vote,launch_on;
  const DescriptionScreen({Key? key, required this.name, required this.description, required this.bannerUrl, required this.posterUrl, required this.vote, required this.launch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(name!=null?name:'Not Loaded'),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child:Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(bannerUrl,fit: BoxFit.cover,),
                    ) 
                    ),
                    Positioned(
                      bottom: 10 ,
                      child:Text('  ⭐Average Rating  ${vote}',style: TextStyle(fontSize: 18),) )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              padding:EdgeInsets.only(left: 10) ,
              child: Text('Released on : ${launch_on}',style: TextStyle(fontSize: 14)),
              ),
              const SizedBox(height: 35,),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 200,
                    width: 100,
                    child: Image.network(posterUrl),
                  ),
                  Flexible(
                    child: Text(description,style: TextStyle(fontSize: 15),))
                ],
              )
          ],
        ),
      ),
    );
  }
}