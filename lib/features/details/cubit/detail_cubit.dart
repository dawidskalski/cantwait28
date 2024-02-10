import 'package:bloc/bloc.dart';
import 'package:cantwait28/features/model/items_model.dart';
import 'package:cantwait28/features/repositories/items_repository.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit(this._itemsRepository)
      : super(DetailState(
          itemModel: null,
        ));

  final ItemsRepository _itemsRepository;

  Future<void> getItemWithId({required String id}) async {
    final itemModel = await _itemsRepository.get(id: id);
    emit(DetailState(itemModel: itemModel));
  }
}
