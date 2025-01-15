#!/bin/bash

SERVER_IP="localhost"
CHAT_DIR="/var/chat_system"
CHAT_LOG="$CHAT_DIR/chat_log.txt"

function send_message() {
	echo -n "Enter your message: "
	read message
	if [[ -n "$message" ]]; then
		# Append username and message to the log file on the server
		ssh "$USER@$SERVER_IP" "echo \"[\$(date + '%Y-%m-%d %H:%M:%S')] $USER: $message\" >> $CHAT_LOG"
	else
		echo "Message cannot be empty!"
	fi
}

function read_message() {
	ssh "$USER@$SERVER_IP" "cat $CHAT_LOG"
}

function chat_menu() {
	while true
	do
		echo "1. Send a message"
		echo "2. View chat log"
		echo "3. Exit"
		echo -n "Choose an option"
		read choice

		case $choice in 
			1) send_message ;;
			2) read_message ;;
			3) echo "Exiting"; break;;
			*) echo "Invalid choice" ;;
		esac
	done
}

chat_menu
