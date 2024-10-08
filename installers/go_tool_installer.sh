#!/bin/bash

install_go_tools() {
    # Function to install a tool if it's not already installed
    install_tool_if_needed() {
        local tool_name=$1
        local install_command=$2
        if ! command -v $tool_name &>/dev/null; then
            echo -e "\e[31m$tool_name is not installed. Now installing $tool_name.....\e[0m"
            eval $install_command
        else
            echo -e "\e[32m$tool_name is already installed\e[0m"
        fi
    }

    # Install each tool
    install_tool_if_needed "dalfox" "go install github.com/hahwul/dalfox/v2@latest"
    install_tool_if_needed "subfinder" "go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    install_tool_if_needed "nuclei" "go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
    install_tool_if_needed "waybackurls" "go install -v github.com/tomnomnom/waybackurls@latest"
    install_tool_if_needed "httpx" "go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest"
    install_tool_if_needed "assetfinder" "go install github.com/tomnomnom/assetfinder@latest"
    install_tool_if_needed "gau" "go install github.com/lc/gau/v2/cmd/gau@latest"
    install_tool_if_needed "gf" "go install github.com/tomnomnom/gf@latest && cd ~/Tools && git clone https://github.com/Sherlock297/gf_patterns.git && cd gf_patterns/ && mkdir -p ~/.gf && cp *.json ~/.gf && gf -list"
    install_tool_if_needed "dnsx" "go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
    install_tool_if_needed "naabu" "sudo apt install -y libpcap-dev && go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
    install_tool_if_needed "kxss" "go install github.com/Emoe/kxss@latest"
    install_tool_if_needed "waybackurls" "go install github.com/tomnomnom/waybackurls@latest"
    install_tool_if_needed "katana" "go install github.com/projectdiscovery/katana/cmd/katana@latest"
    install_tool_if_needed "mantra" "go install github.com/MrEmpy/mantra@latest"
    install_tool_if_needed "subjs" "go install github.com/lc/subjs@latest"


    echo -e "\e[32mAll installations are complete.\e[0m"

    #calling copy tools in bin
    copy_tools_bin
}

#function to copy files into bin file
copy_tools_bin() {
    # Define source and destination directories
    SOURCE_DIR="$HOME/go/bin"
    DEST_DIR="/bin"

    # Check if the source directory exists
    if [ -d "$SOURCE_DIR" ]; then
        echo -e "\e[32mSource directory $SOURCE_DIR exists.\e[0m"

        # Copy all files from source to destination
        echo -e "\e[32mCopying all files from $SOURCE_DIR to $DEST_DIR...\e[0m"
        sudo cp "$SOURCE_DIR"/* "$DEST_DIR/"
        echo -e "\e[32mCopying completed.\e[0m"
    else
        echo -e "\e[31mSource directory $SOURCE_DIR does not exist. Please ensure Go binaries are installed.\e[0m"
    fi
}

#calling function
install_go_tools
