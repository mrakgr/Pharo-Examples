Class {
	#name : #RPSMain,
	#superclass : #Object,
	#instVars : [
		'playerOne',
		'playerTwo'
	],
	#category : #'CFR-Intro'
}

{ #category : #'as yet unclassified' }
RPSMain >> train: numIterations [
	numIterations timesRepeat: [ playerOne vs: playerTwo 	].
]
