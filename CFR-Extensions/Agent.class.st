"
A generic regret matching agent.

Based on the 'An Introduction to Counterfactual Regret Minimization' paper by TW Neller.
"
Class {
	#name : #Agent,
	#superclass : #Object,
	#instVars : [
		'regret',
		'strategy',
		'actions'
	],
	#category : #'CFR-Extensions'
}

{ #category : #'instance creation' }
Agent class >> new: actions [
	^self new actions: actions
]

{ #category : #accessing }
Agent >> actions [
	^ actions
]

{ #category : #creation }
Agent >> actions: aCollection [
	actions := aCollection.
	regret := self createArray.
	strategy := self createArray.
]

{ #category : #creation }
Agent >> createArray [
	^ NormalizedArray new: self actions size withAll: 0.0
]

{ #category : #private }
Agent >> increaseRegret: block [
	1 to: regret size do: [ :i |
		regret at: i incrementBy: (block value: (self actions at: i))
		]


]

{ #category : #private }
Agent >> increaseStrategy: strategyNew [
	1 to: strategy size do: [ :i |
		strategy at: i incrementBy: (strategyNew at: i)
		]


]

{ #category : #accessing }
Agent >> regret [
	^ regret normalized
]

{ #category : #accessing }
Agent >> strategy [
	^ strategy normalized
]

{ #category : #updating }
Agent >> updateAndSample [
	| actionDistribution |
	actionDistribution := self regret.
	self increaseStrategy: actionDistribution.
	^self actions sample: actionDistribution.
]

{ #category : #sampling }
Agent >> updateRegret: myAction and: otherAction [
	| selfUtility |
	selfUtility := myAction vs: otherAction.
	self increaseRegret: [ :a | (a vs: otherAction) - selfUtility ]
]

{ #category : #versus }
Agent >> vs: otherAgent [
	| actionSelf actionOther |
	actionSelf := self updateAndSample.
	actionOther := otherAgent updateAndSample.
	self updateRegret: actionSelf and: actionOther.
	otherAgent updateRegret: actionOther and: actionSelf.
]

{ #category : #versus }
Agent >> vsFixed: actionDistribution [
	| actionSelf actionOther |
	actionSelf := self updateAndSample.
	actionOther := self actions sample: actionDistribution.
	self updateRegret: actionSelf and: actionOther.

]

{ #category : #versus }
Agent >> vsSelf [
	self vs: self.
]
