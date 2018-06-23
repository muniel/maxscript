--Get script folder path.
symbolicPaths.expandFileName "$scripts\\"

--Get icon folder path.
symbolicPaths.expandFileName "$icons\\"

--Execute external script.
filein <filepath>\<scriptname>.ms

--Create folder at specified path.
makeDir <filepath>

--Delete file at specified path.
deleteFile <filepath>

--Rename file at specified path.
renameFile <old_filepath_name> <new_filepath_name>

--Copy file at specified path.
copyFile <old_filepath_name> <new_filepath_name>