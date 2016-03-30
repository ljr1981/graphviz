note
	description: "[
		Representation of a {GV_EDGE}.
		]"
	design: "[
		Edges are represented as line segments, polylines, or curves 
		in the Euclidean plane. The line segments et al the "links"
		in the notion of "node-link" graphs (or diagrams).
		]"

class
	GV_EDGE

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
	make_with_nodes

feature {NONE} -- Initialization

	make_with_nodes (a_left_node, a_right_node: GV_NODE; a_is_digraph: BOOLEAN)
			-- `make_with_nodes' `a_left_node' and `a_right_node'.
		do
			left_node := a_left_node
			right_node := a_right_node
			is_digraph := a_is_digraph
		end

feature -- Outputs

	statement_out: STRING
			-- <Precursor>
		note
			specification: "[
				edge_stmt	:	(node_id | subgraph) edgeRHS [ attr_list ]
				edgeRHS	:	edgeop (node_id | subgraph) [ edgeRHS ]
				]"
		local
			l_attributes_out: STRING
		do
			create Result.make_empty
			Result.append_string_general (left_node.id.name)
			Result.append_character (' ')
			Result.append_string_general (edgeop)
			Result.append_character (' ')
			Result.append_string_general (right_node.id.name)
			l_attributes_out := attributes_out
			if not l_attributes_out.is_empty then
				Result.append_character (' ')
				Result.append_character ('[')
				Result.append_string_general (attributes_out)
				Result.append_character (']')
			end
			Result.append_character (';')
		end

feature -- Access

	left_node,
	right_node: GV_NODE

	is_digraph: BOOLEAN

	edgeop: STRING
		do
			if is_digraph then
				Result := "->"
			else
				Result := "--"
			end
		end

	toggle_directional_graphing
			-- `toggle_directional_graphing' for `is_digraph'.
		do
			is_digraph := not is_digraph
		end

feature -- Attributes

	arrowhead: 			attached like attribute_tuple_anchor attribute Result := ["normal", "normal", Void, "arrowhead", False] end
	arrowsize: 			attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "arrowsize", False] end
	arrowtail: 			attached like attribute_tuple_anchor attribute Result := ["normal", "normal", Void, "arrowtail", False] end
	constraint:			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "constraint", False] end
	decorate: 			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "decorate", False] end
	dir: 				attached like attribute_tuple_anchor attribute Result := ["forward", "forward", Void, "dir", False] end
	edgehref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgehref", False] end
	edgetarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "edgetarget", False] end
	edgetooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgetooltip", False] end
	edgeURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgeURL", False] end
	head_lp: 			attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "head_lp", False] end
	headclip: 			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "headclip", False] end
	headhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headhref", False] end
	headlabel: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headlabel", False] end
	headport: 			attached like attribute_tuple_anchor attribute Result := ["center", "center", Void, "headport", False] end
	headtarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "headtarget", False] end
	headtooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headtooltip", False] end
	headURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headURL", False] end
	href: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "href", False] end
	id: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "id", False] end
	label: 				attached like attribute_tuple_anchor attribute Result := ["%N", "%N", Void, "label", False] end
	labelangle:			attached like attribute_tuple_anchor attribute Result := [-25, -25, -180, "labelangle", False] end
	labeldistance: 		attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "labeldistance", False] end
	labelfloat:			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "labelfloat", False] end
	labelfontcolor:		attached like attribute_tuple_anchor attribute Result := ["black", "black", Void, "labelfontcolor", False] end
	labelfontname: 		attached like attribute_tuple_anchor attribute Result := ["Times-Roman", "Times-Roman", Void, "labelfontname", False] end
	labelfontsize: 		attached like attribute_tuple_anchor attribute Result := [14, 14, 1, "labelfontsize", False] end
	labelhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labelhref", False] end
	labeltarget: 		attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "labeltarget", False] end
	labeltooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labeltooltip", False] end
	labelURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labelURL", False] end
	layer: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "layer", False] end
	len: 				attached like attribute_tuple_anchor attribute Result := [1.0, 1.0, Void, "len", False] end
	lhead: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "lhead", False] end
	lp: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "lp", False] end
	ltail: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "ltail", False] end
	minlen:				attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "minlen", False] end
	nojustify: 			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "nojustify", False] end
	pos: 				attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "pos", False] end
	samehead: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "samehead", False] end
	sametail: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "sametail", False] end
	style: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "style", False] end
	tail_lp: 			attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "tail_lp", False] end
	tailclip: 			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "tailclip", False] end
	tailhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailhref", False] end
	taillabel: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "taillabel", False] end
	tailport: 			attached like attribute_tuple_anchor attribute Result := ["center", "center", Void, "tailport", False] end
	tailtarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "tailtarget", False] end
	tailtooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailtooltip", False] end
	tailURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailURL", False] end
	URL: 				attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "URL", False] end
	weight:				attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "weight", False] end

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- <Precursor>
		do
			Result := Precursor
			Result.force (arrowhead, "arrowhead")
			Result.force (arrowsize, "arrowsize")
			Result.force (arrowtail, "arrowtail")
			Result.force (constraint, "constraint")
			Result.force (decorate, "decorate")
			Result.force (dir, "dir")
			Result.force (edgehref, "edgehref")
			Result.force (edgetarget, "edgetarget")
			Result.force (edgetooltip, "edgetooltip")
			Result.force (edgeURL, "edgeURL")
			Result.force (head_lp, "head_lp")
			Result.force (headclip, "headclip")
			Result.force (headhref, "headhref")
			Result.force (headlabel, "headlabel")
			Result.force (headport, "headport")
			Result.force (headtarget, "headtarget")
			Result.force (headtooltip, "headtooltip")
			Result.force (headURL, "headURL")
			Result.force (href, "href")
			Result.force (id, "id")
			Result.force (label, "label")
			Result.force (labelangle, "labelangle")
			Result.force (labeldistance, "labeldistance")
			Result.force (labelfloat, "labelfloat")
			Result.force (labelfontcolor, "labelfontcolor")
			Result.force (labelfontname, "labelfontname")
			Result.force (labelfontsize, "labelfontsize")
			Result.force (labelhref, "labelhref")
			Result.force (labeltarget, "labeltarget")
			Result.force (labeltooltip, "labeltooltip")
			Result.force (labelURL, "labelURL")
			Result.force (layer, "layer")
			Result.force (len, "len")
			Result.force (lhead, "lhead")
			Result.force (lp, "lp")
			Result.force (ltail, "ltail")
			Result.force (minlen, "minlen")
			Result.force (nojustify, "nojustify")
			Result.force (pos, "pos")
			Result.force (samehead, "samehead")
			Result.force (sametail, "sametail")
			Result.force (style, "style")
			Result.force (tail_lp, "tail_lp")
			Result.force (tailclip, "tailclip")
			Result.force (tailhref, "tailhref")
			Result.force (taillabel, "taillabel")
			Result.force (tailport, "tailport")
			Result.force (tailtarget, "tailtarget")
			Result.force (tailtooltip, "tailtooltip")
			Result.force (tailURL, "tailURL")
			Result.force (URL, "URL")
			Result.force (weight, "weight")
		ensure then
			count: Result.count = (13 + 52)
			matching: across Result as ic all ic.key.same_string (ic.item.attr_name) end
		end

end
