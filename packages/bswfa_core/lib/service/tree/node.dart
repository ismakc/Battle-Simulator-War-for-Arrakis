class Node<T> {
  Node._(this._value) : _children = <Node<T>>[];

  Node.newNode(T value) : this._(value);

  final List<Node<T>> _children;
  T _value;

  List<Node<T>> get children => List<Node<T>>.unmodifiable(_children);

  T get value => _value;

  Node<T> addChild(T childValue) {
    final Node<T> childNode = Node<T>.newNode(childValue);
    _children.add(childNode);
    return childNode;
  }

  void updateValue(T newValue) {
    _value = newValue;
  }
}
