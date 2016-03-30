note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GV_EDGE_TEST_SET

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

	edge_tests
			-- New test routine
		local
			l_edge: GV_EDGE
			l_node_0,
			l_node_2: GV_NODE
		do
			create l_node_0.make_with_id (create {GV_ID}.make_with_name ("LR_0"))
			create l_node_2.make_with_id (create {GV_ID}.make_with_name ("LR_2"))
			create l_edge.make_with_nodes (l_node_0, l_node_2, True)
			l_edge.set_attribute_value ("something", agent l_edge.xlabel)
			assert_32 ("xlabel", attached {STRING} l_edge.xlabel.attr_value as al_value and then al_value.same_string ("something"))
			l_edge.set_attribute_value ("", agent l_edge.xlabel)
			l_edge.set_attribute_value ("SS(B)", agent l_edge.label)
			assert_strings_equal ("edgeop", "LR_0 -> LR_2 [label=SS(B)];", l_edge.statement_out)
		end

end


