rollout ListViewRo "" width:169 height:225
(
	local lvBits = #("Weasels","Badgers","Stoats","Shrews","Mice","Ocelots","Guinea Pigs")

	fn setupList lv =
	(
		lv.backcolor = lv.backcolor.gray
		lv.forecolor = lv.forecolor.ghostwhite
		lv.view = lv.view.details
		lv.FullRowSelect=true	--Set so full width of listView is selected and not just first column.
		lv.GridLines=false	--Show lines between the items. 
		lv.MultiSelect=true	--Allow for multiple selections. 
		lv.checkboxes = true
		lv.fullrowselect = true
		lv.headerstyle = lv.headerstyle.none
		lv.hideselection = false 
		lv.columns.add "Items" 145
	)

	fn displayListData lv mca = 
	(
		rows = for x in mca collect	
		(
			li=dotNetObject "System.Windows.Forms.ListViewItem" x	--Create a listViewItem object and name it. 
			li.checked = true
			li --Added the listViewItem to the rows array
		)
		lv.items.addRange rows	
	)

	dotNetControl mLv "listview" pos:[6,5] width:157 height:192
	button btnAll "All" pos:[7,201] width:52 height:17
	button BtnNone "None" pos:[59,201] width:52 height:17
	button btnInvert "Invert" pos:[111,201] width:52 height:17

	on ListViewRo open do
	(
		setupList mLv
		displayListData mLv lvBits
	)
	on btnAll pressed do
	for i = 0 to mLv.items.count-1 do mLv.items.item[i].checked = true
	on BtnNone pressed do
	for i = 0 to mLv.items.count-1 do mLv.items.item[i].checked = false
	on btnInvert pressed do
	for i = 0 to mLv.items.count-1 do mLv.items.item[i].checked = not mLv.items.item[i].checked
)
createdialog ListViewRo style:#(#style_toolwindow,#style_sysmenu)