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

feature -- Access

	attribute_list_out: STRING
			-- `attribute_list_out' from `attribute_list'.
		do
			create Result.make_empty
			across
				attribute_list as ic_list
			loop
				if attached ic_list.item.node_value as al_value then
					Result.append_string (ic_list.key + "=" + al_value.out + ",")
				end
			end
			if not Result.is_empty then
				Result.remove_tail (1)
			end
		end

	attribute_list: HASH_TABLE [TUPLE [node_value: detachable ANY; node_default: detachable ANY; node_minimum: detachable NUMERIC], STRING]
			-- `attribute_list' (e.g. attr_list)
		note
			bnf: "[
				attr_list ::= '[' [ a_list ] ']' [ attr_list ]
				
				a_list ::= ID '=' ID [ (';' | ',') ] [ a_list ]
				
				ID ::= {GV_ID}
				]"
		do
			create Result.make (24)
				-- Node only
						-- [value, default, minimum], name
			Result.force ([Void, 0.00, -100.0], "distortion")
			Result.force ([Void, False, Void], "fixedsize")
			Result.force ([Void, "", Void], "group")
			Result.force ([Void, 0.5, 0.2], "height")
			Result.force ([Void, "", Void], "image")
			Result.force ([Void, False, Void], "imagescale")
			Result.force ([Void, 0, 360], "orientation")
			Result.force ([Void, False, Void], "pin")
			Result.force ([Void, Void, Void], "rects")
			Result.force ([Void, False, Void], "regular")
			Result.force ([Void, 8, Void], "samplepoints")
			Result.force ([Void, "elipse", Void], "shape")
			Result.force ([Void, "", Void], "shapefile")
			Result.force ([Void, 4, 0], "sides")
			Result.force ([Void, 0, -100], "skew")
			Result.force ([Void, Void, Void], "vertices")
			Result.force ([Void, 0.75, 0.01], "width")
			Result.force ([Void, 0, -1000], "z")
				-- Node and NCG, NE, NEC, NGC ...
			Result.force ([Void, 0, 0], "gradientangle")
			Result.force ([Void, 0.00, 0.00], "margin")
			Result.force ([Void, Void, Void], "xlp")
			Result.force ([Void, "lightgrey", Void], "fillcolor")
			Result.force ([Void, "", Void], "tooltip")
			Result.force ([Void, "c", Void], "labelloc")
				-- Node and GCN, GCNE, GN ...
			Result.force ([Void, 0, 0], "sortv")
			Result.force ([Void, "", Void], "href")
			Result.force ([Void, "", Void], "id")
			Result.force ([Void, False, Void], "nojustify")
			Result.force ([Void, "", Void], "ordering")
			Result.force ([Void, False, Void], "root")
				-- Node and EN, ENC, ENCG, ENG, ENGC ...
			Result.force ([Void, Void, Void], "pos")
			Result.force ([Void, "", Void], "xlabel")
			Result.force ([Void, "black", Void], "color")
			Result.force ([Void, "", Void], "layer")
			Result.force ([Void, "", Void], "colorscheme")
			Result.force ([Void, "", Void], "style")
			Result.force ([Void, "", Void], "comment")
			Result.force ([Void, 0, 0], "showboxes")
			Result.force ([Void, "<none>", Void], "URL")
			Result.force ([Void, "black", Void], "fontcolor")
			Result.force ([Void, "Times-Roman", Void], "fontname")
			Result.force ([Void, 14, 1], "fontsize")
			Result.force ([Void, "%N", Void], "label")
			Result.force ([Void, "<none>", Void], "target")
		end

	area: like node_value do Result := node_value ("area") end
	color: like node_value do Result := node_value ("color") end
	colorscheme: like node_value do Result := node_value ("colorscheme") end
	comment: like node_value do Result := node_value ("comment") end
	distortion: like node_value do Result := node_value ("distortion") end
	fillcolor: like node_value do Result := node_value ("fillcolor") end
	fixedsize: like node_value do Result := node_value ("fixedsize") end
	fontcolor: like node_value do Result := node_value ("fontcolor") end
	fontname: like node_value do Result := node_value ("fontname") end
	fontsize: like node_value do Result := node_value ("fontsize") end
	gradientangle: like node_value do Result := node_value ("gradientangle") end
	group: like node_value do Result := node_value ("group") end
	height: like node_value do Result := node_value ("height") end
	href: like node_value do Result := node_value ("href") end
	id: like node_value do Result := node_value ("id") end
	image: like node_value do Result := node_value ("image") end
	imagescale: like node_value do Result := node_value ("imagescale") end
	label: like node_value do Result := node_value ("label") end
	labelloc: like node_value do Result := node_value ("labelloc") end
	layer: like node_value do Result := node_value ("layer") end
	margin: like node_value do Result := node_value ("margin") end
	nojustify: like node_value do Result := node_value ("nojustify") end
	ordering: like node_value do Result := node_value ("ordering") end
	orientation: like node_value do Result := node_value ("orientation") end
	peripheries: like node_value do Result := node_value ("peripheries") end
	pin: like node_value do Result := node_value ("pin") end
	pos: like node_value do Result := node_value ("pos") end
	rects: like node_value do Result := node_value ("rects") end
	regular: like node_value do Result := node_value ("regular") end
	root: like node_value do Result := node_value ("root") end
	samplepoints: like node_value do Result := node_value ("samplepoints") end
	shape: like node_value do Result := node_value ("shape") end
	shapefile: like node_value do Result := node_value ("shapefile") end
	showboxes: like node_value do Result := node_value ("showboxes") end
	sides: like node_value do Result := node_value ("sides") end
	skew: like node_value do Result := node_value ("skew") end
	sortv: like node_value do Result := node_value ("sortv") end
	style: like node_value do Result := node_value ("style") end
	target: like node_value do Result := node_value ("target") end
	tooltip: like node_value do Result := node_value ("tooltip") end
	URL: like node_value do Result := node_value ("URL") end
	vertices: like node_value do Result := node_value ("vertices") end
	width: like node_value do Result := node_value ("width") end
	xlabel: like node_value do Result := node_value ("xlabel") end
	xlp: like node_value do Result := node_value ("xlp") end
	z: like node_value do Result := node_value ("z") end

	node_value (a_node_name: STRING): detachable STRING
		require
			attribute_list.has_key (a_node_name)
		do
			if attached attribute_list.item (a_node_name) as al_value and then
				attached al_value.node_value as al_node_value
			then
				Result := al_node_value.out
			end
		end

note
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
