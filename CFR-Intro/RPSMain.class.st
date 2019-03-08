Class {
	#name : #RPSMain,
	#superclass : #Object,
	#instVars : [
		'playerOne',
		'playerTwo'
	],
	#category : #'CFR-Intro'
}

{ #category : #initialization }
RPSMain >> initialize [
	super initialize.
	playerOne := self newAgent.
	playerTwo := self newAgent.
]

{ #category : #initialization }
RPSMain >> newAgent [
	^ BasicAgent new: RPSAction subclasses
]

{ #category : #'as yet unclassified' }
RPSMain >> train: numIterations [
	1 to: numIterations do: [ :i |
		| actionOne actionTwo |
		actionOne := playerOne updateAndSample.
		actionTwo := playerTwo updateAndSample.
		playerOne updateRegret: actionOne and: actionTwo.
		playerTwo updateRegret: actionTwo and: actionOne.
		].
]
