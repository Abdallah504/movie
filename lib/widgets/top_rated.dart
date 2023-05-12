import 'package:flutter/material.dart';
import 'package:movie/screens/description_screen.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  const TopRated({Key? key,required this.topRated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Rated Movies',style: TextStyle(fontSize: 26, color: Colors.white)),
          SizedBox(height: 10,),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRated.length,
              itemBuilder:(context,index){
               
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context)=>DescriptionScreen(
                      name: topRated[index]['title'], 
                      description: topRated[index]['overview'],
                       bannerUrl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'],
                        posterUrl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'],
                         vote: topRated[index]['vote_average'].toString(),
                          launch_on: topRated[index]['release_date'])));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      
                      children: [
                        Container(
                          
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(20),
                            image: DecorationImage(
                              
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path']
                                ),
                                fit: BoxFit.cover
                                )
                                ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text(topRated[index]['title']!=null ? topRated[index]['title']:'Loading',style: TextStyle(color: Colors.white),),
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