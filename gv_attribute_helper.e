note
	description: "[
		Abstract notion of a {GV_ATTRIBUTE_HELPER}.
		]"

deferred class
	GV_ATTRIBUTE_HELPER

inherit
	FW_ATTRIBUTE_HELPER
		redefine
			attribute_list
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
		ensure then
			count: Result.count >= 13
			matching: across Result as ic all ic.key.same_string (ic.item.attr_name) end
		end

end
