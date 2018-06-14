spe = 3
node_ctrl = geometry
ctrl_count = node_ctrl.count

fn fn_sel_obj a =
(
	/*
	Execute the select process by the key pressed.
	*/
	try
	(
		args = getNodeByName a
		--Pressed alt key.
		if keyboard.altPressed then
		(
			if args.isSelected do deselect args
		)
		--Pressed ctrl key.
		else if keyboard.controlPressed then
		(
			if args.isSelected then (deselect args) else (selectMore args)
		)
		--No pressed.
		else select args
	) catch("error")
)

fn ui_create =
(
	/*
	Ui create.
	*/
	str = "rollout ro_test \"Test\" (\n"
	clearSelection()
	for i = 1 to ctrl_count do (
		name_ctrl = node_ctrl[i].name
		-- UI Declaration
		str += "button bt_" + name_ctrl + " \"" + name_ctrl + "\"\n"
		-- Event handlers
		str += "on bt_" + name_ctrl + " pressed do (\n"
		str += "fn_sel_obj \"" + name_ctrl + "\""
		str += ")\n"
	)
	str += ")\n"
	createDialog (execute str) width:100 height:(ctrl_count * 23 + spe * (ctrl_count - 1) + spe * 2)
)

ui_create()