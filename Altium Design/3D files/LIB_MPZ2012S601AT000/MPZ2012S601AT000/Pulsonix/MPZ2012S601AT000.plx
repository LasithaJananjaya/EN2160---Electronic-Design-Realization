PULSONIX_LIBRARY_ASCII "SamacSys ECAD Model"
//831328/1120058/2.50/2/2/Ferrite Bead

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "r145_120"
		(holeDiam 0)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.2) (shapeHeight 1.45))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 0) (shapeHeight 0))
	)
	(textStyleDef "Normal"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 1.27)
			(strokeWidth 0.127)
		)
	)
	(patternDef "BEADC2012X105N" (originalName "BEADC2012X105N")
		(multiLayer
			(pad (padNum 1) (padStyleRef r145_120) (pt -0.85, 0) (rotation 0))
			(pad (padNum 2) (padStyleRef r145_120) (pt 0.85, 0) (rotation 0))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt 0, 0) (textStyleRef "Normal") (isVisible True))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.7 1) (pt 1.7 1) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 1.7 1) (pt 1.7 -1) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt 1.7 -1) (pt -1.7 -1) (width 0.05))
		)
		(layerContents (layerNumRef Courtyard_Top)
			(line (pt -1.7 -1) (pt -1.7 1) (width 0.05))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1 0.625) (pt 1 0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1 0.625) (pt 1 -0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt 1 -0.625) (pt -1 -0.625) (width 0.025))
		)
		(layerContents (layerNumRef 28)
			(line (pt -1 -0.625) (pt -1 0.625) (width 0.025))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 0.525) (pt 0 -0.525) (width 0.2))
		)
	)
	(symbolDef "MPZ2012S601AT000" (originalName "MPZ2012S601AT000")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Normal"))
		))
		(line (pt 200 mils 100 mils) (pt 600 mils 100 mils) (width 6 mils))
		(line (pt 600 mils 100 mils) (pt 600 mils -200 mils) (width 6 mils))
		(line (pt 600 mils -200 mils) (pt 200 mils -200 mils) (width 6 mils))
		(line (pt 200 mils -200 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 650 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))
		(attr "Type" "Type" (pt 650 mils 200 mils) (justify Left) (isVisible True) (textStyleRef "Normal"))

	)
	(compDef "MPZ2012S601AT000" (originalName "MPZ2012S601AT000") (compHeader (numPins 2) (numParts 1) (refDesPrefix FB)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Unknown))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Unknown))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "MPZ2012S601AT000"))
		(attachedPattern (patternNum 1) (patternName "BEADC2012X105N")
			(numPads 2)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
			)
		)
		(attr "Manufacturer_Name" "TDK")
		(attr "Manufacturer_Part_Number" "MPZ2012S601AT000")
		(attr "Mouser Part Number" "810-MPZ2012S601AT000")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/TDK/MPZ2012S601AT000?qs=8Kz9Wu9QwqXtNFDW9LJXAQ%3D%3D")
		(attr "Arrow Part Number" "MPZ2012S601AT000")
		(attr "Arrow Price/Stock" "https://www.arrow.com/en/products/mpz2012s601at000/tdk?region=nac")
		(attr "Description" "Ferrite Beads 600ohms 2A 100mOhms 0805 Ferrite Chip")
		(attr "<Hyperlink>" "https://product.tdk.com/system/files/dam/doc/product/emc/emc/beads/catalog/beads_commercial_power_mpz2012_en.pdf")
		(attr "<Component Height>" "1.05")
		(attr "<STEP Filename>" "MPZ2012S601AT000.stp")
		(attr "<STEP Offsets>" "X=0;Y=0;Z=0")
		(attr "<STEP Rotation>" "X=0;Y=0;Z=0")
	)

)