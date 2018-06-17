fn create_ui =
(
	/*
	Ui create.
	node_ctrl is the array displayed on the ui button.
	*/

	-- Following...Set the node converted from the rig name to an array.
-- 	a = #("rig_aa", "rig_bb")
-- 	node_ctrl = for s in a collect getNodeByName s

	node_ctrl = geometry

	ui_space = 3
	btn_height = 23
	ctrl_count = node_ctrl.count
	str = "Rollout ui procces."

	-- Create a string to be execute.
	str = "rollout ro_test \"Test\" (\n"
	for i = 1 to ctrl_count do
	(
		name_ctrl = node_ctrl[i].name
		-- UI Declaration
		str += "button bt_" + name_ctrl + " \"" + name_ctrl + "\"\n"
		-- Event handlers & select procces.
		str += "on bt_" + name_ctrl + " pressed do (\n"
		str += "select_obj \"" + name_ctrl + "\""
		str += ")\n"
	)
	str += ")\n"

	createDialog (execute str) width:100 height:(ctrl_count * btn_height + ui_space * (ctrl_count - 1) + ui_space * 2)
)

fn select_obj rig_name =
(
	/*
	Execute the select process by the key pressed.
	*/

	try
	(
		-- Get node from name.
		args = getNodeByName rig_name

		-- Pressed alt key.
		if keyboard.altPressed then(
			if args.isSelected do deselect args
		)
		-- Pressed ctrl key.
		else if keyboard.controlPressed then(
			if args.isSelected then deselect args
			else selectMore args
		)
		-- No pressed.
		else select args

	)
	catch("error")
)

create_ui()