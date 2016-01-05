default['neovim']['install_method'] = 'source'

default['neovim']['version'] = 'v0.1.1'

default['neovim']['build_dependencies'] = value_for_platform_family(
  'debian' => %w(libtool libtool-bin autoconf automake
                 cmake g++ pkg-config unzip),
  'rhel' => %w(autoconf automake cmake gcc gcc-c++ libtool
               make pkgconfig unzip)

)
