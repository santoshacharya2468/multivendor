import 'package:checkshopsonline/bloc/selection_bloc.dart';
import 'package:checkshopsonline/models/product.dart';
import 'package:checkshopsonline/widgets/myappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionScreen extends StatefulWidget {
  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SelectionBloc>(context).add(LoadSelectionListEvent());
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(context, pin: false),
        body: BlocListener<SelectionBloc, SelectionState>(
          listener: (context, state) {
            if (state is ItemRemovedState) {
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                duration: Duration(seconds: 1),
                backgroundColor: Colors.redAccent,
                content: Container(
                    height: 20.0,
                    child: Center(
                        child: Text("Item Removed from selection List"))),
              ));
            }

            // else if (state is NewItemAddedState) {
            //   Scaffold.of(context).showSnackBar(SnackBar(
            //     backgroundColor: Colors.greenAccent,
            //     content: Center(child: Text("Item Added to selection List")),
            //   ));
            // }
          },
          child: Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: BlocBuilder<SelectionBloc, SelectionState>(
              builder: (context, state) {
                if (state is SelectionListLoadedState) {
                  if (state.products.length == 0) {
                    return Center(
                        child: Text("No item in your selection list"));
                  }
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        child: Builder(builder: (context) {
                          var totalPrice = 0.0;
                          for (var p in state.products) {
                            totalPrice += p.selectedItem * p.price;
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Total",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Rs $totalPrice",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              )
                            ],
                          );
                        }),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            var p = state.products[index];
                            return PinnedProductView(p);
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ));
  }
}

class PinnedProductView extends StatefulWidget {
  final Product product;
  PinnedProductView(this.product);
  @override
  _PinnedProductViewState createState() => _PinnedProductViewState();
}

class _PinnedProductViewState extends State<PinnedProductView> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
          child: Container(
        height: 80,
        width: deviceSize.width,
        child: Row(
          children: <Widget>[
            Container(
              height: 64.0,
              width: 64.0,
              child: Image.asset(
                widget.product.imageUrl[0],
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: BlocListener<SelectionBloc, SelectionState>(
                listener: (context, state) {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.product.name),
                        Text("Rs ${widget.product.price}",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            )),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.product.selectedItem += 1;
                                  BlocProvider.of<SelectionBloc>(context)
                                      .add(UpdateItemCountEvent(widget.product));
                                });
                              },
                              child: Container(
                                height: 30.0,
                                width: 30.0,
                                color: Colors.grey,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Container(
                              height: 30.0,
                              width: 30.0,
                              color: Colors.grey,
                              child: Center(
                                  child: Text("${widget.product.selectedItem}")),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.product.selectedItem > 1) {
                                    widget.product.selectedItem -= 1;
                                    BlocProvider.of<SelectionBloc>(context).add(
                                        UpdateItemCountEvent(widget.product));
                                  }
                                });
                              },
                              child: Container(
                                height: 30.0,
                                width: 30.0,
                                color: Colors.grey,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<SelectionBloc>(context)
                    .add(RemoveItemFromSelectionListEvent(widget.product));
              },
              child: Container(
                height: 80.0,
                width: 25.0,
                color: Theme.of(context).primaryColor,
                child: Center(
                    child: Icon(
                  Icons.cancel,
                  color: Colors.white,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
