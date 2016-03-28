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
	GV_ANY

	GV_ATTRIBUTE_HELPER
		redefine
			attribute_list
		end

feature -- Attributes

	arrowhead: 			attached like attribute_tuple_anchor attribute Result := ["normal", "normal", Void, "arrowhead"] end
	arrowsize: 			attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "arrowsize"] end
	arrowtail: 			attached like attribute_tuple_anchor attribute Result := ["normal", "normal", Void, "arrowtail"] end
	constraint:			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "constraint"] end
	decorate: 			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "decorate"] end
	dir: 				attached like attribute_tuple_anchor attribute Result := ["forward", "forward", Void, "dir"] end
	edgehref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgehref"] end
	edgetarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "edgetarget"] end
	edgetooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgetooltip"] end
	edgeURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "edgeURL"] end
	head_lp: 			attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "head_lp"] end
	headclip: 			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "headclip"] end
	headhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headhref"] end
	headlabel: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headlabel"] end
	headport: 			attached like attribute_tuple_anchor attribute Result := ["center", "center", Void, "headport"] end
	headtarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "headtarget"] end
	headtooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headtooltip"] end
	headURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "headURL"] end
	href: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "href"] end
	id: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "id"] end
	label: 				attached like attribute_tuple_anchor attribute Result := ["%N", "%N", Void, "label"] end
	labelangle:			attached like attribute_tuple_anchor attribute Result := [-25, -25, -180, "labelangle"] end
	labeldistance: 		attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "labeldistance"] end
	labelfloat:			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "labelfloat"] end
	labelfontcolor:		attached like attribute_tuple_anchor attribute Result := ["black", "black", Void, "labelfontcolor"] end
	labelfontname: 		attached like attribute_tuple_anchor attribute Result := ["Times-Roman", "Times-Roman", Void, "labelfontname"] end
	labelfontsize: 		attached like attribute_tuple_anchor attribute Result := [14, 14, 1, "labelfontsize"] end
	labelhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labelhref"] end
	labeltarget: 		attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "labeltarget"] end
	labeltooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labeltooltip"] end
	labelURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "labelURL"] end
	layer: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "layer"] end
	len: 				attached like attribute_tuple_anchor attribute Result := [1.0, 1.0, Void, "len"] end
	lhead: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "lhead"] end
	lp: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "lp"] end
	ltail: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "ltail"] end
	minlen:				attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "minlen"] end
	nojustify: 			attached like attribute_tuple_anchor attribute Result := [False, False, Void, "nojustify"] end
	pos: 				attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "pos"] end
	samehead: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "samehead"] end
	sametail: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "sametail"] end
	style: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "style"] end
	tail_lp: 			attached like attribute_tuple_anchor attribute Result := [0, 0, Void, "tail_lp"] end
	tailclip: 			attached like attribute_tuple_anchor attribute Result := [True, True, Void, "tailclip"] end
	tailhref: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailhref"] end
	taillabel: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "taillabel"] end
	tailport: 			attached like attribute_tuple_anchor attribute Result := ["center", "center", Void, "tailport"] end
	tailtarget:			attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "tailtarget"] end
	tailtooltip: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailtooltip"] end
	tailURL: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tailURL"] end
	URL: 				attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "URL"] end
	weight:				attached like attribute_tuple_anchor attribute Result := [1, 1, 0, "weight"] end

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
