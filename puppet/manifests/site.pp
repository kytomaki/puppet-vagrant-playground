node default {
  # Get list of packages to install from hiera
  $packages_to_install = hiera_hash('packages',{})
  create_resources(package,$packages_to_install,{'ensure'=>latest})
  # Provision modules
  hiera_include('classes')
}
# vim: tabstop=2 expandtab shiftwidth=2 softtabstop=2
