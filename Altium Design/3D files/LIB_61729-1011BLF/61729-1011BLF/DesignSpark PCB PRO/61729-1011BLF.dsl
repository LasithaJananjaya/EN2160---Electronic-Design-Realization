SamacSys ECAD Model
1537623/1120058/2.50/6/2/Connector

DESIGNSPARK_INTERMEDIATE_ASCII

(asciiHeader
	(fileUnits MM)
)
(library Library_1
	(padStyleDef "c143.1_h92"
		(holeDiam 0.92)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 1.431) (shapeHeight 1.431))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 1.431) (shapeHeight 1.431))
	)
	(padStyleDef "s143.1_h92"
		(holeDiam 0.92)
		(padShape (layerNumRef 1) (padShapeType Rect)  (shapeWidth 1.431) (shapeHeight 1.431))
		(padShape (layerNumRef 16) (padShapeType Rect)  (shapeWidth 1.431) (shapeHeight 1.431))
	)
	(padStyleDef "c345_h230"
		(holeDiam 2.3)
		(padShape (layerNumRef 1) (padShapeType Ellipse)  (shapeWidth 3.450) (shapeHeight 3.450))
		(padShape (layerNumRef 16) (padShapeType Ellipse)  (shapeWidth 3.450) (shapeHeight 3.450))
	)
	(textStyleDef "Default"
		(font
			(fontType Stroke)
			(fontFace "Helvetica")
			(fontHeight 50 mils)
			(strokeWidth 5 mils)
		)
	)
	(patternDef "617291011BLF" (originalName "617291011BLF")
		(multiLayer
			(pad (padNum 1) (padStyleRef s143.1_h92) (pt 0.000, 0.000) (rotation 90))
			(pad (padNum 2) (padStyleRef c143.1_h92) (pt -2.500, 0.000) (rotation 90))
			(pad (padNum 3) (padStyleRef c143.1_h92) (pt -2.500, -2.000) (rotation 90))
			(pad (padNum 4) (padStyleRef c143.1_h92) (pt 0.000, -2.000) (rotation 90))
			(pad (padNum 5) (padStyleRef c345_h230) (pt 4.770, -4.710) (rotation 90))
			(pad (padNum 6) (padStyleRef c345_h230) (pt -7.270, -4.710) (rotation 90))
		)
		(layerContents (layerNumRef 18)
			(attr "RefDes" "RefDes" (pt -1.250, -6.990) (textStyleRef "Default") (isVisible True))
		)
		(layerContents (layerNumRef 28)
			(line (pt -7.35 1.01) (pt 4.85 1.01) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.85 1.01) (pt 4.85 -14.99) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt 4.85 -14.99) (pt -7.35 -14.99) (width 0.1))
		)
		(layerContents (layerNumRef 28)
			(line (pt -7.35 -14.99) (pt -7.35 1.01) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt -9.995 2.01) (pt 7.495 2.01) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 7.495 2.01) (pt 7.495 -15.99) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt 7.495 -15.99) (pt -9.995 -15.99) (width 0.1))
		)
		(layerContents (layerNumRef 30)
			(line (pt -9.995 -15.99) (pt -9.995 2.01) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt -7.35 -2.79) (pt -7.35 1.01) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -7.35 1.01) (pt 4.85 1.01) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 4.85 1.01) (pt 4.85 -2.79) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 4.85 -6.69) (pt 4.85 -14.99) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 4.85 -14.99) (pt -7.35 -14.99) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt -7.35 -14.99) (pt -7.35 -6.69) (width 0.2))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 1.5) (pt 0 1.5) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 0, 1.55) (radius 0.05) (startAngle 270) (sweepAngle 180.0) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(line (pt 0 1.6) (pt 0 1.6) (width 0.1))
		)
		(layerContents (layerNumRef 18)
			(arc (pt 0, 1.55) (radius 0.05) (startAngle 90.0) (sweepAngle 180.0) (width 0.1))
		)
	)
	(symbolDef "61729-1011BLF" (originalName "61729-1011BLF")

		(pin (pinNum 1) (pt 0 mils 0 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -25 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 2) (pt 0 mils -100 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -125 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 3) (pt 0 mils -200 mils) (rotation 0) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 230 mils -225 mils) (rotation 0]) (justify "Left") (textStyleRef "Default"))
		))
		(pin (pinNum 4) (pt 900 mils 0 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -25 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 5) (pt 900 mils -100 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -125 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(pin (pinNum 6) (pt 900 mils -200 mils) (rotation 180) (pinLength 200 mils) (pinDisplay (dispPinName true)) (pinName (text (pt 670 mils -225 mils) (rotation 0]) (justify "Right") (textStyleRef "Default"))
		))
		(line (pt 200 mils 100 mils) (pt 700 mils 100 mils) (width 6 mils))
		(line (pt 700 mils 100 mils) (pt 700 mils -300 mils) (width 6 mils))
		(line (pt 700 mils -300 mils) (pt 200 mils -300 mils) (width 6 mils))
		(line (pt 200 mils -300 mils) (pt 200 mils 100 mils) (width 6 mils))
		(attr "RefDes" "RefDes" (pt 750 mils 300 mils) (justify Left) (isVisible True) (textStyleRef "Default"))

	)
	(compDef "61729-1011BLF" (originalName "61729-1011BLF") (compHeader (numPins 6) (numParts 1) (refDesPrefix J)
		)
		(compPin "1" (pinName "1") (partNum 1) (symPinNum 1) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "2" (pinName "2") (partNum 1) (symPinNum 2) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "3" (pinName "3") (partNum 1) (symPinNum 3) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "4" (pinName "4") (partNum 1) (symPinNum 4) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "MH1" (pinName "MH1") (partNum 1) (symPinNum 5) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(compPin "MH2" (pinName "MH2") (partNum 1) (symPinNum 6) (gateEq 0) (pinEq 0) (pinType Bidirectional))
		(attachedSymbol (partNum 1) (altType Normal) (symbolName "61729-1011BLF"))
		(attachedPattern (patternNum 1) (patternName "617291011BLF")
			(numPads 6)
			(padPinMap
				(padNum 1) (compPinRef "1")
				(padNum 2) (compPinRef "2")
				(padNum 3) (compPinRef "3")
				(padNum 4) (compPinRef "4")
				(padNum 5) (compPinRef "MH1")
				(padNum 6) (compPinRef "MH2")
			)
		)
		(attr "Mouser Part Number" "649-61729-1011BLF")
		(attr "Mouser Price/Stock" "https://www.mouser.co.uk/ProductDetail/Amphenol-FCI/61729-1011BLF?qs=zxzm42eeoPNCjU%2FpHflioA%3D%3D")
		(attr "Manufacturer_Name" "Amphenol Communications Solutions")
		(attr "Manufacturer_Part_Number" "61729-1011BLF")
		(attr "Description" "USB-B (USB TYPE-B) USB 2.0 Receptacle Connector 4 Position Through Hole, Right Angle")
		(attr "Datasheet Link" "https://www.amphenol-cs.com/media/wysiwyg/files/drawing/61729.pdf")
		(attr "Height" "11.5 mm")
	)

)
