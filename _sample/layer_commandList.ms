/*
Move layer.
*/
for s in selection do
(
	(layerManager.getLayerFromName "ƒŒƒCƒ„002").addNode s
)

/*
Create layer.(no name)
*/
LayerManager.newLayer() 

/*
Create layer.(edit name)
*/
LayerManager.newLayerFromName "fewfea"

/*
Remove layer.
*/
LayerManager.deleteLayerByName <string>name

/*
Set current layer.
*/
ly = LayerManager.getLayerFromName "Layer001"
ly.current = True

/*
Sarch current layer name.
*/
LayerManager.current.name

/*
Layer count.
*/
LayerManager.count	


/*
Get object in the layer.
*/
for i = 0 to layerManager.count-1 do
(

	ilayer = layerManager.getLayer i
	layerName = ilayer.name
	layer = ILayerManager.getLayerObject i
	layerNodes = refs.dependents layer

	format "Layer: %; nodes: %\n" layerName layerNodes
	for s in layerNodes do(
		if (superclassof s) != ReferenceTarget do
		(
			print "----------------------------"
			print s.name
		)
	)
)