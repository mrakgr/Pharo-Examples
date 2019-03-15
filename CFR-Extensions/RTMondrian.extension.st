Extension { #name : #RTMondrian }

{ #category : #'*CFR-Extensions' }
RTMondrian >> initialize [
	rootFrame := self createNewFrame.
	currentFrame := rootFrame.
	super initialize.
	self resetLayoutBuilder.
	self resetEdgeBuilder.
	self view @ RTZoomableView.
]
