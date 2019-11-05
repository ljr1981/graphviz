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
	make_with_nodes,
	make_as_digraph_with_nodes,
	make_as_graph_with_nodes

feature {NONE} -- Initialization

	make_with_nodes (a_left_node, a_right_node: GV_NODE; a_is_digraph: BOOLEAN)
			-- `make_with_nodes' `a_left_node' and `a_right_node'.
		do
			left_node := a_left_node
			right_node := a_right_node
			is_digraph := a_is_digraph
		end

	make_as_digraph_with_nodes (a_left_node, a_right_node: GV_NODE)
			-- `make_as_digraph_with_nodes' with call to
			-- `make_with_nodes', where `a_is_digraph' is True.
		do
			make_with_nodes (a_left_node, a_right_node, True)
		end

	make_as_graph_with_nodes (a_left_node, a_right_node: GV_NODE)
			-- `make_as_graph_with_nodes' with call to
			-- `make_with_nodes', where `a_is_digraph' is False.
		do
			make_with_nodes (a_left_node, a_right_node, False)
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

feature -- Settings

	set_label (a_label: STRING)
			--
		do
			set_attribute_value (agent label, a_label)
		end

feature -- Attributes

	arrowhead: 			attached like attribute_tuple_anchor attribute Result := ["normal", "normal", Void, "arrowhead", is_unquoted] end
	arrowsize: 			attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "arrowsize", is_unquoted] end
	arrowtail: 			attached like attribute_tuple_anchor attribute Result := ["normal", "normal", Void, "arrowtail", is_unquoted] end
	constraint:			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "constraint", is_unquoted] end
	decorate: 			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "decorate", is_unquoted] end
	dir: 				attached like attribute_tuple_anchor attribute Result := ["forward", "forward", Void, "dir", is_unquoted] end
	edgehref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgehref", is_unquoted] end
	edgetarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "edgetarget", is_unquoted] end
	edgetooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgetooltip", is_unquoted] end
	edgeURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgeURL", is_unquoted] end
	head_lp: 			attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "head_lp", is_unquoted] end
	headclip: 			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "headclip", is_unquoted] end
	headhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headhref", is_unquoted] end
	headlabel: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headlabel", is_unquoted] end
	headport: 			attached like attribute_tuple_anchor attribute Result := ["center", "center", Void, "headport", is_unquoted] end
	headtarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "headtarget", is_unquoted] end
	headtooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headtooltip", is_unquoted] end
	headURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headURL", is_unquoted] end
	href: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "href", is_unquoted] end
	id: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "id", is_unquoted] end
	label: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "label", is_quoted] end
	labelangle:			attached like attribute_tuple_anchor attribute Result := [-25, -25, -180, "labelangle", is_unquoted] end
	labeldistance: 		attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "labeldistance", is_unquoted] end
	labelfloat:			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "labelfloat", is_unquoted] end
	labelfontcolor:		attached like attribute_tuple_anchor attribute Result := ["black", "black", Void, "labelfontcolor", is_unquoted] end
	labelfontname: 		attached like attribute_tuple_anchor attribute Result := ["Times-Roman", "Times-Roman", Void, "labelfontname", is_unquoted] end
	labelfontsize: 		attached like attribute_tuple_anchor attribute Result := [14, 14, 1, "labelfontsize", is_unquoted] end
	labelhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labelhref", is_unquoted] end
	labeltarget: 		attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "labeltarget", is_unquoted] end
	labeltooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labeltooltip", is_unquoted] end
	labelURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labelURL", is_unquoted] end
	layer: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "layer", is_unquoted] end
	len: 				attached like attribute_tuple_anchor attribute Result := [1.0, 1.0, Void, "len", is_unquoted] end
	lhead: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "lhead", is_unquoted] end
	lp: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "lp", is_unquoted] end
	ltail: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "ltail", is_unquoted] end
	minlen:				attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "minlen", is_unquoted] end
	nojustify: 			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "nojustify", is_unquoted] end
	pos: 				attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "pos", is_unquoted] end
	samehead: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "samehead", is_unquoted] end
	sametail: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "sametail", is_unquoted] end
	style: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "style", is_unquoted] end
	tail_lp: 			attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "tail_lp", is_unquoted] end
	tailclip: 			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "tailclip", is_unquoted] end
	tailhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailhref", is_unquoted] end
	taillabel: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "taillabel", is_unquoted] end
	tailport: 			attached like attribute_tuple_anchor attribute Result := ["center", "center", Void, "tailport", is_unquoted] end
	tailtarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "tailtarget", is_unquoted] end
	tailtooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailtooltip", is_unquoted] end
	tailURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailURL", is_unquoted] end
	URL: 				attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "URL", is_unquoted] end
	weight:				attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "weight", is_unquoted] end

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
