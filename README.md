# useful-stuff

## Images to pdf
* Install image magick
* Convert all images into a single pdf
```bash
convert "*.jpg" -background white -page a4 -quality 100 output.pdf
```
* Check file size
```bash
ls -l --block-size=M
```
* Compress with ps2pdf
```bash
ps2pdf -dPDFSETTINGS=/ebook input.pdf output.pdf
```

## Merge multiple pdfs
```
pdfunite 1.pdf 2.pdf 3.pdf all.pdf
```

## Unite multiple pdfs
```
pdfunite page1.pdf page2.pdf page3.pdf final-pages1-3.pdf
```

## Remove page from pdf
```
qpdf input.pdf --pages . 1-12 -- output.pdf
```
Only keeps pages 1 - 12, removes the rest.

## Remove docker container and images
### Remove all exited docker container
```bash
docker rm (docker ps --filter status=exited -q)
```
### Remove all containers including its volumes
```
docker rm -vf $(docker ps -aq)
```

### Remove all the images
```
docker rmi -f $(docker images -aq)
```

## Oh My Zsh (on WSL2)
* Install [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
  ```
  sudo apt install zsh
  ```
* Install [Oh My Zsh](https://ohmyz.sh/)
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ``` 
* Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
  ```
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```
* Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`.
* Set zsh as default
```
sudo chsh -s $(which zsh) $(whoami)
```
* Install zsh-autosuggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
* Add useful plugins to ~/.zshrc (nano ~/.zshrc)
  ```
  plugins=(
        git
        zsh-autosuggestions
  )
  ```
* Add useful aliases to ~/.zshrc (nano ~/.zshrc)
  ```
  alias gitroot='cd $(git rev-parse --show-toplevel)'
  alias cl="clear"
  ```
* Use [existing git aliases](https://gist.github.com/DavidToca/3086571)

## Use nvm with zsh
* Add nvm to ~/.zshrc
```
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
```

## Activate git credentials helper (for http)
```
git config credential.helper store
```

## Create and save alias in fish
```
alias --save cl=clear
```

## Enter ssh key only once per terminal session 
* Add these lines to the bottom of the ~/.zshrc
```
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
```
* Add this lines to the ~/.ssh/config
```
Host *
AddKeysToAgent yes
```

## Fix wsl "could not resolve hostname"
* Create wsl.conf file
```
sudo vim /etc/wsl.conf
```
* Add the following lines
```
[network]
generateResolvConf = false
```
* Delete old resolv.conf and create new
```
sudo rm -f /etc/resolv.conf
sudo vim /etc/resolv.conf
```
* Add your nameserver
```
nameserver 8.8.8.8
```

## Start chrome without CORS enabled (Windows)
* Click Ctrl + R
* Type
```
chrome.exe --user-data-dir="C://Chrome dev session" --disable-web-security
```

## Create python3 virtual environment
```
python3 -m venv venv
source venv/bin/activate
```

## Make python script executable
```
from setuptools import setup
setup(
    name='myscript',
    version='0.0.1',
    entry_points={
        'console_scripts': [
            'myscript=myscript:run'
        ]
    }
)
```
Install: `pip install -e /path/to/script/folder`

## Oh my zsh alias to install pip package and put it into the requirements.txt
```
alias pip_r='_pip_r() { pip install "$1" && pip freeze | grep "$1" >> requirements.txt ; }; _pip_r'
```

## Undo latest local commit
```
git reset HEAD~ 
```

## Remove tracked file after adding it to .gitignore
```
git rm --cached <filename>
```
or
```
git rm --cached -r <folder>
```

## New ssh key for e.g. GitHub
```
ssh-keygen -t ed25519 -C "your_email@example.com"
```
or 
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
To get the public key do
```
cat ~/.ssh/id_rsa.pub 
```

## Vim: Replace pick with s in interactive rebase to squash commits
```
:2,$s/^pick/s/g
```
