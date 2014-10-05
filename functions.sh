# Includes NareshPS_vimrc
initialize_NareshPS_vimrc() {
  echo "" >> $VIMRC_MAIN_PATH
  echo '" Loads NareshPS vim configuration' >> $VIMRC_MAIN_PATH
  echo "source $NARESHPS_VIMRC_PATH" >> $VIMRC_MAIN_PATH

  echo "Creating directory: $NARESHPS_VIM_UNDO_DIR" && mkdir -p $NARESHPS_VIM_UNDO_DIR || exit 2
  echo "Creating directory: $NARESHPS_VIM_SWPFILES_DIR" && mkdir -p $NARESHPS_VIM_SWPFILES_DIR || exit 2
}
