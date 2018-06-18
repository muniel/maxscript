try(destroyDialog listview_rollout) catch()
rollout listview_rollout "List View"
(
	local align = dotNetClass "HorizontalAlignment"

	dotNetControl lv "ListView" width:340 height:200 pos:[0,0]

	local headers = #(#("Node", 140, align.Left), #("Comments",140, align.Left))
	fn initLV =
	(
		lv.view = lv.view.Details
		lv.HideSelection = off
		lv.FullRowSelect = on
		lv.MultiSelect = on
		for c in headers do lv.Columns.add c[1] c[2] c[3] 
	)
	fn fillLV =
	(
		lv.items.clear()
		for node in objects as array do 
		(
			item = lv.items.add node.name
			item.tag = dotnetmxsvalue node
		)
	)

-- 	on lv ItemSelectionChanged s a do
-- 	(
-- 		format "item:% selected:% node:%\n" a.item.text a.isSelected a.item.tag.value 
-- 	)
	on lv SelectedIndexChanged s a do
	(
		with undo off 
		(
			nodes = for k=0 to s.selectedItems.count-1 where isvalidnode (node = s.selectedItems.item[k].tag.value) collect node
			if nodes.count == 0 then clearselection() else select nodes
		)
	)

	on listview_rollout open do
	(	
		initLV()
		fillLV()
		ok
	)
)
createDialog listview_rollout 340 200

/* execute to populate the scene:
with undo off
(
delete objects
for k=1 to 20 do box width:10 pos:[k*12,0,0]
)
*/