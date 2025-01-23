import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb/ui/video_page.dart';

import '../bloc/bloc/imdb_bloc.dart';
import '../repositery/model class/imdb_model.dart';

class ImdbPage extends StatefulWidget {
  const ImdbPage({super.key});

  @override
  State<ImdbPage> createState() => _ImdbPageState();
}

class _ImdbPageState extends State<ImdbPage> {
  late Imdbmodel data;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ImdbBloc>(context).add(FetchImdbEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black38,
        title: Center(
          child: Image(
            image: AssetImage('assets/logo.png'),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notifications),
          )
        ],
        backgroundColor: Colors.yellow,
      ),
      body: BlocBuilder<ImdbBloc, ImdbState>(
        builder: (context, state) {
          if (state is ImbdblocLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ImbdblocError) {
            return Center(child: Text('IMDB Error'));
          }
          if (state is ImbdblocLoaded) {
            data = BlocProvider.of<ImdbBloc>(context).imdbmodel;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 350,
                      width: 350,
                      child: Image.network(
                        data.bigImage.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Row(
                    children: [
                      SizedBox(width: 40),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => VideoPage()));
                            },
                            child: Container(
                              width: 200,
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image.network(
                                data.bigImage.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 55,
                            top: 65,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffF5C418),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  data.year.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            data.title.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            data.genre.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Director: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                data.director.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Writers: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 130,
                                margin: EdgeInsets.only(top: 4),
                                child: Text(
                                  data.writers.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color(0xffF5C418),
                            ),
                            SizedBox(height: 20),
                            Text(
                              data.rating.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                            Text(
                              '/10',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                            SizedBox(width: 10),
                            Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: Column(
                                children: [
                                  Text(
                                    '3K',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data.rank.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else
            return SizedBox();
        },
      ),
    );
  }
}
