note
	description: "Summary description for {GV_STATEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GV_STATEMENT

inherit
	GV_ANY
		redefine
			out
		end

feature -- Output

	out: STRING
			-- <Precursor>
		do
			create Result.make_empty
		end

end
