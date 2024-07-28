class Node<T> {
  Node(this.value) : children = <Node<T>>[];

  static const int defaultNodeInitialCapacity = 6;
  
  final List<Node<T>> children;
  T value;

  static Node<T> newNode<T>(T value) {
    return Node<T>(value);
  }

  Node<T> addNodeChild(T childValue) {
    final Node<T> childNode = Node.newNode(childValue);
    children.add(childNode);
    return childNode;
  }

  void updateNodeValue(T newValue) {
    value = newValue;
  }
}
