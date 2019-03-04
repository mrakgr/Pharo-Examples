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
	(self actions at: i) printOn: aStream.
	aStream << ': '.
	(normalized at: i) printOn: aStream.
	aStream << $%
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
	aStream << ${.
	normalized := self normalized.
	NormalizedArray print: normalized at: 1 on: aStream.
	2 to: self size do: [ :i |
		aStream << ' . '.
		NormalizedArray print: normalized at: i on: aStream.
		].
	aStream << $}
]
