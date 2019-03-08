Class {
	#name : #BasicAgent,
	#superclass : #Object,
	#instVars : [
		'regretSum',
		'strategySum',
		'actions'
	],
	#category : #'CFR-Extensions'
}

{ #category : #actions }
BasicAgent >> actions [ ^actions

]

{ #category : #actions }
BasicAgent >> actions: x [ 
	actions := x

]

{ #category : #initialization }
BasicAgent >> createArray [
	| actions size |
	actions := self actions.
	size := actions size.
	^ self createArray: size with: actions.
]

{ #category : #initialization }
BasicAgent >> createArray: size with: actions [
	^ (ActionArray new: size withAll: 0.0) actions: actions
]

{ #category : #'as yet unclassified' }
BasicAgent >> increaseRegret: regret [
	regretSum := regretSum + regret

]

{ #category : #'as yet unclassified' }
BasicAgent >> increaseStrategy: strategy [
	strategySum := strategySum + strategy

]

{ #category : #initialization }
BasicAgent >> initialize [
	super initialize.
	regretSum := self createArray.
	strategySum := self createArray.
]

{ #category : #accessing }
BasicAgent >> strategy [ 
	^regretSum normalized.
]

{ #category : #'as yet unclassified' }
BasicAgent >> updateAndSample [
	| strategy |
	strategy := self strategy.
	self increaseStrategy: strategy.
	^strategy sample.
]

{ #category : #'as yet unclassified' }
BasicAgent >> updateRegret: myAction and: otherAction [
	| individualUtility |
	individualUtility := myAction vs: otherAction.
	self
		increaseRegret:
			(self actions
				collect: [ :a | (a vs: otherAction) - individualUtility ])
]
