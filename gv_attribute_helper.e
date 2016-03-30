note
	description: "[
		Abstract notion of a {GV_ATTRIBUTE_HELPER}.
		]"

deferred class
	GV_ATTRIBUTE_HELPER

inherit
	ANY
		redefine
			out
		end

feature -- Output

	out: STRING
			-- <Precursor>
		do
			Result := attributes_out
		end

	attributes_out: STRING
		local
			l_add_quotes: BOOLEAN
		do
			create Result.make_empty
			across
				attribute_list as ic_list
			loop
				if
					attached ic_list.item.attr_value as al_value and then
					attached ic_list.item.attr_default as al_default and then
					not al_value.out.same_string (al_default.out)
				then
					l_add_quotes := ic_list.item.is_quoted
					Result.append_string_general (ic_list.item.attr_name)
					Result.append_character ('=')
					if l_add_quotes then Result.append_character ('"') end
					Result.append_string_general (al_value.out)
					if l_add_quotes then Result.append_character ('"') end
					Result.append_character (';')
					Result.append_character (' ')
				end
			end
			if Result.count > 0 and then Result [Result.count] = ' ' then
				Result.remove_tail (2)
			end
		end

feature -- Attributes

	color: 				attached like attribute_tuple_anchor attribute Result := ["black", "black", Void, "color", is_unquoted] end
	colorscheme: 		attached like attribute_tuple_anchor attribute Result := ["", "", Void, "colorscheme", is_unquoted] end
	comment: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "comment", is_quoted] end
	fillcolor: 			attached like attribute_tuple_anchor attribute Result := ["black", "black", Void, "fillcolor", is_unquoted] end
	fontcolor: 			attached like attribute_tuple_anchor attribute Result := ["black", "black", Void, "fontcolor", is_unquoted] end
	fontname: 			attached like attribute_tuple_anchor attribute Result := ["Times-Roman", "Times-Roman", Void, "fontname", is_unquoted] end
	fontsize: 			attached like attribute_tuple_anchor attribute Result := [14, 14, 1, "fontsize", is_unquoted] end
	labelloc: 			attached like attribute_tuple_anchor attribute Result := ["c", "c", Void, "labelloc", is_unquoted] end
	showboxes: 			attached like attribute_tuple_anchor attribute Result := [0, 0, 0, "showboxes", is_unquoted] end
	target:				attached like attribute_tuple_anchor attribute Result := ["<none>", "<none>", Void, "target", is_unquoted] end
	tooltip: 			attached like attribute_tuple_anchor attribute Result := ["", "", Void, "tooltip", is_unquoted] end
	xlabel:				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "xlabel", is_unquoted] end
	xlp: 				attached like attribute_tuple_anchor attribute Result := ["", "", Void, "xlp", is_unquoted] end

	attribute_list: HASH_TABLE [attached like attribute_tuple_anchor, STRING]
			-- `attribute_list'.
		do
			create Result.make (13)
			Result.force (color, "color")
			Result.force (colorscheme, "colorscheme")
			Result.force (comment, "comment")
			Result.force (fillcolor, "fillcolor")
			Result.force (fontcolor, "fontcolor")
			Result.force (fontname, "fontname")
			Result.force (fontsize, "fontsize")
			Result.force (labelloc, "labelloc")
			Result.force (showboxes, "showboxes")
			Result.force (target, "target")
			Result.force (tooltip, "tooltip")
			Result.force (xlabel, "xlabel")
			Result.force (xlp, "xlp")
		ensure
			count: Result.count >= 13
			matching: across Result as ic all ic.key.same_string (ic.item.attr_name) end
		end

feature -- Settings

	set_attribute_value (a_getter: FUNCTION [attached like attribute_tuple_anchor]; a_value: detachable ANY)
			-- `set_attribute_value' to `a_value' using `a_getter' agent function.
		do
			a_getter.call ([Void])
			check attached a_getter.last_result as al_result then
				al_result [1] := a_value
				if
					attached {COMPARABLE} al_result [1] as al_value and then
					attached {COMPARABLE} al_result [3] as al_min
				then
					check above_minimum_standard: al_value >= al_min end
				end
			end
		ensure
			set: attached a_getter.last_result as al_result and then al_result [1] ~ a_value
		end

feature {NONE} -- Implementation: Anchors

	attribute_tuple_anchor: detachable TUPLE [attr_value: detachable ANY; attr_default: detachable ANY; attr_minimum: detachable NUMERIC; attr_name: STRING; is_quoted: BOOLEAN]

feature {NONE} -- Implementation: Constants

	is_quoted: BOOLEAN = True

	is_unquoted: BOOLEAN = False

end
