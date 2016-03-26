note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	GV_ID_TEST_SET

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

	id_test
			-- `id_test'
		local
			l_id: GV_ID
			l_randomizer: RANDOMIZER
		do
			create l_id
			assert_32 ("valid_alpha", l_id.is_valid (l_id.alphabetic))
			assert_32 ("invalid_starts_with_0", not l_id.is_valid ("0" + l_id.alphabetic))
			assert_32 ("valid_integer", across (1 |..| 10_000) as ic all l_id.is_valid (ic.item.out) end)
			create l_randomizer
			assert_32 ("valid_real", across (1 |..| 10_000) as ic all l_id.is_valid (l_randomizer.random_real.out) end)
			assert_32 ("valid_rnd_alpha", across (1 |..| 10_000) as ic all l_id.is_valid (l_randomizer.random_identifier) end)
		end

end


