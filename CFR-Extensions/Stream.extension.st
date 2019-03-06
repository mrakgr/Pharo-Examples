Extension { #name : #Stream }

{ #category : #'*CFR-Extensions' }
Stream >> print: anObject showingDecimalPlaces: placesDesired [
	"Have anObject print itself on the receiver with the desired decimal places specified."

	anObject printOn: self showingDecimalPlaces: placesDesired
]
