Class {
	#name : #Agent,
	#superclass : #Object,
	#instVars : [
		'regretSum',
		'strategySum'
	],
	#category : #'CFR-Intro'
}

{ #category : #'as yet unclassified' }
Agent class >> fixed [ ^#( 0.4 0.3 0.3 )
]

{ #category : #initialization }
Agent >> initialize [
	| size |
	super initialize.
	size := Action subclasses size.
	regretSum := NormalizedArray new: size withAll: 0.0 .
	strategySum := NormalizedArray new: size withAll: 0.0 .


]

{ #category : #accessing }
Agent >> strategy [ 
	^regretSum normalized.
]

{ #category : #'as yet unclassified' }
Agent >> updateAndSample [
	| strategy |
	strategy := self strategy.
	self updateStrategy: strategy.
	^Action sample: strategy.
]

{ #category : #'as yet unclassified' }
Agent >> updateRegret: regret [
	regretSum := regretSum + regret

]

{ #category : #'as yet unclassified' }
Agent >> updateRegret: myAction and: otherAction [
	| individualUtility |
	individualUtility := myAction vs: otherAction.
	self
		updateRegret:
			(Action subclasses
				collect: [ :a | (a vs: otherAction) - individualUtility ])
]

{ #category : #'as yet unclassified' }
Agent >> updateStrategy: strategy [
	strategySum := strategySum + strategy

]
