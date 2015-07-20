require 'serverspec'
require 'yaml'

set :backend, :exec

def load_configuration (key)
  configuration = YAML.load_file 'web-development.yml'
  configuration[0]['vars'][key].map do |package|
    package.kind_of?(Hash) ? package['name'] : package
  end
end

def homebrew_packages
  load_configuration 'homebrew_packages'
end

def homebrew_cask_packages
  load_configuration 'homebrew_cask_packages'
end

def homebrew_caskroom
  env = Shellwords.shellsplit(ENV['HOMEBREW_CASK_OPTS'] || '').map do |option|
    option.split('=')
  end
  Hash[*env.flatten]['--caskroom'] || '/opt/homebrew-cask/Caskroom'
end
