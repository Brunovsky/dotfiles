# .bash_profile

[[ -f ~/.profile ]] && . ~/.profile

# launch keychain
shopt -s extglob
eval $(keychain --eval --quiet --noask ~/.ssh/id_!(*.pub))
