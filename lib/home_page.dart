import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:google_books_api/bloc/home_bloc.dart';
import 'package:google_books_api/book_item/item_book.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _homeBloc = HomeBloc();
        return _homeBloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Libreria free to play"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Ingresa titulo",
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onSubmitted: (content) {
                  _homeBloc.add(SearchBookEvent(queryText: content));
                },
              ),
              Expanded(
                child: BlocConsumer<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is HomeErrorState) {
                      Scaffold.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text("Error: ${state.errorMessage}"),
                          ),
                        );
                    }
                  },
                  builder: (context, state) {
                    if (state is HomeLoadedState) {
                      return GridView.count(
                        // 2 columnas
                        crossAxisCount: 2,
                        // si no tiene childAspectRatio: (itemWidth / itemHeight) por default es 1/1 o sea cuadrado
                        childAspectRatio: (3 / 4),
                        children: List.generate(
                          state.booksList.length,
                          (index) => ItemBook(book: state.booksList[index]),
                        ),
                      );
                    } else if (state is HomeLoadingState) {
                      // return Center(
                      //   child: CircularProgressIndicator(),
                      // );
                      // return GridView.count(
                      //   crossAxisCount: 2,
                      //   children: List.generate(9, (index) => VideoShimmer()),
                      // );
                      return ListView.builder(
                        itemCount: 7,
                        itemBuilder: (BuildContext context, int index) {
                          return PlayStoreShimmer();
                        },
                      );
                    } else
                      return Center(
                        child: Text("Ingrese palabra para buscar"),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
