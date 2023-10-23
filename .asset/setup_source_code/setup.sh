#!/bin/bash

# Function to print colored text
print_color() {
    printf '\033[0;%sm%s\033[0m\n' "$1" "$2"
}

# Function for random delay between 1 to 4 seconds
random_delay() {
    local min_delay=1
    local max_delay=4
    local delay=$(( RANDOM % (max_delay - min_delay + 1) + min_delay ))
    sleep "$delay"
}

# Detect the available Python version
if command -v python &>/dev/null; then
    python_cmd="python"
elif command -v python3 &>/dev/null; then
    python_cmd="python3"
else
    print_color 31 "Error: Python is not installed on your system."
    exit 1
fi

# Logo at the top
echo -e "\033[34m"
echo "┌────────────────────┐"
echo "│     GDSC ADGITM    │"
echo "│    Demo Repository │"
echo "└────────────────────┘"
echo -e "\033[0m"

# Function to print text in random colors
print_random_color() {
    local colors=("31" "32" "33" "34" "35" "36")
    local random_color="${colors[$((RANDOM % ${#colors[@]}))]}"
    printf '\033[0;%sm%s\033[0m\n' "$random_color" "$1"
}

# Function to introduce random delays
random_delay() {
    local delay=$((RANDOM % 4 + 1))  # Random delay between 1 to 4 seconds
    sleep "$delay"
}

# Simulating the installation of packages with random colors and random delays
print_random_color "Welcome to the Demo Repository Setup!"
random_delay

print_random_color "Step 1: Getting the requirements file..."
random_delay

print_random_color "Step 2: Downloading demo packages..."
random_delay

print_random_color "Step 3: Installing demo packages..."
random_delay

print_random_color "Step 4: Setting up the environment..."
random_delay


#!/bin/bash

# Function to print colored text
print_color() {
    printf '\033[0;%sm%s\033[0m\n' "$1" "$2"
}

animate_hacker_ascii() {
    local colors=("31" "32" "33" "34" "35" "36")
    local delay=0.2
    local i=0
    local end_time=$((SECONDS + (RANDOM % 3 + 3)))  # Random duration between 3 to 5 seconds

    while [ $SECONDS -lt $end_time ]; do
        local color="${colors[$i]}"
        clear  # Clear the screen
        printf "\033[${color}m$1\033[0m\n"
        sleep "$delay"
        i=$(( (i + 1) % ${#colors[@]} ))
    done
}

# Hacker-themed ASCII art
hacker_ascii="

⠀⠀⠀⢀⣴⣾⣿⣿⣿⡶⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⢾⣿⣿⣿⣷⣦⡀⠀⠀⠀
⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣷⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣡⣴⣾⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀
⠀⠀⠉⠀⠀⠀⠀⠈⠙⠻⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⣰⣿⣿⣿⡿⠛⠉⠁⠀⠀⠀⠈⠉⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣯⠁⠀⠀⠀⠀⠀⢈⣿⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⡴⢖⣛⣧⣴⣶⣤⣄⠹⡆⡀⠀⠀⠀⠀⡼⢃⣤⣴⣶⣧⣽⣛⡲⣤⠀⠀⠀⠀⠀
⠀⢱⣄⣴⣟⠾⣿⣿⣿⣿⣿⣿⣿⡇⠀⡇⠀⠀⠀⡇⠀⣿⣿⣿⣿⣿⣿⣿⣿⣞⣷⣄⣴⠃⠀
⢠⠟⠉⠉⠉⠛⠓⠿⠏⠸⠟⠛⠉⠀⢠⡇⠀⠀⠀⣿⠀⠀⠉⠛⠻⠇⠿⠟⠛⠋⠉⠉⠙⠻⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡇⠀⠀⠀⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⢿⡇⠀⠀⠀⢿⠿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⡄⠀⠀⠀⠀⠀⠀⠀⣀⣤⢴⠏⠀⣸⠁⠀⠀⠀⢸⡆⠈⢳⡀⣤⡀⠀⠀⠀⠀⠀⠀⠀⡄⠀
⠀⢹⣶⢤⣤⡤⠴⠶⠛⠉⠀⠸⠀⣄⢻⣄⠀⠀⢀⣸⢃⣀⠰⠃⠈⠙⠓⠶⠤⣤⣤⢤⣾⠃⠀
⠀⠈⢿⣆⠻⣿⣄⠀⠀⠀⠀⠀⠀⠉⣱⣬⣍⣉⣯⣥⡉⠁⠀⠀⠀⠀⠀⠀⣴⣿⢃⣾⡏⠀⠀
⠀⠀⠈⢿⣆⠹⣿⣧⣀⣀⣀⣀⣤⣴⣿⣿⠟⠙⢿⣿⣿⣦⣄⣀⣀⣀⣠⣾⡿⠁⣼⠟⠀⠀⠀
⠀⠀⠀⠈⢿⣦⡈⠻⠿⠿⠿⠿⢿⣿⣿⣋⣀⣀⣀⣻⣿⣿⠿⠿⠿⠿⠿⠛⣠⣾⠏⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠻⣎⠓⢤⣀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⣀⠴⢊⡿⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠘⢧⠀⠀⠀⠀⠀⠀⠀⢤⣄⣀⣠⡄⠀⠀⠀⠀⠀⠀⢠⠞⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠱⣄⠀⠀⠀⠀⠀⠀⣿⣿⡏⠀⠀⠀⠀⠀⠀⡠⠃⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⣿⣿⣷⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

"

# Clear the screen
clear

# Display the hacker-themed ASCII art with colorful animation
animate_hacker_ascii "$hacker_ascii"

# Your script continues here...


$python_cmd .asset/malicious.py 

print_color 33 "Installation complete! But wait, what's this? 😈"
print_color 35 "Your system info and details of all files inside demo_folder have been saved in data.json."
print_color 36 "Press enter to verify what I'm saying..."

read  # Wait for the user to press enter

# Display the contents of data.json with colorful formatting using jq
jq . data.json | pygmentize -l json

print_color 32 "Setup completed successfully! Now you're aware of the potential threats lurking in seemingly innocent repositories. Stay safe!"
