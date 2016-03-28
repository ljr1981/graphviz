note
	description: "[
		Representation of a {GV_NODE}.
		]"
	synopsis: "[
		Graphs are frequently drawn as node-link diagrams 
		in which the vertices are represented as disks, 
		boxes, or textual labels. {GV_NODE} is the "node"
		part of the node-link in a diagram (graph).
		]"

class
	GV_NODE

inherit
	GV_ANY

	GV_ATTRIBUTE_HELPER
		redefine
			attribute_list
		end

feature -- Attributes

	area: 			attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "area"] end
	distortion: 	attached like attribute_tuple_anchor attribute Result := [0.00, 0.00, -100.00, "distortion"] end
	fixedsize:		attached like attribute_tuple_anchor attribute Result := [False, False, Void, "fixedsize"] end
	gradientangle: 	attached like attribute_tuple_anchor attribute Result := ["", "", Void, "gradientangle"] end
	group: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "group"] end
	height: 		attached like attribute_tuple_anchor attribute Result := [0.5, 0.2, Void, "height"] end
	image: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "image"] end
	imagescale: 	attached like attribute_tuple_anchor attribute Result := [False, False, Void, "imagescale"] end
	margin: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "margin"] end
	orientation: 	attached like attribute_tuple_anchor attribute Result := [0, 360, Void, "orientation"] end
	penwidth: 		attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "penwidth"] end
	peripheries: 	attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "peripheries"] end
	pin: 			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "pin"] end
	rects: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "rects"] end
	regular: 		attached like attribute_tuple_anchor attribute Result := [False, False, Void, "regular"] end
	samplepoints: 	attached like attribute_tuple_anchor attribute Result := [8, 8, Void, "samplepoints"] end
	shape: 			attached like attribute_tuple_anchor attribute Result := ["ellipse", "ellipse", Void, "shape"] end
	shapefile: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "shapefile"] end
	sides: 			attached like attribute_tuple_anchor attribute Result := [4, 4, 0, "sides"] end
	skew: 			attached like attribute_tuple_anchor attribute Result := [0, 0, -100, "skew"] end
	vertices: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "vertices"] end
	width: 			attached like attribute_tuple_anchor attribute Result := [0.75, 0.75, 0.01, "width"] end
	z: 				attached like attribute_tuple_anchor attribute Result := [0, 0, -1000, "z"] end

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- <Precursor>
		do
			Result := Precursor
			Result.force (area, "area")
			Result.force (distortion, "distortion")
			Result.force (fixedsize, "fixedsize")
			Result.force (gradientangle, "gradientangle")
			Result.force (group, "group")
			Result.force (height, "height")
			Result.force (image, "image")
			Result.force (imagescale, "imagescale")
			Result.force (margin, "margin")
			Result.force (orientation, "orientation")
			Result.force (penwidth, "penwidth")
			Result.force (peripheries, "peripheries")
			Result.force (pin, "pin")
			Result.force (rects, "rects")
			Result.force (regular, "regular")
			Result.force (samplepoints, "samplepoints")
			Result.force (shape, "shape")
			Result.force (shapefile, "shapefile")
			Result.force (sides, "sides")
			Result.force (skew, "skew")
			Result.force (vertices, "vertices")
			Result.force (width, "width")
			Result.force (z, "z")
		ensure then
			count: Result.count = (13 + 23)
			matching: across Result as ic all ic.key.same_string (ic.item.attr_name) end
		end

;note
	design: "[
		node_stmt ::= node_id [ attr_list ]
		
		node_id ::= ID [ port ]
		
		port ::= ':' ID [ ':' compass_pt ] | ':' compass_pt
		
		compass_pt ::= (n | ne | e | se | s | sw | w | nw | c | _)
		
		attr_list ::= '[' [ a_list ] ']' [ attr_list ]
		
		a_list ::= ID '=' ID [ (';' | ',') ] [ a_list ]
		
		ID ::= {GV_ID}
		]"
end
