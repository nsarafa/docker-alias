# ------------------------------------
# Docker alias and function
# ------------------------------------

# --------------------- #
# [dockviz enhancements](https://github.com/justone/dockviz) #
# --------------------- #

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

# List images (three different ways)
alias did="dockviz images --dot"
alias dis="dockviz images --short"
alias dit="dockviz images --tree"

# List containers
alias dc='dockviz containers --dot'

# ------ #
# Custom #
# ------ #

# Remove image
# alias drmi="docker image rm "
dirmf() { docker image rm --force $("name=$1"); }

# Force remove image
dirm() { docker image rm $("name=$1"); }

# Remove container
alias drmc="docker container rm "

# Force remove container
alias drmcf="docker container rm "

# -------- #
# Disabled #
# -------- #

# Get images
# disabled in favor of New dockviz images
# alias di="docker images"

# -------- #
# Original #
# -------- #

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

# Stop all containers
dstop() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all images
dri() { docker rmi $(docker images -q); }

# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

---

Credits

- [dockviz](https://github.com/justone/dockviz)
