"
Represents the actions for the Rock, Paper, Scissors game.
"
Class {
	#name : #RPSAction,
	#superclass : #Object,
	#instVars : [
		'regret'
	],
	#category : #'CFR-Intro'
}

{ #category : #'accessing structure variables' }
RPSAction class >> loss [ ^-1.0
]

{ #category : #'accessing structure variables' }
RPSAction class >> tie [ ^0.0
]

{ #category : #'as yet unclassified' }
RPSAction class >> vs: otherPlayer [
	^ self perform: (otherPlayer vs).
]

{ #category : #'accessing structure variables' }
RPSAction class >> win [ ^1.0
]
