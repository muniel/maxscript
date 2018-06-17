/*
Set the following color items with animation disabled.
Wirecolor, ViewportBG, Tint color, Ambient color
*/

struct GlobalColorManager
(

	-- Get current viewport background color.
	viewportBG_color = getVPortBGcolor()
	,
	-- Get current tint color.
	globalTint_color = lightTintColor
	,
	-- Get current ambien color.
	globalAmbient_color = ambientColor
	,
	
	fn get_wire_color  =
	(
		try
		(
			if selection.count == 1 then(return $.wirecolor)
			else(return (color 0 0 0))
		)
		catch
		(
			return (color 0 0 0)
		)
	)
	,
	
	wire_col = GlobalColorManager.get_wire_color()
	,

	fn math_color_float a =
	(
		return (a /255)
	)
	,

	fn math_color_integer a =
	(
		return ((255 * a) as integer)
	)
	,

	fn createUI =(		
		rollout viewport_color_pick "Viewport Color Changer"
		(
			
			colorpicker wireColor "wire color:              " modal:false color:wire_col
			colorpicker vbgColor "viewportBG color:   " modal:false color:viewportBG_color
			colorpicker tintColor "globalTint color:      " modal:false color:globalTint_color
			colorpicker ambColor "globalAmbient color:" modal:false color:globalAmbient_color
			
			on wireColor changed new_col do
			(
				$.wirecolor = new_col
			)
			on vbgColor changed new_col do
			(
				animate off
				(
					SetUIColor 41[
						GlobalColorManager.math_color_float new_col.r,
						GlobalColorManager.math_color_float new_col.g,
						GlobalColorManager.math_color_float new_col.b]
				)
				forceCompleteredraw doDisabled:true
			)
			on tintColor changed new_col do
			(
				animate off(lightTintColor = new_col)
				forceCompleteredraw doDisabled:true
			)
			on ambColor changed new_col do
			(
				animate off(ambientColor = new_col)
				forceCompleteredraw doDisabled:true
			)
		)
		createDialog viewport_color_pick
	)
)

GCM = GlobalColorManager()
GCM.createUI()