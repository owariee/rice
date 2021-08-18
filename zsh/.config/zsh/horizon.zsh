HZ_PLUGINS_DIR=$XDG_CACHE_HOME/zsh/plugins
HZ_THEMES_DIR=$XDG_CACHE_HOME/zsh/themes

function get_repo_name() {
    echo $1 | awk -F / '{print $NF}'
}

function clone_repo() {
    REPO_DIR=$2/$(get_repo_name $1)
    if [ ! -d $REPO_DIR ]
    then
        mkdir -p $REPO_DIR
        git clone $1 $REPO_DIR
    fi
    echo $REPO_DIR
}

function clone_repo_github() {
    echo $(clone_repo https://github.com/$1 $2)
}

function clone_repo_github_plugin() {
    echo $(clone_repo_github $1 $HZ_PLUGINS_DIR)
}

function clone_repo_github_theme() {
    echo $(clone_repo_github $1 $HZ_THEMES_DIR)
}

function github_plugin () {
    source "$(clone_repo_github_plugin $1)/$(get_repo_name $1).zsh"
}

function ohmyzsh_plugin() {
    source "$(clone_repo_github_plugin ohmyzsh/ohmyzsh)/plugins/$1/$1.plugin.zsh"
}

function ohmyzsh_lib() {
    source "$(clone_repo_github_plugin ohmyzsh/ohmyzsh)/lib/$1.zsh"
}

function github_theme() {
    source "$(clone_repo_github_theme $1)/$2.zsh"
}

