rollout UI_dataGridView "Test" width:370 height:210
(
	dotNetControl DGV "System.Windows.Forms.DataGridView"

	on UI_dataGridView open do
	(
		local myCol1 = dotNetObject "System.Windows.Forms.DataGridViewTextBoxColumn"
		myCol1.headerText = "Col1"
		myCol1.width = 100

		local myCol2 = dotNetObject "System.Windows.Forms.DataGridViewTextBoxColumn"
		myCol2.headerText = "Col2"
		myCol2.width = 100

		local myCol3 = dotNetObject "System.Windows.Forms.DataGridViewTextBoxColumn"
		myCol3.headerText = "Col3"
		myCol3.width = 100

		DGV.columns.add myCol1
		DGV.columns.add myCol2
		DGV.columns.add myCol3

		DGV.width = 343
		DGV.height = 200

		for i=0 to 4 do
		(
			DGV.rows.add ()
			DGV.rows.item [i].cells.item [0].value = "Pleaaaaseee"
			DGV.rows.item [i].cells.item [1].value = "hellllllppppp"
			DGV.rows.item [i].cells.item [2].value = "meeeeee!!!"
		)
	) -- on open

	on DGV click s e do
	(
		if e.button == e.button.left then format "Great, you press the LMB! ...at pos: %\n" [e.x, e.y]
		if e.button == e.button.middle then format "Excellent, you pressed the MMB! ...at pos: %\n" [e.x, e.y]
		if e.button == e.button.right then format "Yahooooo, you pressed the RMB! ...at pos: %\n" [e.x, e.y]
	) -- on click
)

createDialog UI_dataGridView
clearListener ()