NVM_VERSION = v0.35.3

brew-bundle:
	brew bundle

brew-dump:
	brew bundle dump

themes:
	git clone https://github.com/arcticicestudio/nord-dircolors.git ~/.config/nord-dircolors
	pushd ~/.config/nord-dircolors && git pull && popd

define RUBY_DEFAULT_GEMS
wirb
awesome_print
interactive_editor
endef

export RUBY_DEFAULT_GEMS
ruby:
	mkdir -p $(shell rbenv root)/plugins
	git clone https://github.com/rbenv/ruby-build.git $(shell rbenv root)/plugins/ruby-build \
		|| (pushd $(shell rbenv root)/plugins/ruby-build && git pull && popd)
	git clone https://github.com/rbenv/rbenv-default-gems.git $(shell rbenv root)/plugins/rbenv-default-gems \
		|| (pushd $(shell rbenv root)/plugins/rbenv-default-gems && git pull && popd)
	echo "$$RUBY_DEFAULT_GEMS" > $(shell rbenv root)/default-gems

tsjs:
	curl https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh -o /tmp/nvm_install.sh
	chmod u+x /tmp/nvm_install.sh
	/tmp/nvm_install.sh --no-use

all: brew-bundle ruby
