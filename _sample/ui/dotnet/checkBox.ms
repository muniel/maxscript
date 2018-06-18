rollout UI_checkBox "test" width:400 height:100
(
	dotNetControl CB "System.Windows.Forms.CheckBox"-- width:350 height:24

	on UI_checkBox open do
	(
		CB.width = 15
		CB.height = 15
	)

	on CB Click do
	(
		print CB.checked
	)
)
createdialog UI_checkBox