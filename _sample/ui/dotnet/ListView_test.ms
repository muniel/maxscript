rollout ListviewBugTest "" ( 

	dotNetControl lv "System.Windows.Forms.ListView" width:380 height:280 align:#center pos:[10,10]

	on ListviewBugTest open do
	(

		-- Setup the listview
		lv.View = (dotNetClass "System.Windows.Forms.View").Details 
		lv.fullRowSelect = true 
		lv.checkBoxes=true

		-- Add Column Headers
		for i =1 to 4 do lv.Columns.add ("Column "+i as string)

		-- Add items to listview
		for x=1 to 5 do
		(
			local newItem = dotNetObject "System.Windows.Forms.ListViewItem" "Col. 1" 
			for whichCol =2 to lv.Columns.count do newItem.SubItems.Add ("Col. " + whichCol as string)
			lv.items.add newItem 
		) 
	)
	on lv SelectedIndexChanged a s do
	(
		print lv.SelectedItems
	)
)
createDialog ListviewBugTest width:400 height:300