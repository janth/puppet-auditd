define auditd::audisp::plugin (
  Stdlib::Absolutepath      $path,
  Boolean                   $active    = true,
  Enum['out', 'in']         $direction = 'out',
  Enum['builtin', 'always'] $type      = 'always',
  Optional[String]          $args,
  Enum['binary', 'string']  $format    = 'string',
) {
  file { "/etc/audisp/plugins.d/${name}.conf":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template("${module_name}/audisp.plugin.erb"),
    notify  => Service['auditd'],
  }
}
