note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GV_NODE_TEST_SET

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

	attribute_set_tests
			-- `attribute_set_tests'
		local
			l_node: GV_NODE
		do
			create l_node.make_with_id (create {GV_ID}.make_with_name ("test_1"))
				--
			l_node.set_attribute_value (agent l_node.penwidth, 3)
			assert_32 ("penwidth", attached {INTEGER_32_REF} l_node.penwidth.attr_value as al_value and then al_value = 3)
			l_node.set_attribute_value (agent l_node.xlabel, "something")
			assert_32 ("xlabel", attached {STRING} l_node.xlabel.attr_value as al_value and then al_value.same_string ("something"))

			l_node.set_attribute_value (agent l_node.distortion, -99.99)
			assert_32 ("minimum_distortion", attached l_node.distortion.attr_value as al_value and then al_value = -99.99)
			across -100 |..| 100 as ic loop l_node.set_attribute_value (agent l_node.distortion, ic.item + 0.01) end
			assert_32 ("large_distortion", attached l_node.distortion.attr_value as al_value and then al_value = 100.01)
		end

	node_out_tests
			-- `node_out_tests'.
		local
			l_node: GV_NODE
		do
			create l_node.make_with_id (create {GV_ID}.make_with_name ("test_1"))
			assert_strings_equal ("nothing", "", l_node.statement_out)
			l_node.set_attribute_value (agent l_node.penwidth, 3)
			assert_32 ("penwidth", attached {INTEGER_32_REF} l_node.penwidth.attr_value as al_value and then al_value = 3)
			assert_strings_equal ("node_statement_1", "node [penwidth=3];", l_node.statement_out)
			l_node.set_attribute_value (agent l_node.comment, "some comment")
			assert_strings_equal ("node_statement_2", "node [comment=%"some comment%"; penwidth=3];", l_node.statement_out)
			l_node.set_attribute_value (agent l_node.imagescale, True)
			assert_strings_equal ("node_statement_3", "node [comment=%"some comment%"; imagescale=True; penwidth=3];", l_node.statement_out)
		end

end


