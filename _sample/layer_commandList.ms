--Move selected objects to specified layer .
for s in selection do(
	(layerManager.getLayerFromName <string>).addNode s
)

--Create layer.(no name)
LayerManager.newLayer()

--Create layer.(edit name)
LayerManager.newLayerFromName <string>

--Remove layer.
LayerManager.deleteLayerByName <string>

--Set current layer.
ly = LayerManager.getLayerFromName <string>
ly.current = True

--Sarch current layer name.
LayerManager.current.name

--Layer count.
LayerManager.count	

--Set hide settings of the specified layer.
(layerManager.getLayerFromName <string>).on = <bool>

--Set freeze settings of the specified layer.
(layerManager.getLayerFromName <string>).lock = <bool>

--Set currrent settings of the specified layer.
(layerManager.getLayerFromName <string>).current = <bool>

--Set showFrozenInGray settings of the specified layer.
(layerManager.getLayerFromName <string>).showFrozenInGray = <bool>

--Get object in the layer.
for i = 0 to layerManager.count-1 do(
	ilayer = layerManager.getLayer i
	layer_name = ilayer.name
	layer_obj = ILayerManager.getLayerObject i
	layerNodes = refs.dependents layer_obj

	format "Layer: %; nodes: %-------------------------------\n" layer_name layerNodes.count
	for s in layerNodes do(
		if (superclassof s) != ReferenceTarget do
		(
			print s.name
		)
	)
)