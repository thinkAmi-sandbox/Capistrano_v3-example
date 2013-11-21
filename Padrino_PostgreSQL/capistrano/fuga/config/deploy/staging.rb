set :stage, :development

require 'win32/registry'
key_path = Win32::Registry.expand_environ('%USERPROFILE%\.vagrant.d\insecure_private_key')

server '127.0.0.1', roles: %w{ringo}, user: 'vagrant', port: 2222, ssh_options: {
  user: 'vagrant',
  keys: key_path,
  auth_methods: %w(publickey)
}