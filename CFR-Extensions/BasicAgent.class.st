Class {
	#name : #BasicAgent,
	#superclass : #Object,
	#instVars : [
		'regretSum',
		'strategySum'
	],
	#category : #'CFR-Extensions'
}

{ #category : #actions }
BasicAgent >> actions [
	self subclassResponsibility
]

{ #category : #initialization }
BasicAgent >> initialize [
	| size |
	super initialize.
	size := self actions size.
	regretSum := NormalizedArray new: size withAll: 0.0 .
	strategySum := NormalizedArray new: size withAll: 0.0 .


]

{ #category : #'as yet unclassified' }
BasicAgent >> sample: strategy [
	| prob r |
	r := SharedRandom globalGenerator next.
	prob := 0.0.
	1 to: self actions size do: [ :i |
		prob := prob + (strategy at: i).
		r < prob ifTrue: [^self actions at: i].
		].
	self error.
	
]

{ #category : #accessing }
BasicAgent >> strategy [ 
	^regretSum normalized.
]

{ #category : #'as yet unclassified' }
BasicAgent >> updateAndSample [
	| strategy |
	strategy := self strategy.
	self updateStrategy: strategy.
	^self sample: strategy.
]

{ #category : #'as yet unclassified' }
BasicAgent >> updateRegret: regret [
	regretSum := regretSum + regret

]

{ #category : #'as yet unclassified' }
BasicAgent >> updateRegret: myAction and: otherAction [
	| individualUtility |
	individualUtility := myAction vs: otherAction.
	self
		updateRegret:
			(self actions
				collect: [ :a | (a vs: otherAction) - individualUtility ])
]

{ #category : #'as yet unclassified' }
BasicAgent >> updateStrategy: strategy [
	strategySum := strategySum + strategy

]
