# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias 'H=history -r | fgrep "\!*"' # type H latex to get last latex command
alias 'h=history'
alias 'less=/usr/bin/less -ifQ'
alias 'svndiff=/usr/bin/svn diff --diff-cmd=/usr/bin/diff -x "-iwb"'
alias 'sdiff=/usr/bin/sdiff -iWb -w180'
alias 'll=/bin/ls -al   --color=tty'
alias 'lt=/bin/ls -alrt --color=tty'
alias 'lll=/bin/ls -dF *(@)'
alias 'x=exit'
alias pico='pico -kw '
alias light='ssh -X -Y apathak@lightning.physics.louisville.edu'
alias hpclab2='ssh -X -Y apathak@hpclab2.physics.louisville.edu'
alias higgs='ssh -X -Y apathak@higgs.physics.louisville.edu'
alias pacer='ssh -X -Y apathak@pacer.physics.louisville.edu'
alias pacerjupyter='ssh -X -Y apathak@pacer.physics.louisville.edu -L 8484:localhost:8484'
alias kekcc='ssh kekcc'
alias kekcc1='ssh -X -Y atpathak@sshcc1.kek.jp'
alias kekcc2='ssh -X -Y atpathak@sshcc2.kek.jp'
alias Ikek='ssh -X -Y atpathak@login.cc.kek.jp'
alias naf='ssh -X -Y atpathak@@naf-belle2.desy.de'
alias bnl='ssh -X -Y atpathak@atlasgw.usatlas.bnl.gov'
alias dqm='ssh atpathak@bastion.desy.de'
alias cmslpc='ssh -X -Y atpathak@cmslpc-sl7.fnal.gov'
alias scp='/usr/bin/scp -S /usr/bin/ssh'
alias sftp='/usr/bin/sftp -S /usr/bin/ssh'
calc() {
#  echo $@ | awk 'BEGIN{pi=3.1415926}{print $0}'
  bc -l <<< "$@"
}
#
test -t 0 && stty erase '^?'
# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }
# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }
# Find a pattern in a set of files and highlight them:
# (needs a recent version of egrep)
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
    xargs -0 egrep --color=auto -sn ${case} "$1" 2>&-

}

