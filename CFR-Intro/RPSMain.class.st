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
RPSMain >> createAgent [
	^ Agent new: RPSAction subclasses
]

{ #category : #initialization }
RPSMain >> initialize [
	playerOne := self createAgent.
	playerTwo := self createAgent.
]

{ #category : #'as yet unclassified' }
RPSMain >> train: numIterations [
	numIterations timesRepeat: [ playerOne vs: playerTwo ]
]
