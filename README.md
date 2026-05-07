## Gerando chave ssh (github)

```ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
more ~/.ssh/id_ed25519.pub
```

- Copie a chave que aparecer no seu terminal
- Acesse o link: [https://github.com/settings/keys)](https://github.com/settings/keys)
- Clique em new SSH key
- Coloque um título para sua chave, exemplo: Ubuntu 24.04
- Cole a chave no campo Key
- Clique em Add SSH Key

## Instalando configurações

```ssh
git clone git@github.com:danyelvarejao/omarchy-dotfiles.git ~/Dotfiles
```

```ssh
cd ~/Dotfiles
```

```ssh
./install.sh
```
