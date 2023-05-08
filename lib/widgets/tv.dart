import 'package:flutter/material.dart';
import 'package:movie/screens/description_screen.dart';

class TvWidget extends StatelessWidget {
  final List tv;
  const TvWidget({Key? key,required this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular TV shows',style: TextStyle(fontSize: 26, color: Colors.white)),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv.length,
              itemBuilder:(context,index){
               
                return InkWell(
                  onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:  (context)=>DescriptionScreen(
                      name: tv[index]['original_name'], 
                      description: tv[index]['overview'],
                       bannerUrl: 'https://image.tmdb.org/t/p/w500'+tv[index]['backdrop_path'],
                        posterUrl: 'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path'],
                         vote: tv[index]['vote_average'].toString(),
                          launch_on: tv[index]['first_air_date'])));
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 15),
                    width: 140,
                    child: Column(
                      
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']
                                )
                                )
                                ),
                        ),
                        Container(
                          child: Text(tv[index]['original_name']!=null ? tv[index]['original_name']:'Loading'),
                        )
                      ],
                    ),
                  ),
                );
              } ),
          )
        ],
      ),
    );
  }
}