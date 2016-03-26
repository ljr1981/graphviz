note
	description: "Tests of {GRAPHVIZ}."
	testing: "type/manual"

class
	GRAPHVIZ_TEST_SET

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


end
