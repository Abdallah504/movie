import 'package:flutter/material.dart';
import 'package:movie/screens/description_screen.dart';


class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key,required this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trending Movies',style: TextStyle(fontSize: 26, color: Colors.white)),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder:(context,index){
               
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:  (context)=>DescriptionScreen(
                      name: trending[index]['title'], 
                      description: trending[index]['overview'],
                       bannerUrl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'],
                        posterUrl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                         vote: trending[index]['vote_average'].toString(),
                          launch_on: trending[index]['release_date'])));
                  },
                  child:trending[index]['title']!=null ? Container(
                    padding: EdgeInsets.only(right: 15),
                    width: 140,
                    child: Column(
                      
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                                )
                                )
                                ),
                        ),
                        Container(
                          child: Text(trending[index]['title']!=null ? trending[index]['title']:'Loading',style: TextStyle(color: Colors.white)),
                        )
                      ],
                    ),
                  ):Container()
                );
              } ),
          )
        ],
      ),
    );
  }
}