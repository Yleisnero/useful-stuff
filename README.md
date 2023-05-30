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

## Remove all exited docker container
```bash
docker rm (docker ps --filter status=exited -q)
```

## Oh My Zsh (on WSL2)
* Install [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
* Install [Oh My Zsh](https://ohmyz.sh/)
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ``` 
* Install [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
  ```
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
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
