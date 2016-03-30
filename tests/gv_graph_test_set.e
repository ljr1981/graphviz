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

	FW_PROCESS_HELPER
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
					node [shape = doublecircle]; LR_0 LR_3 LR_4 LR_8;				<-- node_stmt; a_list
					node [shape = circle];											<-- node_stmt
					LR_0 -> LR_2 [ label = "SS(B)" ];								<-- edge_stmt
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
			l_node_0,
			l_node_1,
			l_node_2,
			l_node_3,
			l_node_4,
			l_node_5,
			l_node_6,
			l_node_7,
			l_node_8: GV_NODE
			l_edge_1,
			l_edge_2,
			l_edge_3,
			l_edge_4,
			l_edge_5,
			l_edge_6,
			l_edge_7,
			l_edge_8,
			l_edge_9,
			l_edge_10,
			l_edge_11,
			l_edge_12,
			l_edge_13,
			l_edge_14: GV_EDGE
			l_file: PLAIN_TEXT_FILE
			l_png: RAW_FILE
		do
			create l_graph.make_with_id (create {GV_ID}.make_with_name ("finite_state_machine"))
			assert_strings_equal ("name_only", "finite_state_machine {}", l_graph.graph_out)
			l_graph.set_attribute_value (agent l_graph.comment, "something to say")
			assert_strings_equal ("comment", "finite_state_machine {comment=%"something to say%"}", l_graph.graph_out)
			l_graph.toggle_is_digraph
			assert_strings_equal ("digraph", "digraph finite_state_machine {comment=%"something to say%"}", l_graph.graph_out)
			l_graph.set_attribute_value (agent l_graph.comment, "")
			assert_strings_equal ("no_comment", "digraph finite_state_machine {}", l_graph.graph_out)
			l_graph.set_attribute_value (agent l_graph.rankdir, "LR")
			assert_strings_equal ("rankdir", "digraph finite_state_machine {rankdir=LR}", l_graph.graph_out)
			l_graph.set_attribute_value (agent l_graph.size, "8,5")
			assert_strings_equal ("size", "digraph finite_state_machine {rankdir=LR; size=%"8,5%"}", l_graph.graph_out)
				-- Add 0 ...
			create l_node_0.make_with_id (create {GV_ID}.make_with_name ("LR_0"))
			l_node_0.set_attribute_value (agent l_node_0.shape, "doublecircle")
			l_graph.statement_list.force (l_node_0)
			assert_strings_equal ("node_0", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0;}", l_graph.graph_out)
				-- Add 1 ...
			create l_node_1.make_with_id (create {GV_ID}.make_with_name ("LR_1"))
			l_node_1.set_attribute_value (agent l_node_1.shape, "circle")
			l_graph.statement_list.force (l_node_1)
			assert_strings_equal ("node_1", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1;}", l_graph.graph_out)
				-- Add 2 ...
			create l_node_2.make_with_id (create {GV_ID}.make_with_name ("LR_2"))
			l_node_2.set_attribute_value (agent l_node_2.shape, "circle")
			l_graph.statement_list.force (l_node_2)
			assert_strings_equal ("node_2", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2;}", l_graph.graph_out)
				-- Add 3 ...
			create l_node_3.make_with_id (create {GV_ID}.make_with_name ("LR_3"))
			l_node_3.set_attribute_value (agent l_node_3.shape, "doublecircle")
			l_graph.statement_list.force (l_node_3)
			assert_strings_equal ("node_3", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3;}", l_graph.graph_out)
				-- Add 4 ...
			create l_node_4.make_with_id (create {GV_ID}.make_with_name ("LR_4"))
			l_node_4.set_attribute_value (agent l_node_4.shape, "doublecircle")
			l_graph.statement_list.force (l_node_4)
			assert_strings_equal ("node_4", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4;}", l_graph.graph_out)
				-- Add 5 ...
			create l_node_5.make_with_id (create {GV_ID}.make_with_name ("LR_5"))
			l_node_5.set_attribute_value (agent l_node_5.shape, "circle")
			l_graph.statement_list.force (l_node_5)
			assert_strings_equal ("node_5", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5;}", l_graph.graph_out)
				-- Add 6 ...
			create l_node_6.make_with_id (create {GV_ID}.make_with_name ("LR_6"))
			l_node_6.set_attribute_value (agent l_node_6.shape, "circle")
			l_graph.statement_list.force (l_node_6)
			assert_strings_equal ("node_6", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6;}", l_graph.graph_out)
				-- Add 7 ...
			create l_node_7.make_with_id (create {GV_ID}.make_with_name ("LR_7"))
			l_node_7.set_attribute_value (agent l_node_7.shape, "circle")
			l_graph.statement_list.force (l_node_7)
			assert_strings_equal ("node_7", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7;}", l_graph.graph_out)
				-- Add 8 ...
			create l_node_8.make_with_id (create {GV_ID}.make_with_name ("LR_8"))
			l_node_8.set_attribute_value (agent l_node_8.shape, "doublecircle")
			l_graph.statement_list.force (l_node_8)
			assert_strings_equal ("node_8", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8;}", l_graph.graph_out)
				-- Edge 1
			create l_edge_1.make_with_nodes (l_node_0, l_node_2, True)
			l_edge_1.set_attribute_value (agent l_edge_1.label, "SS(B)")
			l_graph.statement_list.force (l_edge_1)
			assert_strings_equal ("edge_1", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"];}", l_graph.graph_out)
				-- Edge 2
			create l_edge_2.make_with_nodes (l_node_0, l_node_1, True)
			l_edge_2.set_attribute_value (agent l_edge_2.label, "SS(S)")
			l_graph.statement_list.force (l_edge_2)
			assert_strings_equal ("edge_2", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"];}", l_graph.graph_out)
				-- Edge 3
			create l_edge_3.make_with_nodes (l_node_1, l_node_3, True)
			l_edge_3.set_attribute_value (agent l_edge_3.label, "S($end)")
			l_graph.statement_list.force (l_edge_3)
			assert_strings_equal ("edge_3", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"];}", l_graph.graph_out)
				-- Edge 4
			create l_edge_4.make_with_nodes (l_node_2, l_node_6, True)
			l_edge_4.set_attribute_value (agent l_edge_4.label, "SS(b)")
			l_graph.statement_list.force (l_edge_4)
			assert_strings_equal ("edge_4", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"];}", l_graph.graph_out)
				-- Edge 5
			create l_edge_5.make_with_nodes (l_node_2, l_node_5, True)
			l_edge_5.set_attribute_value (agent l_edge_5.label, "SS(a)")
			l_graph.statement_list.force (l_edge_5)
			assert_strings_equal ("edge_5", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"];}", l_graph.graph_out)
				-- Edge 6
			create l_edge_6.make_with_nodes (l_node_2, l_node_4, True)
			l_edge_6.set_attribute_value (agent l_edge_6.label, "S(A)")
			l_graph.statement_list.force (l_edge_6)
			assert_strings_equal ("edge_6", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"];}", l_graph.graph_out)
				-- Edge 7
			create l_edge_7.make_with_nodes (l_node_5, l_node_7, True)
			l_edge_7.set_attribute_value (agent l_edge_7.label, "S(b)")
			l_graph.statement_list.force (l_edge_7)
			assert_strings_equal ("edge_7", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"]; LR_5 -> LR_7 [label=%"S(b)%"];}", l_graph.graph_out)
				-- Edge 8
			create l_edge_8.make_with_nodes (l_node_5, l_node_5, True)
			l_edge_8.set_attribute_value (agent l_edge_8.label, "S(a)")
			l_graph.statement_list.force (l_edge_8)
			assert_strings_equal ("edge_8", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"]; LR_5 -> LR_7 [label=%"S(b)%"]; LR_5 -> LR_5 [label=%"S(a)%"];}", l_graph.graph_out)
				-- Edge 9
			create l_edge_9.make_with_nodes (l_node_6, l_node_6, True)
			l_edge_9.set_attribute_value (agent l_edge_9.label, "S(b)")
			l_graph.statement_list.force (l_edge_9)
			assert_strings_equal ("edge_9", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"]; LR_5 -> LR_7 [label=%"S(b)%"]; LR_5 -> LR_5 [label=%"S(a)%"]; LR_6 -> LR_6 [label=%"S(b)%"];}", l_graph.graph_out)
				-- Edge 10
			create l_edge_10.make_with_nodes (l_node_6, l_node_5, True)
			l_edge_10.set_attribute_value (agent l_edge_10.label, "S(a)")
			l_graph.statement_list.force (l_edge_10)
			assert_strings_equal ("edge_10", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"]; LR_5 -> LR_7 [label=%"S(b)%"]; LR_5 -> LR_5 [label=%"S(a)%"]; LR_6 -> LR_6 [label=%"S(b)%"]; LR_6 -> LR_5 [label=%"S(a)%"];}", l_graph.graph_out)
				-- Edge 11
			create l_edge_11.make_with_nodes (l_node_7, l_node_8, True)
			l_edge_11.set_attribute_value (agent l_edge_11.label, "S(b)")
			l_graph.statement_list.force (l_edge_11)
			assert_strings_equal ("edge_11", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"]; LR_5 -> LR_7 [label=%"S(b)%"]; LR_5 -> LR_5 [label=%"S(a)%"]; LR_6 -> LR_6 [label=%"S(b)%"]; LR_6 -> LR_5 [label=%"S(a)%"]; LR_7 -> LR_8 [label=%"S(b)%"];}", l_graph.graph_out)
				-- Edge 12
			create l_edge_12.make_with_nodes (l_node_7, l_node_5, True)
			l_edge_12.set_attribute_value (agent l_edge_12.label, "S(a)")
			l_graph.statement_list.force (l_edge_12)
			assert_strings_equal ("edge_12", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"]; LR_5 -> LR_7 [label=%"S(b)%"]; LR_5 -> LR_5 [label=%"S(a)%"]; LR_6 -> LR_6 [label=%"S(b)%"]; LR_6 -> LR_5 [label=%"S(a)%"]; LR_7 -> LR_8 [label=%"S(b)%"]; LR_7 -> LR_5 [label=%"S(a)%"];}", l_graph.graph_out)
				-- Edge 13
			create l_edge_13.make_with_nodes (l_node_8, l_node_6, True)
			l_edge_13.set_attribute_value (agent l_edge_13.label, "S(b)")
			l_graph.statement_list.force (l_edge_13)
			assert_strings_equal ("edge_13", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"]; LR_5 -> LR_7 [label=%"S(b)%"]; LR_5 -> LR_5 [label=%"S(a)%"]; LR_6 -> LR_6 [label=%"S(b)%"]; LR_6 -> LR_5 [label=%"S(a)%"]; LR_7 -> LR_8 [label=%"S(b)%"]; LR_7 -> LR_5 [label=%"S(a)%"]; LR_8 -> LR_6 [label=%"S(b)%"];}", l_graph.graph_out)
				-- Edge 14
			create l_edge_14.make_with_nodes (l_node_8, l_node_5, True)
			l_edge_14.set_attribute_value (agent l_edge_14.label, "S(a)")
			l_graph.statement_list.force (l_edge_14)
			assert_strings_equal ("edge_14", "digraph finite_state_machine {rankdir=LR; size=%"8,5%" node [shape=doublecircle]; LR_0; node [shape=circle]; LR_1; node [shape=circle]; LR_2; node [shape=doublecircle]; LR_3; node [shape=doublecircle]; LR_4; node [shape=circle]; LR_5; node [shape=circle]; LR_6; node [shape=circle]; LR_7; node [shape=doublecircle]; LR_8; LR_0 -> LR_2 [label=%"SS(B)%"]; LR_0 -> LR_1 [label=%"SS(S)%"]; LR_1 -> LR_3 [label=%"S($end)%"]; LR_2 -> LR_6 [label=%"SS(b)%"]; LR_2 -> LR_5 [label=%"SS(a)%"]; LR_2 -> LR_4 [label=%"S(A)%"]; LR_5 -> LR_7 [label=%"S(b)%"]; LR_5 -> LR_5 [label=%"S(a)%"]; LR_6 -> LR_6 [label=%"S(b)%"]; LR_6 -> LR_5 [label=%"S(a)%"]; LR_7 -> LR_8 [label=%"S(b)%"]; LR_7 -> LR_5 [label=%"S(a)%"]; LR_8 -> LR_6 [label=%"S(b)%"]; LR_8 -> LR_5 [label=%"S(a)%"];}", l_graph.graph_out)

				-- Create PNG file to visually inspect the outcome of generation ...
			create l_file.make_create_read_write ("graph_test.txt")
			l_file.put_string (l_graph.graph_out)
			l_file.close

			create l_png.make_create_read_write ("graph_test.png")
			l_png.put_string (output_of_command ("bin\dot.exe graph_test.txt -Tpng", ""))
			l_png.close
		end

end


