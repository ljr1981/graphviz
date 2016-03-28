note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GV_GRAPH_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature -- Test routines

	graph_tests
			-- `graph_tests'
		note
			specification: "[
graph	:	[ strict ] (graph | digraph) [ ID ] '{' stmt_list '}'
stmt_list	:	[ stmt [ ';' ] stmt_list ]
stmt	:	node_stmt
|	edge_stmt
|	attr_stmt
|	ID '=' ID
|	subgraph
attr_stmt	:	(graph | node | edge) attr_list
attr_list	:	'[' [ a_list ] ']' [ attr_list ]
a_list	:	ID '=' ID [ (';' | ',') ] [ a_list ]
edge_stmt	:	(node_id | subgraph) edgeRHS [ attr_list ]
edgeRHS	:	edgeop (node_id | subgraph) [ edgeRHS ]
node_stmt	:	node_id [ attr_list ]
node_id	:	ID [ port ]
port	:	':' ID [ ':' compass_pt ]
|	':' compass_pt
subgraph	:	[ subgraph [ ID ] ] '{' stmt_list '}'
compass_pt	:	(n | ne | e | se | s | sw | w | nw | c | _)				
				]"
			example: "[
digraph finite_state_machine {
	rankdir=LR;
	size="8,5"
	node [shape = doublecircle]; LR_0 LR_3 LR_4 LR_8;
	node [shape = circle];
	LR_0 -> LR_2 [ label = "SS(B)" ];
	LR_0 -> LR_1 [ label = "SS(S)" ];
	LR_1 -> LR_3 [ label = "S($end)" ];
	LR_2 -> LR_6 [ label = "SS(b)" ];
	LR_2 -> LR_5 [ label = "SS(a)" ];
	LR_2 -> LR_4 [ label = "S(A)" ];
	LR_5 -> LR_7 [ label = "S(b)" ];
	LR_5 -> LR_5 [ label = "S(a)" ];
	LR_6 -> LR_6 [ label = "S(b)" ];
	LR_6 -> LR_5 [ label = "S(a)" ];
	LR_7 -> LR_8 [ label = "S(b)" ];
	LR_7 -> LR_5 [ label = "S(a)" ];
	LR_8 -> LR_6 [ label = "S(b)" ];
	LR_8 -> LR_5 [ label = "S(a)" ];
				]"
		local
			l_graph: GV_GRAPH
		do
			create l_graph.make_with_id (create {GV_ID}.make_with_name ("finite_state_machine"))
			assert_strings_equal ("name_only", "finite_state_machine {}", l_graph.out)
			l_graph.set_attribute_value ("something to say", agent l_graph.comment)
			assert_strings_equal ("comment", "finite_state_machine {comment=%"something to say%";}", l_graph.graph_out)
			l_graph.toggle_is_digraph
			assert_strings_equal ("digraph", "digraph finite_state_machine {comment=%"something to say%";}", l_graph.graph_out)
			l_graph.set_attribute_value ("", agent l_graph.comment)
			assert_strings_equal ("no_comment", "digraph finite_state_machine {}", l_graph.graph_out)
			l_graph.set_attribute_value ("LR", agent l_graph.rankdir)
			assert_strings_equal ("rankdir", "digraph finite_state_machine {rankdir=%"LR%";}", l_graph.graph_out)
			l_graph.set_attribute_value ("8,5", agent l_graph.size)
			assert_strings_equal ("size", "digraph finite_state_machine {rankdir=%"LR%"; size=%"8,5%";}", l_graph.graph_out)
		end

end


