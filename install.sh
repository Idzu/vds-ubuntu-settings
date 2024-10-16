#!/bin/bash

# Обновление и установка необходимых пакетов
sudo apt update && sudo apt upgrade -y
echo "Обновление системы завершено."

# Проверка и установка Zsh
if ! command -v zsh &> /dev/null; then
    sudo apt install -y zsh
    echo "Zsh установлен."
else
    echo "Zsh уже установлен."
fi

# Проверка и установка Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Oh My Zsh установлен."
else
    echo "Oh My Zsh уже установлен."
fi

# Установка Zsh по умолчанию без подтверждения
if [ "$SHELL" != "$(which zsh)" ]; then
    sudo chsh -s $(which zsh) $USER
    echo "Zsh установлен по умолчанию."
else
    echo "Zsh уже установлен по умолчанию."
fi

# Установка Zsh-плагинов
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Проверка существования директории для плагинов и её создание при необходимости
if [ ! -d "$ZSH_CUSTOM/plugins" ]; then
    mkdir -p "$ZSH_CUSTOM/plugins"
    echo "Создана директория для плагинов: $ZSH_CUSTOM/plugins"
fi

# Установка zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    echo "Плагин zsh-autosuggestions установлен."
else
    echo "Плагин zsh-autosuggestions уже установлен."
fi

# Установка zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    echo "Плагин zsh-syntax-highlighting установлен."
else
    echo "Плагин zsh-syntax-highlighting уже установлен."
fi

# Замена файла .zshrc на заранее подготовленный из папки zsh (относительный путь)
if [ -f "./zsh/.zshrc" ]; then
    cp "./zsh/.zshrc" "$HOME/.zshrc"
    echo "Файл .zshrc заменён на заранее подготовленный."
else
    echo "Файл ./zsh/.zshrc не найден. Проверьте наличие файла."
fi


# Установка tmux
if ! command -v tmux &> /dev/null; then
    sudo apt install -y tmux
    echo "Tmux установлен."
else
    echo "Tmux уже установлен."
fi

# Установка Tmux Plugin Manager (TPM)
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "TPM установлен."
else
    echo "TPM уже установлен."
fi

# Настройка файла .tmux.conf
if [ ! -f ~/.tmux.conf ]; then
    cat <<EOL >> ~/.tmux.conf
set -g default-shell /bin/zsh
setw -g mouse on

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'

run '~/.tmux/plugins/tpm/tpm'
EOL
    echo "Файл .tmux.conf настроен."
else
    echo "Файл .tmux.conf уже настроен."
fi

# Установка и включение nginx
if ! command -v nginx &> /dev/null; then
    sudo apt install -y nginx
    sudo systemctl enable nginx
    echo "Nginx установлен и включен."
else
    echo "Nginx уже установлен."
fi

# Установка Node.js
if ! command -v node &> /dev/null; then
    sudo apt-get install -y curl
    curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
    sudo -E bash nodesource_setup.sh
    sudo apt-get install -y nodejs
    echo "Node.js установлен."
else
    echo "Node.js уже установлен."
fi

echo "Все настройки завершены!"

# Запуск Zsh
exec zsh
