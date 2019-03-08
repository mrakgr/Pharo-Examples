Class {
	#name : #NormalizedArray,
	#superclass : #Array,
	#type : #variable,
	#category : #'CFR-Extensions'
}

{ #category : #printing }
NormalizedArray >> gtDisplayOn: stream [
	^ self printOn: stream
]

{ #category : #accessing }
NormalizedArray >> normalized [
	| strategy normalizingSum |
	strategy := self collect: [ :each | each max: 0.0 ].
	normalizingSum := strategy sum.
	^ normalizingSum strictlyPositive
		ifTrue: [ strategy collect: [ :each | each / normalizingSum ] ]
		ifFalse: [ strategy class new: strategy size withAll: 1.0 / self size ]
]

{ #category : #accessing }
NormalizedArray >> printElem: anIndex on: aStream [
	aStream 
		print: (self at: anIndex) showingDecimalPlaces: 2;
		nextPut: $%.

]

{ #category : #printing }
NormalizedArray >> printOn: aStream [
	| normalized |
	normalized := self normalized.
	aStream nextPut: ${.
	self isEmpty ifFalse: [ 
		normalized printElem: 1 on: aStream.
		2 to: self size do: [ :i | 
			aStream nextPutAll: ' . '.
			normalized printElem: i on: aStream 
			].
		].
	aStream nextPut: $}
]