note
	description: "[
		Representation of a {GV_ID}.
		]"

class
	GV_ID

inherit
	ASCII

feature -- Access

	text: STRING assign set_text
			-- `text' of Current {GV_ID}.
		attribute
			create Result.make_empty
		end

feature -- Settings

	set_text (a_text: like text)
			-- `set_text' with `a_text'
		require
			valid: is_valid (a_text)
		do
			text := a_text
		ensure
			set: text.same_string (a_text)
		end

feature -- Status Report

	is_valid (a_text: like text): BOOLEAN
			-- `is_valid' `a_text'?
		note
			specification: "[
				Any string of alphabetic ([a-zA-Z\200-\377]) characters, underscores ('_')
				or digits ([0-9]), not beginning with a digit;

				a numeral [-]?(.[0-9]+ | [0-9]+(.[0-9]*)? );

				any double-quoted string ("...") possibly containing escaped quotes ('")1;

				an HTML string (<...>).
				]"
		do
			Result := is_alphabetic (a_text) or (a_text.is_number_sequence xor a_text.is_real_sequence)
		end

feature {TEST_SET_BRIDGE} -- Implementation

	is_alphabetic (a_digits: STRING_32): BOOLEAN
		require
			non_empty: not a_digits.is_empty
		do
			-- ([a-zA-Z\200-\377]), underscores ('_'), or digits ([0-9]), not beginning with a digit
			Result := across a_digits as ic all
							alphabetic.has (ic.item)
						end and then a_digits [1] /= '0'
		end

	alphabetic: STRING_32
		once
			Result := ranged_string (<<(Lower_a |..| Lower_z), (Upper_a |..| Upper_z), (Zero |..| Nine)>>)
			Result.append_character ('_')
			--Result.append_string (ranged_string (<<(200 |..| 377)>>))
		end

feature {NONE} -- Implementation: Basic Operations

	ranged_string (a_range_list: ARRAY [INTEGER_INTERVAL]): STRING_32
			-- `ranged_string' based on `a_range_list'.
		do
			create Result.make_empty
			across
				a_range_list as ic_range
			loop
				across
					ic_range.item as ic_digit
				loop
					Result.append_code (ic_digit.item.to_natural_32)
				end
			end
		end

note
	design: "[
		An ID is one of the following:

		Any string of alphabetic ([a-zA-Z\200-\377]) characters, underscores ('_')
		or digits ([0-9]), not beginning with a digit;

		a numeral [-]?(.[0-9]+ | [0-9]+(.[0-9]*)? );

		any double-quoted string ("...") possibly containing escaped quotes ('")1;

		an HTML string (<...>).

		An ID is just a string; the lack of quote characters in the first two forms
		is just for simplicity. There is no semantic difference between abc_2 and "abc_2",
		or between 2.34 and "2.34". Obviously, to use a keyword as an ID, it must be
		quoted. Note that, in HTML strings, angle brackets must occur in matched pairs,
		and newlines and other formatting whitespace characters are allowed. In addition,
		the content must be legal XML, so that the special XML escape sequences
		for ", &, <, and > may be necessary in order to embed these characters in 
		attribute values or raw text. As an ID, an HTML string can be any legal XML
		string. However, if used as a label attribute, it is interpreted specially
		and must follow the syntax for HTML-like labels.
		]"

end
