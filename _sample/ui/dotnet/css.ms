maxuibg = (colorman.getcolor #background) * 255
bgcolor = (dotnetclass "System.Drawing.Color").FromArgb maxuibg[1] maxuibg[2] maxuibg[3]
fgcolor = (dotnetclass "System.Drawing.Color").FromArgb 0 0 255

fn DotNetFont fontname size style =
(	
	FontStyle = dotnetclass "System.Drawing.FontStyle";
	fs = case style of
	(
		#regular: FontStyle.regular;
		#bold:	FontStyle.bold;
		#italic:	FontStyle.italic;
		#underline:	FontStyle.underline;
		#strikeout:	FontStyle.strikeout;
		default: FontStyle.regular;
	)
	dotnetobject "System.Drawing.Font" fontname size fs;
)


Rollout arollout "Static Test"
(

	dotNetControl tb "Label" width:180 height:24 

	on arollout open do
	(
		tb.Text = "This is A String" 
		tb.BackColor = bgcolor;
		tb.ForeColor = fgcolor;
		tb.Font = DotNetFont "Times" 16 #bold
	)	

)
createDialog arollout width:250 height:250