Class {
	#name : #Agent,
	#superclass : #Object,
	#instVars : [
		'regret',
		'strategy',
		'actions'
	],
	#category : #'CFR-Renewed'
}

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

{ #category : #accessing }
Agent >> regret [
	^ regret normalized
]

{ #category : #accessing }
Agent >> strategy [
	^ strategy normalized
]
