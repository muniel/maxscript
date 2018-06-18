struct TransformControllerLock
(
	fn edit_trackview_filter class_prs =
	(
		trackviews.current.clearFilter #all
		if class_prs == "pos" then
			(trackviews.current.setFilter #hierarchy #objects #transforms #selectedObjects #position)
		else if class_prs == "rot" then(trackviews.current.setFilter #hierarchy #objects #transforms #selectedObjects #rotation)
		else if class_prs == "sca"then(trackviews.current.setFilter #hierarchy #objects #transforms #selectedObjects #scale)
	)
	,

	fn edit_trackview_select =
	(
		ind = trackviews.current.getIndex $
		trackviews.current.selectTrackByIndex (ind+2) true
	)
	,

	fn get_infomation judge_bool =
	(
		theAnims = #()
		theClients = #()
		theSubNums = #()
		for i in 1 to trackviews.current.numSelTracks() do
		(
			local theParent = trackviews.current.getParentOfSelected i
			if theParent != undefined do
			(
				append theClients theParent --collecttheparrent
				local theSubnum = trackviews.current.getSelectedSubNum i
				local theSubanim = getsubAnim theParent theSubnum
				append theAnims theSubanim -- collectthe subanim
				append theSubNums theSubnum -- collect the index
			)
		)
		
		if judge_bool == "true" then
		(
			lockedTracksMan.SetLocks true theAnims theClients theSubNums false
		)
		else if judge_bool == "false" then
		(
			lockedTracksMan.SetLocks false theAnims theClients theSubNums true
		)
	)
	,

	fn createUI =(		
		rollout viewport_color_pick "Viewport Color Changer"
		(
			
			checkbox posCBox "position" --triState:wire_col align:#center
			checkbox rotCBox "rotation" --triState:viewportBG_default_color align:#center
			checkbox scaCBox "scale" --triState:globalTint_default_color align:#center

			button runButton "OK"
			button cancelButton "CANCEL"

			on runButton pressed do
			(
				select_objects = for s in selection collect s
				transform_lock_index = #{}

				trackview.open "Trackview_edit"
				for s in select_objects do
				(
					select s
					-------------------------------------------------------------------position
					TransformControllerLock.edit_trackview_filter "pos"
					TransformControllerLock.edit_trackview_select()
					if posCBox.state == true then
					(
						TransformControllerLock.get_infomation "true"
						transform_lock_index += #{1..3}
					)
					else if posCBox.state == false then
					(
						TransformControllerLock.get_infomation "false"
					)
					-------------------------------------------------------------------rotation
					TransformControllerLock.edit_trackview_filter "rot"
					TransformControllerLock.edit_trackview_select()
					if rotCBox.state == true then
					(
						TransformControllerLock.get_infomation "true"
						transform_lock_index += #{4..6}
					)
					else if rotCBox.state == false then
					(
						TransformControllerLock.get_infomation "false"
					)
					-------------------------------------------------------------------scale
					TransformControllerLock.edit_trackview_filter "sca"
					TransformControllerLock.edit_trackview_select()
					if scaCBox.state == true then
					(
						TransformControllerLock.get_infomation "true"
						transform_lock_index += #{7..9}
					)
					else if scaCBox.state == false then
					(
						TransformControllerLock.get_infomation "false"
					)
					-------------------------------------------------------------------
					setTransformLockFlags $ transform_lock_index
				)
				trackview.close "Trackview_edit"
				select select_objects
			)
		)
		createDialog viewport_color_pick
	)
)

TCL = TransformControllerLock()
TCL.createUI()