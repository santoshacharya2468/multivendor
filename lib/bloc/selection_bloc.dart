import 'package:checkshopsonline/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SelectionEvent {}

class LoadSelectionListEvent extends SelectionEvent {}

class AddItemToSelectionListEvent extends SelectionEvent {
  Product newProduct;
  AddItemToSelectionListEvent(this.newProduct);
}

class RemoveItemFromSelectionListEvent extends SelectionEvent {
  Product oldProduct;
  RemoveItemFromSelectionListEvent(this.oldProduct);
}

class UpdateItemCountEvent extends SelectionEvent {
  Product productToUpdate;
  UpdateItemCountEvent(this.productToUpdate);
}

abstract class SelectionState {}

class SelectionInitialState extends SelectionState {}
class NewItemAddedState extends SelectionState {}
class ItemRemovedState extends SelectionState {}
class SelectionListLoadingState extends SelectionState {}
class SelectionListLoadedState extends SelectionState {
  List<Product> products;
  SelectionListLoadedState(this.products);
}

class SelectionBloc extends Bloc<SelectionEvent, SelectionState> {
  List<Product> mySelections;
  @override
  SelectionState get initialState => SelectionInitialState();
  @override
  Stream<SelectionState> mapEventToState(SelectionEvent event) async* {
    if (event is LoadSelectionListEvent) {
      if(mySelections!=null){
        yield SelectionListLoadedState(mySelections);
      }
      else{
      yield SelectionListLoadingState();
      List<Product> products = [
        Product(
            id: '1',
            name: "Sweater",
            imageUrl: ["assets/images/sweater.jfif"],
            price: 220.5),
        Product(
            id: '1',
            name: "Tshirt",
            imageUrl: ["assets/images/tshirt.jpg"],
            price: 120.5),
        Product(
            id: '1',
            name: "Sweater",
            imageUrl: ["assets/images/sweater.jfif"],
            price: 220.5),
        Product(
            id: '1',
            name: "Tshirt",
            imageUrl: ["assets/images/tshirt.jpg"],
            price: 120.5),
      ];
      mySelections=products;
      yield SelectionListLoadedState(mySelections);
      }
    }
    else if(event is AddItemToSelectionListEvent){
      if(mySelections!=null){
        mySelections.add(event.newProduct);
      }
      else{
        mySelections=List<Product>();
        mySelections.add(event.newProduct);
      }
      yield NewItemAddedState();
      yield SelectionListLoadedState(mySelections);
    }
    else if(event is RemoveItemFromSelectionListEvent){
      mySelections.remove(event.oldProduct);
      yield ItemRemovedState();
      yield SelectionListLoadedState(mySelections);
    }
    else if(event is UpdateItemCountEvent){
      mySelections.where((element) => element.id==event.productToUpdate.id).single.selectedItem=event.productToUpdate.selectedItem;
      yield SelectionListLoadedState(mySelections);

    }
  }
}
