#!/bin/bash
# Enhanced Terminal Runner - Execute Commands Quickly
# This script provides an easy way to run common development commands

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Nerd Font Icons
RUN_ICON="🚀"
NODE_ICON="⬢"
GO_ICON="🐹"
PYTHON_ICON="🐍"
RUST_ICON="🦀"
DB_ICON="🗄️"
DOCKER_ICON="🐳"
COMPOSE_ICON="📦"
TEST_ICON="🧪"
BUILD_ICON="🔨"
MAKE_ICON="⚡"
GIT_ICON="🌿"
LINT_ICON="✨"
DEPLOY_ICON="🚀"

# Display header
echo -e "${BOLD}${BLUE}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${BOLD}${BLUE}│            ${CYAN}ENHANCED TERMINAL RUNNER${BLUE}              │${NC}"
echo -e "${BOLD}${BLUE}└─────────────────────────────────────────────────────┘${NC}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to detect project type
detect_project_type() {
    local types=()
    
    # Check for multiple project indicators
    if [ -f "package.json" ]; then
        types+=("node")
    fi
    
    if [ -f "go.mod" ]; then
        types+=("go")
    fi
    
    if [ -f "requirements.txt" ] || [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
        types+=("python")
    fi
    
    if [ -f "Cargo.toml" ]; then
        types+=("rust")
    fi
    
    if [ -f "Dockerfile" ]; then
        types+=("docker")
    fi
    
    if [ -f "docker-compose.yml" ] || [ -f "docker-compose.yaml" ]; then
        types+=("compose")
    fi
    
    if [ -f "Makefile" ] || [ -f "makefile" ]; then
        types+=("make")
    fi
    
    if [ -d ".git" ]; then
        types+=("git")
    fi
    
    if [ ${#types[@]} -eq 0 ]; then
        echo "general"
    else
        printf "%s," "${types[@]}" | sed 's/,$//'
    fi
}

# Display Node.js commands
display_node_commands() {
    echo -e "${NODE_ICON} ${YELLOW}Node.js Commands:${NC}"
    echo -e "${GREEN}1.${NC}  ${CYAN}Start${NC} - npm start"
    echo -e "${GREEN}2.${NC}  ${CYAN}Dev${NC} - npm run dev"
    echo -e "${GREEN}3.${NC}  ${CYAN}Build${NC} - npm run build"
    echo -e "${GREEN}4.${NC}  ${CYAN}Test${NC} - npm test"
    echo -e "${GREEN}5.${NC}  ${CYAN}Install${NC} - npm install"
    echo -e "${GREEN}6.${NC}  ${CYAN}Lint${NC} - npm run lint"
    echo -e "${GREEN}7.${NC}  ${CYAN}PNPM Start${NC} - pnpm start"
    echo -e "${GREEN}8.${NC}  ${CYAN}PNPM Dev${NC} - pnpm dev"
    echo -e "${GREEN}9.${NC}  ${CYAN}PNPM Install${NC} - pnpm install"
    echo -e "${GREEN}10.${NC} ${CYAN}Yarn Start${NC} - yarn start"
    echo -e "${GREEN}11.${NC} ${CYAN}Yarn Dev${NC} - yarn dev"
    echo -e "${GREEN}12.${NC} ${CYAN}Yarn Install${NC} - yarn install"
    echo ""
}

# Display Go commands
display_go_commands() {
    echo -e "${GO_ICON} ${YELLOW}Go Commands:${NC}"
    echo -e "${GREEN}20.${NC} ${CYAN}Run${NC} - go run main.go"
    echo -e "${GREEN}21.${NC} ${CYAN}Build${NC} - go build"
    echo -e "${GREEN}22.${NC} ${CYAN}Test${NC} - go test ./..."
    echo -e "${GREEN}23.${NC} ${CYAN}Tidy${NC} - go mod tidy"
    echo -e "${GREEN}24.${NC} ${CYAN}Download${NC} - go mod download"
    echo -e "${GREEN}25.${NC} ${CYAN}Vet${NC} - go vet ./..."
    echo -e "${GREEN}26.${NC} ${CYAN}Format${NC} - go fmt ./..."
    echo ""
}

# Display Python commands
display_python_commands() {
    echo -e "${PYTHON_ICON} ${YELLOW}Python Commands:${NC}"
    echo -e "${GREEN}30.${NC} ${CYAN}Run${NC} - python main.py"
    echo -e "${GREEN}31.${NC} ${CYAN}Run App${NC} - python app.py"
    echo -e "${GREEN}32.${NC} ${CYAN}Test${NC} - pytest"
    echo -e "${GREEN}33.${NC} ${CYAN}Install Requirements${NC} - pip install -r requirements.txt"
    echo -e "${GREEN}34.${NC} ${CYAN}Activate Venv${NC} - source venv/bin/activate"
    echo -e "${GREEN}35.${NC} ${CYAN}Create Venv${NC} - python -m venv venv"
    echo -e "${GREEN}36.${NC} ${CYAN}Lint (flake8)${NC} - flake8 ."
    echo -e "${GREEN}37.${NC} ${CYAN}Format (black)${NC} - black ."
    echo ""
}

# Display Rust commands
display_rust_commands() {
    echo -e "${RUST_ICON} ${YELLOW}Rust Commands:${NC}"
    echo -e "${GREEN}40.${NC} ${CYAN}Run${NC} - cargo run"
    echo -e "${GREEN}41.${NC} ${CYAN}Build${NC} - cargo build"
    echo -e "${GREEN}42.${NC} ${CYAN}Build Release${NC} - cargo build --release"
    echo -e "${GREEN}43.${NC} ${CYAN}Test${NC} - cargo test"
    echo -e "${GREEN}44.${NC} ${CYAN}Check${NC} - cargo check"
    echo -e "${GREEN}45.${NC} ${CYAN}Format${NC} - cargo fmt"
    echo -e "${GREEN}46.${NC} ${CYAN}Clippy${NC} - cargo clippy"
    echo ""
}

# Display Docker commands
display_docker_commands() {
    echo -e "${DOCKER_ICON} ${YELLOW}Docker Commands:${NC}"
    echo -e "${GREEN}50.${NC} ${CYAN}Build Image${NC} - docker build -t app ."
    echo -e "${GREEN}51.${NC} ${CYAN}Run Container${NC} - docker run -p 8080:8080 app"
    echo -e "${GREEN}52.${NC} ${CYAN}Run Interactive${NC} - docker run -it app /bin/bash"
    echo -e "${GREEN}53.${NC} ${CYAN}List Images${NC} - docker images"
    echo -e "${GREEN}54.${NC} ${CYAN}List Containers${NC} - docker ps -a"
    echo -e "${GREEN}55.${NC} ${CYAN}Stop All Containers${NC} - docker stop \$(docker ps -q)"
    echo -e "${GREEN}56.${NC} ${CYAN}Remove All Containers${NC} - docker rm \$(docker ps -aq)"
    echo -e "${GREEN}57.${NC} ${CYAN}Prune System${NC} - docker system prune"
    echo ""
}

# Display Docker Compose commands
display_compose_commands() {
    echo -e "${COMPOSE_ICON} ${YELLOW}Docker Compose Commands:${NC}"
    echo -e "${GREEN}60.${NC} ${CYAN}Up${NC} - docker-compose up"
    echo -e "${GREEN}61.${NC} ${CYAN}Up Detached${NC} - docker-compose up -d"
    echo -e "${GREEN}62.${NC} ${CYAN}Down${NC} - docker-compose down"
    echo -e "${GREEN}63.${NC} ${CYAN}Build${NC} - docker-compose build"
    echo -e "${GREEN}64.${NC} ${CYAN}Logs${NC} - docker-compose logs"
    echo -e "${GREEN}65.${NC} ${CYAN}Restart${NC} - docker-compose restart"
    echo -e "${GREEN}66.${NC} ${CYAN}Pull${NC} - docker-compose pull"
    echo -e "${GREEN}67.${NC} ${CYAN}Exec Shell${NC} - docker-compose exec <service> /bin/bash"
    echo ""
}

# Display Make commands
display_make_commands() {
    echo -e "${MAKE_ICON} ${YELLOW}Make Commands:${NC}"
    echo -e "${GREEN}70.${NC} ${CYAN}Make${NC} - make"
    echo -e "${GREEN}71.${NC} ${CYAN}Make Clean${NC} - make clean"
    echo -e "${GREEN}72.${NC} ${CYAN}Make Install${NC} - make install"
    echo -e "${GREEN}73.${NC} ${CYAN}Make Test${NC} - make test"
    echo -e "${GREEN}74.${NC} ${CYAN}Show Targets${NC} - make help"
    echo ""
}

# Display Git commands
display_git_commands() {
    echo -e "${GIT_ICON} ${YELLOW}Git Commands:${NC}"
    echo -e "${GREEN}80.${NC} ${CYAN}Status${NC} - git status"
    echo -e "${GREEN}81.${NC} ${CYAN}Add All${NC} - git add ."
    echo -e "${GREEN}82.${NC} ${CYAN}Commit${NC} - git commit -m \"message\""
    echo -e "${GREEN}83.${NC} ${CYAN}Push${NC} - git push"
    echo -e "${GREEN}84.${NC} ${CYAN}Pull${NC} - git pull"
    echo -e "${GREEN}85.${NC} ${CYAN}Log${NC} - git log --oneline -10"
    echo -e "${GREEN}86.${NC} ${CYAN}Branches${NC} - git branch -a"
    echo ""
}

# Display general commands
display_general_commands() {
    echo -e "${RUN_ICON} ${YELLOW}General Commands:${NC}"
    echo -e "${GREEN}90.${NC} ${CYAN}List Files${NC} - ls -la"
    echo -e "${GREEN}91.${NC} ${CYAN}Disk Space${NC} - df -h"
    echo -e "${GREEN}92.${NC} ${CYAN}Memory Usage${NC} - free -m"
    echo -e "${GREEN}93.${NC} ${CYAN}Process Status${NC} - ps aux"
    echo -e "${GREEN}94.${NC} ${CYAN}Network Ports${NC} - netstat -tlnp"
    echo -e "${GREEN}95.${NC} ${CYAN}System Info${NC} - uname -a"
    echo ""
}

# Display all available commands
display_commands() {
    local project_types=$1
    echo -e "${YELLOW}Detected Project Types:${NC} ${WHITE}$(echo $project_types | tr ',' ' ')${NC}"
    echo ""
    
    IFS=',' read -ra TYPES <<< "$project_types"
    for type in "${TYPES[@]}"; do
        case $type in
            "node") display_node_commands ;;
            "go") display_go_commands ;;
            "python") display_python_commands ;;
            "rust") display_rust_commands ;;
            "docker") display_docker_commands ;;
            "compose") display_compose_commands ;;
            "make") display_make_commands ;;
            "git") display_git_commands ;;
        esac
    done
    
    display_general_commands
    echo -e "${GREEN}q.${NC} ${RED}Exit${NC}"
    echo ""
}

