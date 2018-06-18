rollout UI_comboBox "test" width:400 height:100
(
	dotNetControl CB "System.Windows.Forms.Combobox" width:350 height:24

	on UI_comboBox open do
	(
		strs = #("Hello","World","of",".NET")
		CB.items.addRange strs
	)
	
	on CB SelectedIndexChanged do
	(
		print CB.text
	)
)
createdialog UI_comboBox