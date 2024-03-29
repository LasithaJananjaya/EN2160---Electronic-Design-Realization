SamacSys ECAD Model
1504145/1120058/2.50/3/4/Connector

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c187.5_h125"
		(holeDiam 1.25)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.875) (shapeHeight 1.875))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.875) (shapeHeight 1.875))
	)
	(padStyleDef "s187.5_h125"
		(holeDiam 1.25)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.875) (shapeHeight 1.875))
		(padShape (layerNumRef 16) (padShapeType Rect)  (shapeWidth 1.875) (shapeHeight 1.875))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "RHDR3W76P0X254_1X3_762X254X826" (originalName "RHDR3W76P0X254_1X3_762X254X826")
		(multiLayer
			(pad (padNum 1) (padStyleRef s187.5_h125) (pt 0, 0) (rotation 90))
			(pad (padNum 2) (padStyleRef c187.5_h125) (pt 2.54, 0) (rotation 90))
			(pad (padNum 3) (padStyleRef c187.5_h125) (pt 5.08, 0) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.52 -1.52) (pt -1.52 1.555) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt -1.52 1.555) (pt 6.635 1.555) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 6.635 1.555) (pt 6.635 -1.52) (width 0.05))
		)
		(layerContents (layerNumRef 30)
			(line (pt 6.635 -1.52) (pt -1.52 -1.52) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.27 -1.27) (pt -1.27 1.27) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1.27 1.27) (pt 6.35 1.27) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 6.35 1.27) (pt 6.35 -1.27) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 6.35 -1.27) (pt -1.27 -1.27) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 -1.27) (pt 6.385 -1.27) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 6.385 -1.27) (pt 6.385 1.305) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 6.385 1.305) (pt -1.27 1.305) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -1.27 1.305) (pt -1.27 0) (width 0.2))
		)
	)
	(symbolDef "929850-01-03-RA" (originalName "929850-01-03-RA")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(line (pt 200 mils 100 mils) (pt 600 mils 100 mils) (width 6 mils))
		(line (pt 600 mils 100 mils) (pt 600 mils -300 mils) (width 6 mils))
		(line (pt 600 mils -300 mils) (pt 200 mils -300 mils) (width 6 mils))
		(line (pt 200 mils -300 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 650 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "929850-01-03-RA" (originalName "929850-01-03-RA") (compHeader (numPins 3) (numParts 1) (refDesPrefix J)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "3" (pinName "3") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "929850-01-03-RA"))
		(attachedPattern (patternNum 1) (patternName "RHDR3W76P0X254_1X3_762X254X826")
			(numPads 3)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
			)
		)
		(attr "Manufacturer_Name" "3M")
		(attr "Manufacturer_Part_Number" "929850-01-03-RA")
		(attr "Mouser Part Number" "517-929850-01-03-RA")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/3M-Electronic-Solutions-Division/929850-01-03-RA?qs=neFkstNq%252B6HSkhIqD4w5cg%3D%3D")
		(attr "Arrow Part Number" "929850-01-03-RA")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/929850-01-03-ra/3m?region=nac")
		(attr "Description" "Conn Socket Strip SKT 3 POS 2.54mm Solder ST Thru-Hole")
		(attr "Datasheet Link" "https://multimedia.3m.com/mws/media/22500O/3mtm-boardmount-skt-100-100x-100strt-sldr-tails-ts0815.pdf")
		(attr "Height" "8.26 mm")
	)

)