# Execute command based on selection
execute_command() {
    local choice=$1
    
    echo -e "${MAGENTA}Executing...${NC}"
    echo ""
    
    case $choice in
        # Node.js commands (1-19)
        1) npm start ;;
        2) npm run dev ;;
        3) npm run build ;;
        4) npm test ;;
        5) npm install ;;
        6) npm run lint ;;
        7) pnpm start ;;
        8) pnpm dev ;;
        9) pnpm install ;;
        10) yarn start ;;
        11) yarn dev ;;
        12) yarn install ;;
        
        # Go commands (20-29)
        20) go run main.go ;;
        21) go build ;;
        22) go test ./... ;;
        23) go mod tidy ;;
        24) go mod download ;;
        25) go vet ./... ;;
        26) go fmt ./... ;;
        
        # Python commands (30-39)
        30) python main.py ;;
        31) python app.py ;;
        32) pytest ;;
        33) pip install -r requirements.txt ;;
        34) echo "Run: source venv/bin/activate" ;;
        35) python -m venv venv ;;
        36) flake8 . ;;
        37) black . ;;
        
        # Rust commands (40-49)
        40) cargo run ;;
        41) cargo build ;;
        42) cargo build --release ;;
        43) cargo test ;;
        44) cargo check ;;
        45) cargo fmt ;;
        46) cargo clippy ;;
        
        # Docker commands (50-59)
        50) 
            read -p "$(echo -e ${BOLD}${YELLOW}"Enter image name (default: app): "${NC})" image_name
            image_name=${image_name:-app}
            docker build -t $image_name .
            ;;
        51) 
            read -p "$(echo -e ${BOLD}${YELLOW}"Enter image name (default: app): "${NC})" image_name
            image_name=${image_name:-app}
            docker run -p 8080:8080 $image_name
            ;;
        52) 
            read -p "$(echo -e ${BOLD}${YELLOW}"Enter image name (default: app): "${NC})" image_name
            image_name=${image_name:-app}
            docker run -it $image_name /bin/bash
            ;;
        53) docker images ;;
        54) docker ps -a ;;
        55) docker stop $(docker ps -q) 2>/dev/null || echo "No running containers" ;;
        56) docker rm $(docker ps -aq) 2>/dev/null || echo "No containers to remove" ;;
        57) docker system prune -f ;;
        
        # Docker Compose commands (60-69)
        60) docker-compose up ;;
        61) docker-compose up -d ;;
        62) docker-compose down ;;
        63) docker-compose build ;;
        64) docker-compose logs ;;
        65) docker-compose restart ;;
        66) docker-compose pull ;;
        67) 
            read -p "$(echo -e ${BOLD}${YELLOW}"Enter service name: "${NC})" service
            if [ ! -z "$service" ]; then
                docker-compose exec $service /bin/bash
            else
                echo "Service name required"
            fi
            ;;
        
        # Make commands (70-79)
        70) make ;;
        71) make clean ;;
        72) make install ;;
        73) make test ;;
        74) make help 2>/dev/null || make -p | grep "^[a-zA-Z]" | cut -d: -f1 | sort ;;
        
        # Git commands (80-89)
        80) git status ;;
        81) git add . ;;
        82) 
            read -p "$(echo -e ${BOLD}${YELLOW}"Enter commit message: "${NC})" message
            if [ ! -z "$message" ]; then
                git commit -m "$message"
            else
                echo "Commit message required"
            fi
            ;;
        83) git push ;;
        84) git pull ;;
        85) git log --oneline -10 ;;
        86) git branch -a ;;
        
        # General commands (90-99)
        90) ls -la ;;
        91) df -h ;;
        92) free -m ;;
        93) ps aux ;;
        94) netstat -tlnp 2>/dev/null || ss -tlnp ;;
        95) uname -a ;;
        
        *) echo -e "${RED}Invalid choice${NC}" ;;
    esac
}

