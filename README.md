# Bettershell
Linux Shell Customization Script like Kali Linux

This script allows you to customize your Linux shell, similar to the shell in Kali Linux. 
It installs and configures the Zsh shell, along with popular plugins such as Zsh-Autosuggestions and Syntax Highlighting. 
Additionally, it sets up some useful aliases to enhance your shell experience.

## Features

- Installs and configures the Zsh shell
- Adds Zsh-Autosuggestions and Syntax Highlighting plugins
- Sets up the `ll` alias for `ls -alF` command
- Sets Zsh as the default shell for all users
- Works on various Linux distributions (tested on Debian Bullseye 11 and Ubuntu 18.04)

## Usage

1. Clone this repository to your local machine:
	git clone https://github.com/Luncer/Bettershell.git
2. Change into the project directory:
	cd BetterShell
3. Make the script executable:
	chmod +x bettershell.sh
4. Execute the script with root privileges:
	sudo ./bettershell.sh
	
5. Follow the prompts and wait for the script to complete.

Once the script finishes running, your Linux shell will be customized with Zsh, Zsh-Autosuggestions, Syntax Highlighting, and the `ll` alias.

## Notes

- The script checks if the zsh-autosuggestions repository is available for Ubuntu 18.04 and adds it if necessary.
- It is recommended to review the script before running it to ensure it meets your requirements and does not conflict with existing configurations.

## License

This project is licensed under the [MIT License](LICENSE).