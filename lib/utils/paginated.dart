import 'package:get/get.dart';

class Paginated<T> {
  final int limit;
  int page = 1;
  int lastCount = 0;
  final items = <T>[].obs;

  bool get hasMore => lastCount == limit;
  int get listLength => items.length + (hasMore ? 1 : 0);

  final isLoading = false.obs;

  bool initialized = false;

  final Future<List<T>?> Function(int page) onFetch;
  final void Function()? onFreshFetch;

  Paginated({required this.onFetch, this.onFreshFetch, this.limit = 10});

  void clear() {
    page = 1;
    lastCount = 0;
    items.clear();
  }

  Future<void> freshFetch() async {
    initialized = true;
    if (isLoading.value) return;
    clear();
    isLoading.value = true;
    await fetch();
    onFreshFetch?.call();
    isLoading.value = false;
  }

  Future<void> lazyFetch() async {
    if (isLoading.value) return;
    page = 1;
    lastCount = 0;
    final result = await onFetch(page);
    if (result == null) return;
    page += 1;
    lastCount = result.length;
    items.value = result;
  }

  Future<void> fetch() async {
    final result = await onFetch(page);
    if (result == null) return;
    page += 1;
    lastCount = result.length;
    items.addAll(result);
  }
}
