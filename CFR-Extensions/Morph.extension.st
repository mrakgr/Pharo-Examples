Extension { #name : #Morph }

{ #category : #'*CFR-Extensions' }
Morph >> openInWindowLabeled: aString inWorld: aWorld [
	"Changed to include the inset margin in the bound calculation."

	| window |
	window := (SystemWindow labelled: aString) model: nil.
	window 
		" guess at initial extent"
		bounds: (RealEstateAgent initialFrameFor: window initialExtent: self fullBounds extent world: aWorld);
		addMorph: self frame: (0@0 extent: 1@1);
		updatePaneColors.
	" calculate extent after adding in case any size related attributes were changed.  Use
	fullBounds in order to trigger re-layout of layout morphs"
	window bounds: (RealEstateAgent initialFrameFor: window initialExtent: window fullBounds extent world: aWorld).
	aWorld addMorph: window.
	window activate.
	aWorld startSteppingSubmorphsOf: window.
	
	window announceOpened.
	^window
]
