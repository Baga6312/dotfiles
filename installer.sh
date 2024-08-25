#!/bin/bash 

check_folder_exists() {
  local folder=$1
  if [[ ! -d "$folder" ]]; then
    echo "Folder does not exist: $folder"
    exit 1
  fi
}

 
get_subdirectories() {
  local base_folder=$1
  local -n result_array=$2
  
  result_array=($(find "$base_folder" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;))
}

 
copy_config_files() {
  local source_folder=$1
  local dest_base_folder=$2
  local directories=("${!3}")

 
  local config_files=("$source_folder"/*.config)
  if [[ ! -e "${config_files[0]}" ]]; then
    echo "No .config files found in: $source_folder"
    exit 1
  fi

 
  for config_file in "$source_folder"/*.config; do
    for dir in "${directories[@]}"; do
      cp "$config_file" "$dest_base_folder/$dir/"
      echo "Copied $config_file to $dest_base_folder/$dir/"
    done
  done
}

 
main() {
	local source_folder="$(pwd)"
  local dest_folder="~/.config/"

 
  check_folder_exists "$source_folder"
  check_folder_exists "$dest_folder"

 
  local directories
  get_subdirectories "$dest_folder" directories

 
  copy_config_files "$source_folder" "$dest_folder" directories[@]
  echo "File copying completed."
}

 
main

