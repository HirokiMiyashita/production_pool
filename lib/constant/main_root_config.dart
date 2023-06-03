enum MainRoute {
  measurement(name: '/', path: '/'),
  record(name: '/recode', path: '/recode');

  final String name;
  final String path;

  const MainRoute({required this.name, required this.path});
}
