project('os-release')

commit_hash = run_command('git', 'rev-parse', '--short', 'HEAD', check: false).stdout().strip()
commit_time = run_command('git', 'show', '--no-patch', '--format=%ct', 'HEAD', check: false).stdout().strip()
conf_data = configuration_data()
conf_data.set('VERSION', '@0@'.format(commit_hash))
conf_data.set('IMAGE_VERSION', '@0@.@1@'.format(commit_time, commit_hash))
configure_file(
  input: 'os-release.in',
  output: 'os-release',
  configuration: conf_data,
  install_dir: get_option('prefix') / 'lib'
)
install_symlink(
  'os-release',
  install_dir: get_option('sysconfdir'),
  pointing_to: get_option('prefix') / 'lib' / 'os-release'
)
