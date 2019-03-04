Class {
	#name : #NormalizedArray,
	#superclass : #Array,
	#type : #variable,
	#category : #'CFR-Intro'
}

{ #category : #accessing }
NormalizedArray class >> actions [ ^Action subclasses
]

{ #category : #accessing }
NormalizedArray class >> print: normalized at: i on: aStream [
	aStream 
		nextPut: (self actions at: i);
		nextPutAll: ': ';
		nextPut: (normalized at: i);
		nextPut: #%.

]

{ #category : #accessing }
NormalizedArray >> normalized [
	| strategy normalizingSum |
	strategy := self collect: [ :each | each max: 0.0 ].
	normalizingSum := strategy sum.
	^ normalizingSum strictlyPositive
		ifTrue: [ strategy collect: [ :each | each / normalizingSum ] ]
		ifFalse: [ Array new: strategy size withAll: 1.0 / self size ]
]

{ #category : #printing }
NormalizedArray >> printOn: aStream [
	| normalized |
	self isEmpty ifTrue: [ '{}' printOn: aStream. ^self ].
	normalized := self normalized.
	aStream << ${.
	NormalizedArray print: normalized at: 1 on: aStream.
	2 to: self size do: [ :i |
		aStream << ' . '.
		NormalizedArray print: normalized at: i on: aStream.
		].
	aStream << $}
]
