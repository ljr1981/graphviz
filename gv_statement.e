note
	description: "[
		Abstract notion of a {GV_STATEMENT}.
		]"
	design: "[
		stmt	:	node_stmt
					|	edge_stmt
					|	attr_stmt
					|	ID '=' ID
					|	subgraph
		]"

deferred class
	GV_STATEMENT

inherit
	GV_ANY

feature -- Access

	keyword: detachable STRING
			-- `keyword' (if any).

	statement_out: STRING
			-- `statement_out'
		deferred
		end

end
