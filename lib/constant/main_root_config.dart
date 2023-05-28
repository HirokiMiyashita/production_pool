enum MainRoute {
  top(name: '/', path: '/');

  final String name;
  final String path;

  const MainRoute({required this.name, required this.path});
}
