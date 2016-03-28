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


