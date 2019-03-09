Class {
	#name : #NormalizedArray,
	#superclass : #Array,
	#type : #variable,
	#category : #'CFR-Extensions'
}

{ #category : #accessing }
NormalizedArray >> normalized [
	| temp normalizingSum |
	temp := self collect: [ :each | each max: 0.0 ].
	normalizingSum := temp sum.
	^ normalizingSum strictlyPositive
		ifTrue: [ temp collect: [ :each | each / normalizingSum ] ]
		ifFalse: [ temp class new: temp size withAll: 1.0 / self size ]
]

{ #category : #printing }
NormalizedArray >> printElementsOn: aStream [
	aStream nextPut: $(.
	self normalized
		do: [:element | aStream print: element showingDecimalPlaces: 3; nextPut: $%] 
		separatedBy: [aStream space].
	aStream nextPut: $)
]
