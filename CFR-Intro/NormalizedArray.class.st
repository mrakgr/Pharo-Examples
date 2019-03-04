Class {
	#name : #NormalizedArray,
	#superclass : #Array,
	#type : #variable,
	#category : #'CFR-Intro'
}

{ #category : #accessing }
NormalizedArray >> actions [ ^Action subclasses
]

{ #category : #accessing }
NormalizedArray >> normalized [
	| strategy normalizingSum |
	strategy := self collect: [ :each | each max: 0.0 ].
	normalizingSum := strategy sum.
	^ normalizingSum strictlyPositive
		ifTrue: [ strategy collect: [ :each | each / normalizingSum ] ]
		ifFalse: [ self class new: strategy size withAll: 1.0 / self size ]
]

{ #category : #accessing }
NormalizedArray >> printElement: i on: aStream [
	aStream 
		print: (self actions at: i); 
		nextPutAll: ': ';
		print: (self at: i); 
		nextPut: $%.

]

{ #category : #printing }
NormalizedArray >> printOn: aStream [
	| normalized |
	self isEmpty ifTrue: [ '{}' printOn: aStream. ^self ].
	aStream nextPut: ${.
	normalized := self normalized.
	normalized printElement: 1 on: aStream.
	2 to: self size do: [ :i |
		aStream nextPutAll: ' . '.
		normalized printElement: i on: aStream.
		].
	aStream nextPut: $}
]
