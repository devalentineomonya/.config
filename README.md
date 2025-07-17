# dotfiles Repository

![dotfiles Banner](https://placehold.co/1200x400/111827/FFFFFF?text=Productivity+Optimized+dotfiles)

This repository contains my personalized configuration files for development tools, shell environments, and system utilities. Designed for cross-platform compatibility with a focus on developer productivity.

## 🚀 Features

- **Cross-Platform Support**: Works on Windows (WSL), macOS, and Linux
- **Neovim Lua Configuration**: Modern IDE-like editor setup
- **Zsh & Bash Environments**: Optimized shell experience
- **Development Utilities**: Scripts for common development tasks
- **Web Development Ready**: Nginx configurations included
- **Version Controlled**: Easy to track changes and updates

## 🛠️ Tech Stack & Tools

### Shell & Terminal
![Zsh](https://img.shields.io/badge/Shell-Zsh-4EAA25?logo=gnu-bash&logoColor=white)
![Bash](https://img.shields.io/badge/Shell-Bash-4EAA25?logo=gnu-bash&logoColor=white)
![Kitty](https://img.shields.io/badge/Terminal-Kitty-000000?logo=kitty&logoColor=white)
![Tmux](https://img.shields.io/badge/Terminal_Multiplexer-Tmux-1BB91F?logo=tmux&logoColor=white)

### Editors & IDEs
![Neovim](https://img.shields.io/badge/Editor-Neovim-57A143?logo=neovim&logoColor=white)
![VSCode](https://img.shields.io/badge/Editor-VSCode-007ACC?logo=visual-studio-code&logoColor=white)

### Web Development
![Nginx](https://img.shields.io/badge/Web_Server-Nginx-009639?logo=nginx&logoColor=white)

### Version Control
![Git](https://img.shields.io/badge/VCS-Git-F05032?logo=git&logoColor=white)

### Development Tools
![EditorConfig](https://img.shields.io/badge/Standard-EditorConfig-FEFEFE?logo=editorconfig&logoColor=black)

## 📁 Repository Structure

```bash
dotfiles/
├── .aliases             # Shell aliases
├── .bashrc              # Bash configuration
├── .config/             # Application configurations
├── .editorconfig        # Editor consistency settings
├── .exports             # Environment variables
├── .functions           # Shell functions
├── .gitconfig           # Git configuration
├── .gitignore           # Global gitignore
├── .zshrc               # Zsh configuration
├── README.md            # This documentation
├── config/              # Application configs
│   ├── kitty/           # Kitty terminal config
│   └── tmux/            # Tmux configuration
├── nginx/               # Nginx configurations
│   └── dev-sites/       # Development site configs
├── nvim/                # Neovim configuration
│   ├── lua/             # Lua modules
│   │   ├── core/        # Core Neovim settings
│   │   ├── plugins/     # Plugin configurations
│   │   └── user/        # Custom user configs
│   └── plugin/          # Plugin files
├── scripts/             # Utility scripts
│   ├── dev/             # Development scripts
│   └── git/             # Git helper scripts
├── system/              # System-specific configurations
└── zsh/                 # Zsh configurations
    └── completions/     # Custom completions
```

## ⚙️ Installation

### Windows (WSL) Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/devalentineomonya/dotfiles.git ~/dotfiles
   ```

2. **Run installation script**:
   ```bash
   cd ~/dotfiles/scripts
   ./install.sh
   ```

3. **Source the new configuration**:
   ```bash
   source ~/.zshrc   # or source ~/.bashrc
   ```

### Linux/macOS Setup

```bash
# Clone the repository
git clone https://github.com/devalentineomonya/dotfiles.git ~/dotfiles

# Create symlinks to home directory
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
# Add other configs as needed

# Install Neovim configuration
mkdir -p ~/dotfiles
ln -s ~/dotfiles/nvim ~/dotfiles/nvim
```

## 🔄 Update & Sync

To update your configurations with the latest changes:

```bash
cd ~/dotfiles
git pull origin main

# Re-run installation to apply updates
./scripts/install.sh

# Reload shell configuration
source ~/.zshrc   # or source ~/.bashrc
```

## 🎨 Customization

### Personalizing Configurations

1. **User-specific settings**:
   - Shell: Edit `~/.exports` for environment variables
   - Aliases: Modify `~/.aliases` for custom shortcuts
   - Functions: Add to `~/.functions` for reusable scripts

2. **Neovim customization**:
   - User configs: `nvim/lua/user/`
   - Plugin settings: `nvim/lua/plugins/`

3. **Add new scripts**:
   Place custom scripts in `scripts/dev/` or `scripts/git/`

### Environment-Specific Settings

Use the `system/` directory for machine-specific configurations that shouldn't be version controlled.

## 🤝 Contributing

Contributions are welcome! Follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a pull request

Please ensure your changes:
- Follow existing coding style
- Include relevant documentation updates
- Are tested on at least one platform

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Maintained by [Valentine Omonya](https://github.com/devalentineomonya)**  
[![GitHub](https://img.shields.io/badge/GitHub-Profile-181717?logo=github)](https://github.com/devalentineomonya)
[![Twitter](https://img.shields.io/badge/Twitter-Follow-1DA1F2?logo=twitter)](https://x.com/devalentine_)
[![Website](https://img.shields.io/badge/Website-Portfolio-FF7139?logo=react)](https://devalentine.me)
