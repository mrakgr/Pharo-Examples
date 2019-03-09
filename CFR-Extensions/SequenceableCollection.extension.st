Extension { #name : #SequenceableCollection }

{ #category : #'*CFR-Extensions' }
SequenceableCollection >> sample: aDistribution [
	^self sample: aDistribution with: SharedRandom globalGenerator next.

]

{ #category : #'*CFR-Extensions' }
SequenceableCollection >> sample: aDistribution with: probability [
	"Samples from the collection given a distribution and a target probability."
	| probabilityIndex |
	probabilityIndex := 0.0.
	1 to: self size do: [ :i |
		probabilityIndex := probabilityIndex + (aDistribution at: i).
		probability < probabilityIndex ifTrue: [^self at: i].
		].
	self error.
]
