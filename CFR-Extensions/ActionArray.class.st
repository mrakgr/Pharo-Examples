Class {
	#name : #ActionArray,
	#superclass : #NormalizedArray,
	#type : #variable,
	#instVars : [
		'actions'
	],
	#category : #'CFR-Extensions'
}

{ #category : #accessing }
ActionArray >> actions [
	^ actions
]

{ #category : #accessing }
ActionArray >> actions: anObject [
	actions := anObject
]

{ #category : #accessing }
ActionArray >> printElem: anIndex on: aStream [
	aStream 
		print: (self actions at: anIndex);
		nextPutAll: ': ';
		print: (self at: anIndex) showingDecimalPlaces: 2;
		nextPut: $%.
]

{ #category : #'as yet unclassified' }
ActionArray >> sample [
	| prob r |
	r := SharedRandom globalGenerator next.
	prob := 0.0.
	1 to: self actions size do: [ :i |
		prob := prob + (self at: i).
		r < prob ifTrue: [^self actions at: i].
		].
	self error.
	
]
