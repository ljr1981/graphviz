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

feature -- Test routines

	edge_tests
			-- New test routine
		local
			l_edge: GV_EDGE
		do
			create l_edge
			l_edge.set_attribute_value ("something", agent l_edge.xlabel)
			assert_32 ("xlabel", attached {STRING} l_edge.xlabel.attr_value as al_value and then al_value.same_string ("something"))
		end

end


