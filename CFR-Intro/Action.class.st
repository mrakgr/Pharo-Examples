"
Represents the actions for the Rock, Paper, Scissors game.
"
Class {
	#name : #Action,
	#superclass : #Object,
	#instVars : [
		'regret'
	],
	#category : #'CFR-Intro'
}

{ #category : #'accessing structure variables' }
Action class >> loss [ ^-1.0
]

{ #category : #accessing }
Action class >> sample: strategy [
	|prob r actions |
	r := SharedRandom globalGenerator next.
	prob := 0.0.
	actions := Action subclasses.
	1 to: actions size do: [ :i |
		prob := prob + (strategy at: i).
		r < prob ifTrue: [^actions at: i].
		].
	self error.
	
]

{ #category : #'accessing structure variables' }
Action class >> tie [ ^0.0
]

{ #category : #'as yet unclassified' }
Action class >> vs: otherPlayer [
	^ self perform: (otherPlayer vs).
]

{ #category : #'accessing structure variables' }
Action class >> win [ ^1.0
]
