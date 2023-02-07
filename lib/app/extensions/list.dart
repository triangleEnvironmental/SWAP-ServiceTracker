
extension AppList<E> on List<E> {
  toggle(E item) {
    if (contains(item)) {
      remove(item);
    } else {
      add(item);
    }
  }
}