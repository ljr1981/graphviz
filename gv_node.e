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
	GV_STATEMENT
		undefine
			out
		end

	GV_ATTRIBUTE_HELPER
		redefine
			attribute_list
		end

create
	make_with_id

feature {NONE} -- Initialization

	make_with_id (a_id: GV_ID)
			-- `make_with_id' `a_id'.
		do
			id := a_id
		end

feature -- Output

	statement_out: STRING
			-- <Precursor>
		note
			specification: "[
				node_stmt	:	node_id [ attr_list ]
				]"
		local
			l_attributes_text: STRING
		do
			create Result.make_empty
			l_attributes_text := attributes_out
			if not l_attributes_text.is_empty then
				Result.append_string_general ("node")
				Result.append_character (' ')
				Result.append_character ('[')
				Result.append_string_general (l_attributes_text)
				Result.append_character (']')
				Result.append_character (';')
			end
		end

feature -- Attributes

	id: GV_ID
			-- `id' of Current {GV_NODE}.

	area: 			attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "area", is_unquoted] end
	distortion: 	attached like attribute_tuple_anchor attribute Result := [0.00, 0.00, -100.00, "distortion", is_unquoted] end
	fixedsize:		attached like attribute_tuple_anchor attribute Result := [False, False, Void, "fixedsize", is_unquoted] end
	gradientangle: 	attached like attribute_tuple_anchor attribute Result := ["", "", Void, "gradientangle", is_unquoted] end
	group: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "group", is_unquoted] end
	height: 		attached like attribute_tuple_anchor attribute Result := [0.5, 0.5, 0.2, "height", is_unquoted] end
	image: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "image", is_quoted] end
	imagescale: 	attached like attribute_tuple_anchor attribute Result := [False, False, Void, "imagescale", is_unquoted] end
	margin: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "margin", is_unquoted] end
	orientation: 	attached like attribute_tuple_anchor attribute Result := [0, 0, 360, "orientation", is_unquoted] end
	penwidth: 		attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "penwidth", is_unquoted] end
	peripheries: 	attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "peripheries", is_unquoted] end
	pin: 			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "pin", is_unquoted] end
	rects: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "rects", is_unquoted] end
	regular: 		attached like attribute_tuple_anchor attribute Result := [False, False, Void, "regular", is_unquoted] end
	samplepoints: 	attached like attribute_tuple_anchor attribute Result := [8, 8, Void, "samplepoints", is_unquoted] end
	shape: 			attached like attribute_tuple_anchor attribute Result := ["ellipse", "ellipse|doublecircle|circle", Void, "shape", is_unquoted] end
	shapefile: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "shapefile", is_unquoted] end
	sides: 			attached like attribute_tuple_anchor attribute Result := [4, 4, 0, "sides", is_unquoted] end
	skew: 			attached like attribute_tuple_anchor attribute Result := [0, 0, -100, "skew", is_unquoted] end
	vertices: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "vertices", is_unquoted] end
	width: 			attached like attribute_tuple_anchor attribute Result := [0.75, 0.75, 0.01, "width", is_unquoted] end
	z: 				attached like attribute_tuple_anchor attribute Result := [0, 0, -1000, "z", is_unquoted] end

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
