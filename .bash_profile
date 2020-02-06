# .bash_profile

[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc  ]] && . ~/.bashrc

# launch keychain
shopt -s extglob
eval $(keychain --eval --quiet --noask ~/.ssh/id_!(*.pub))
