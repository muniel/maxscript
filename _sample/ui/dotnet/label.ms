maxuibg = (colorman.getcolor #background) * 255
bgcolor = (dotnetclass "System.Drawing.Color").FromArgb maxuibg[1] maxuibg[2] maxuibg[3]

rollout UI_label "test" width:400 height:100
(
	dotNetControl LL "System.Windows.Forms.Label"-- width:350 height:24

	on UI_label open do
	(
		LL.text = "eee"
		LL.BackColor = bgcolor
		LL.foreColor  = (dotnetclass "System.Drawing.Color").FromArgb 255 255 255
		LL.font = dotnetobject "System.Drawing.Font" "MSgothic" 12
		LL.width = 50
		LL.height = 20
	)

	on LL click do
	(
		print LL.text
	)
)
createdialog UI_label