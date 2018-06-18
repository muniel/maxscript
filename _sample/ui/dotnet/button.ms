rollout UI_button "test" width:400 height:100
(
	dotNetControl BB "System.Windows.Forms.Button"-- width:350 height:24

	on UI_button open do
	(
		BB.text = "eee"
		BB.foreColor  = (dotnetclass "System.Drawing.Color").FromArgb 0 0 255
		BB.backColor  = (dotnetclass "System.Drawing.Color").FromArgb 70 70 70
		BB.font = dotnetobject "System.Drawing.Font" "MSgothic" 12
		BB.width = 100
		BB.height = 40
	)

	on BB click do
	(
		print BB.text
	)
)
createdialog UI_button