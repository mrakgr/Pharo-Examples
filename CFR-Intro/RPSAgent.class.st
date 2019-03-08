Class {
	#name : #RPSAgent,
	#superclass : #Object,
	#instVars : [
		'regretSum',
		'strategySum'
	],
	#category : #'CFR-Intro'
}

{ #category : #'as yet unclassified' }
RPSAgent class >> fixed [ ^#( 0.4 0.3 0.3 )
]

{ #category : #'as yet unclassified' }
RPSAgent >> increaseRegret: regret [
	regretSum := regretSum + regret

]

{ #category : #'as yet unclassified' }
RPSAgent >> increaseStrategy: strategy [
	strategySum := strategySum + strategy

]

{ #category : #initialization }
RPSAgent >> initialize [
	| size |
	super initialize.
	size := RPSAction subclasses size.
	regretSum := RPSNormalizedArray new: size withAll: 0.0 .
	strategySum := RPSNormalizedArray new: size withAll: 0.0 .


]

{ #category : #accessing }
RPSAgent >> strategy [ 
	^regretSum normalized.
]

{ #category : #'as yet unclassified' }
RPSAgent >> updateAndSample [
	| strategy |
	strategy := self strategy.
	self increaseStrategy: strategy.
	^RPSAction sample: strategy.
]

{ #category : #'as yet unclassified' }
RPSAgent >> updateRegret: myAction and: otherAction [
	| individualUtility |
	individualUtility := myAction vs: otherAction.
	self
		increaseRegret:
			(RPSAction subclasses
				collect: [ :a | (a vs: otherAction) - individualUtility ])
]
