rollout UI_progressbar "test" width:400 height:100
(
	button doit "Process Scene" -- button to start processing
	dotNetControl doit_prog "Windows.Forms.Progressbar" -- a red progress bar
	

	on UI_progressbar open do
	(
		doit_prog.style = doit_prog.style.continuous
		doit_prog.backColor = (dotNetClass "System.Drawing.Color").darkgreen
		doit_prog.foreColor = (dotNetClass "System.Drawing.Color").limegreen
	)

	on doit pressed do
	(
		objArray = geometry as array -- get all geometry objects into array
		for i = 1 to objArray.count do -- and iterate through all of them
		(
			-- update the progress bar percentage
			-- for example, if there are 20 geometry objects
			-- and i is currently 1, you have 100.0*1/20 = 5%
			-- when i is 2 you have 100.0*2/20 = 10% etc...
			doit_prog.value = 100.*i/objArray.count
			-- do something with the objects, like printing their names
			print objArray[i].name
		)-- end i loop
		doit_prog.value = 0 -- when ready, reset the progress bar to 0%
	)
)
createdialog UI_progressbar