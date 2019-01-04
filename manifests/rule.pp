##  params:
##    content: Rule definition
##    order:   Relative order of this rule

define auditd::rule (
  String             $content = $name,
  Auditd::Integerish $order   = 10
) {
  concat::fragment { "auditd_fragment_${name}":
    target  => $auditd::rules_file,
    order   => $order,
    content => $content
  }
}