# Main function
main() {
    local project_types=$(detect_project_type)
    
    echo -e "${CYAN}Current Directory:${NC} $(pwd)"
    echo -e "${CYAN}Available Tools:${NC}"
    
    # Check available tools
    local tools=()
    command_exists "npm" && tools+=("npm")
    command_exists "pnpm" && tools+=("pnpm")
    command_exists "yarn" && tools+=("yarn")
    command_exists "go" && tools+=("go")
    command_exists "python" && tools+=("python")
    command_exists "python3" && tools+=("python3")
    command_exists "cargo" && tools+=("cargo")
    command_exists "docker" && tools+=("docker")
    command_exists "docker-compose" && tools+=("docker-compose")
    command_exists "make" && tools+=("make")
    command_exists "git" && tools+=("git")
    
    if [ ${#tools[@]} -gt 0 ]; then
        echo -e "${GREEN}$(printf "%s " "${tools[@]}")${NC}"
    else
        echo -e "${YELLOW}No development tools detected${NC}"
    fi
    
    echo ""
    
    # Display available commands
    display_commands $project_types
    
    # Get user choice
    read -p "$(echo -e ${BOLD}${BLUE}"Select an option: "${NC})" choice
    
    # Execute command if not exiting
    if [ "$choice" != "q" ]; then
        execute_command $choice
    else
        echo -e "${RED}Exiting...${NC}"
    fi
}

# Run the main function
main

exit 0
