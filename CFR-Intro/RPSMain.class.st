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
	playerOne := RPSAgent new.
	playerTwo := RPSAgent new.
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

{ #category : #'as yet unclassified' }
RPSMain >> trainVsFixed: numIterations [
	1 to: numIterations do: [ :i |
		| strategy myAction otherAction regret individualUtility |
		strategy := playerOne strategy.
		playerOne increaseStrategy: strategy.
		myAction := RPSAction sample: strategy.
		otherAction := RPSAction sample: RPSAgent fixed.
		individualUtility := myAction vs: otherAction.
		regret := RPSAction subclasses collect: [ :a | (a vs: otherAction) - individualUtility].
		playerOne increaseRegret: regret
		].
]

{ #category : #'as yet unclassified' }
RPSMain >> updateAndSample [
	| myAction strategy |
	strategy := playerOne strategy.
	playerOne increaseStrategy: strategy.
	myAction := RPSAction sample: strategy.
	^ myAction
]