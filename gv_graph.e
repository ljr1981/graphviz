note
	description: "[
		Representation of a {GV_GRAPH}.
		]"
	design: "[
		Graphs are frequently drawn as node-link diagrams 
		in which the vertices are represented as disks, 
		boxes, or textual labels and the edges are represented 
		as line segments, polylines, or curves in the Euclidean 
		plane. Node are {GV_NODE} items, while links are
		{GV_EDGE} items.
		]"
	EIS: "src=https://en.wikipedia.org/wiki/Graph_drawing"

class
	GV_GRAPH

inherit
	GV_ANY
		undefine
			out
		end

	GV_ATTRIBUTE_HELPER
		redefine
			attribute_list,
			out
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

	graph_out: STRING
			-- `graph'.
		note
			specification: "[
				graph	:	[ strict ] (graph | digraph) [ ID ]
				]"
		do
			Result := out
		end

feature -- Status Report

	is_digraph: BOOLEAN
			-- `is_digraph' (e.g. directed graph vs. undirected)
		note
			specification: "[
				A graph must be specified as either a digraph or a graph. Semantically, this 
				indicates whether or not there is a natural direction from one of the edge's 
				nodes to the other. Lexically, a digraph must specify an edge using the edge 
				operator -> while a undirected graph must use --. Operationally, the distinction 
				is used to define different default rendering attributes. For example, edges in 
				a digraph will be drawn, by default, with an arrowhead pointing to the head node. 
				For ordinary graphs, edges are drawn without any arrowheads by default.
				]"
		attribute
			Result := False
		end

	is_undirected: BOOLEAN
			-- `is_undirected' is not `is_digraph'.
		note
			specification: "[
				An undirected graph is one where the edge links between nodes do not have an
				arrow, indicating some form of flow. Therefore, an undirected graph is one
				having no logical flow from one node to another (e.g. the connections have
				some other semantic meaning).
				]"
		do
			Result := not is_digraph
		end

	is_strict: BOOLEAN
			-- `is_strict'
		note
			specification: "[
				A graph may also be described as strict. This forbids the creation of multi-edges, 
				i.e., there can be at most one edge with a given tail node and head node in the 
				directed case. For undirected graphs, there can be at most one edge connected to 
				the same two nodes. Subsequent edge statements using the same two nodes will 
				identify the edge with the previously defined one and apply any attributes 
				given in the edge statement.
				]"
		attribute
			Result := False
		end

feature -- Attributes

	id: GV_ID
			-- `id' of Current {GV_NODE}.

	statement_list: ARRAYED_LIST [GV_STATEMENT]
			-- `statement_list' of {GV_STATEMENT} items.
		note
			specification: "[
				stmt_list ::= [ stmt [ ';' ] stmt_list ]
				stmt ::= 		node_stmt
							|	edge_stmt
							|	attr_stmt
							|	ID '=' ID
							|	subgraph
				]"
		attribute
			create Result.make (10)
		end

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- <Precursor>
		do
			Result := Precursor
			Result.force (rankdir, "rankdir")
			Result.force (size, "size")
		ensure then
			count: Result.count = (13 + 2)
			matching: across Result as ic all ic.key.same_string (ic.item.attr_name) end
		end

--_background
--bb
--center
--charset
--clusterrank
--compound
--concentrate
--Damping
--defaultdist
--dim
--dimen
--diredgeconstraints
--dpi
--epsilon
--esep
--fontnames
--fontpath
--forcelabels
--imagepath
--inputscale
--label_scheme
--landscape
--layerlistsep
--layers
--layerselect
--layersep
--layout
--levels
--levelsgap
--maxiter
--mclimit
--mindist
--mode
--model
--mosek
--nodesep
--normalize
--notranslate
--nslimit 
--nslimit1
--orientation
--outputorder
--overlap
--overlap_scaling
--overlap_shrink
--pack
--packmode
--pad
--page
--pagedir
--quadtree
--quantum
	rankdir: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "rankdir"] end
--ranksep
--ratio
--remincross
--repulsiveforce
--resolution
--rotate
--rotation
--scale
--searchsize
--sep
--size
	size: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "size"] end
--smoothing
--splines
--start
--stylesheet
--truecolor
--viewport
--voro_margin
--xdotversion
--bgcolor
--K
--labeljust
--lheight
--lwidth
--sortv
--href
--id
--nojustify
--lp
--showboxes
--comment
--colorscheme
--style
--fontcolor
--fontsize
--URL
--target
--label
--fontname
--ordering
--root
--gradientangle
--margin
--labelloc

feature -- Settings

	toggle_is_digraph
			-- `toggle_is_digraph' from True to False or back again.
		do
			is_digraph := not is_digraph
		ensure
			toggled: is_digraph = not old is_digraph
		end

feature {NONE} -- Implementation: Output

	out: STRING
			-- <Precursor>
		do
			create Result.make_empty
			if is_digraph then Result.append_string_general ("digraph ") end
			Result.append_string_general (id.name)
			Result.append_character (' ')
			Result.append_character ('{')
			Result.append_string_general (attributes_out)
			across statement_list as ic loop Result.append_string_general (ic.item.out) end
			Result.append_character ('}')
		end

end
