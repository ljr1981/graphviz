note
	description: "[
		Representation of a {GV_GRAPH}.
		]"
	design: "[
		Graphs are frequently drawn as node-link diagrams 
		in which the vertices are represented as disks, 
		boxes, or textual labels and the edges are represented 
		as line segments, polylines, or curves in the Euclidean 
		plane. Node are {GV_NODE} items, while links are
		{GV_EDGE} items.
		]"
	EIS: "src=https://en.wikipedia.org/wiki/Graph_drawing"

class
	GV_GRAPH

inherit
	GV_ANY

	GV_ATTRIBUTE_HELPER

feature -- Attributes

--_background
--bb
--center
--charset
--clusterrank
--compound
--concentrate
--Damping
--defaultdist
--dim
--dimen
--diredgeconstraints
--dpi
--epsilon
--esep
--fontnames
--fontpath
--forcelabels
--imagepath
--inputscale
--label_scheme
--landscape
--layerlistsep
--layers
--layerselect
--layersep
--layout
--levels
--levelsgap
--maxiter
--mclimit
--mindist
--mode
--model
--mosek
--nodesep
--normalize
--notranslate
--nslimit 
--nslimit1
--orientation
--outputorder
--overlap
--overlap_scaling
--overlap_shrink
--pack
--packmode
--pad
--page
--pagedir
--quadtree
--quantum
--rankdir
--ranksep
--ratio
--remincross
--repulsiveforce
--resolution
--rotate
--rotation
--scale
--searchsize
--sep
--size
--smoothing
--splines
--start
--stylesheet
--truecolor
--viewport
--voro_margin
--xdotversion
--bgcolor
--K
--labeljust
--lheight
--lwidth
--sortv
--href
--id
--nojustify
--lp
--showboxes
--comment
--colorscheme
--style
--fontcolor
--fontsize
--URL
--target
--label
--fontname
--ordering
--root
--gradientangle
--margin
--labelloc

end
