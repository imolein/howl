-- Copyright 2012-2015 The Howl Developers
-- License: MIT (see LICENSE.md at the top-level directory of the distribution)

mode_reg =
  name: 'python'
  extensions: { 'sc', 'py', 'pyw', 'pyx' }
  patterns: { 'wscript$', 'SConstruct$', 'SConscript$' }
  shebangs: '[/ ]python.*$'
  create: -> bundle_load('python_mode')

howl.mode.register mode_reg
howl.inspection.register {
  name: 'pycodestyle'
  factory: -> {
    cmd: 'pycodestyle <file>'
    type: 'warning'
    is_available: -> howl.sys.find_executable('pycodestyle'), '`pycodestyle` command not found'
  }
}

unload = ->
  howl.mode.unregister 'python'
  howl.inspection.unregister 'pycodestyle'

return {
  info:
    author: 'Copyright 2015 The Howl Developers',
    description: 'Python bundle',
    license: 'MIT',
  :unload
}
