# wisdom.rb

Tool for showing custom fortune cookie bundles

## install

* rake install

## bundled tips credit

* vim - http://www.rayninfo.co.uk/vimtips.html
* zsh - http://grml.org/zsh/zsh-lovers.html

## screenshot

![wisdom](http://github.com/gaving/wisdom/raw/master/site/1.png)

## zsh config

    # Run fortune only if it's installed and we aren't connected to the machine via ssh
    if [ -x "$(which wisdom 2>&1)" -a -z "$SSH_CONNECTION" ] ; then
        wisdom
    fi
