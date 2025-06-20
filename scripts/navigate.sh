#!/bin/bash

# Function to navigate through directories
navigate() {
  previous_dir=$(pwd)  # Store the initial directory

  while true; do
    # List directories and number them (only once)
    dirs=$(ls -1p | grep /)
    echo -e "\n📂 Directories:"
    echo "$dirs" | nl -s " 📂 "

    # Instructions
    echo -e "\n💡 Commands:"
    echo -e "'b' 👉 back (Parent Dir)"
    echo -e "'n' 👉 next (Next Dir)"
    echo -e "'e' 👉 exit (Stop)"
    echo -e "Type any other command to execute (e.g., 'code .', 'npm run dev', etc.)"

    # Prompt user to choose a directory or enter a command
    read -p "💬 Enter command or number: " input

    # Exit the function if 'e' is entered
    if [[ "$input" == "e" ]]; then
      echo -e "\n👋 Exiting navigation loop."

      return 1  # Return from the function (stop the loop and return to the main shell)
    fi

    # Go to the next directory if 'n' is entered
    if [[ "$input" == "n" ]]; then
      next_dir=$(echo "$dirs" | sed -n '2p')  # Get the second directory in the list (next one)
      if [[ -d "$next_dir" ]]; then
        cd "$next_dir"
        echo -e "\n📁 You are now in $(pwd)"
      else
        echo -e "\n🚫 No next directory found."
      fi
      continue
    fi

    # Go back to the parent directory if 'b' is entered
    if [[ "$input" == "b" ]]; then
      cd ..
      echo -e "\n📁 You are now in $(pwd)"
      continue
    fi

    # Check if the input is a valid directory number
    if [[ "$input" =~ ^[0-9]+$ ]]; then
      dir=$(echo "$dirs" | sed -n "${input}p")
      if [[ -d "$dir" ]]; then
        cd "$dir"
        echo -e "\n📁 You are now in $(pwd)"
      else
        echo -e "\n🚫 Invalid directory choice."
      fi
      continue
    fi

    # Try executing the user-entered command
    eval "$input"
    if [[ $? -eq 0 ]]; then
      echo -e "\n✅ Command executed: '$input'"
    else
      echo -e "\n🚫 Error: Failed to execute '$input'."
    fi

    # Always show the current directory contents after any action
    echo -e "\n📂 Current directory contents:"
    ls -1p | nl -s " 📂 "
  done
}

# Call the function to start navigation
navigate
