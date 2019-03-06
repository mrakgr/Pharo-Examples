Class {
	#name : #Main,
	#superclass : #Object,
	#instVars : [
		'playerOne',
		'playerTwo'
	],
	#category : #'CFR-Intro'
}

{ #category : #initialization }
Main >> initialize [ 
	playerOne := Agent new.
	playerTwo := Agent new.
]

{ #category : #'as yet unclassified' }
Main >> train: numIterations [
	1 to: numIterations do: [ :i |
		| actionOne actionTwo |
		actionOne := playerOne updateAndSample.
		actionTwo := playerTwo updateAndSample.
		playerOne updateRegret: actionOne and: actionTwo.
		playerTwo updateRegret: actionTwo and: actionOne.
		].
]

{ #category : #'as yet unclassified' }
Main >> trainVsFixed: numIterations [
	1 to: numIterations do: [ :i |
		| strategy myAction otherAction regret individualUtility |
		strategy := playerOne strategy.
		playerOne updateStrategy: strategy.
		myAction := Action sample: strategy.
		otherAction := Action sample: Agent fixed.
		individualUtility := myAction vs: otherAction.
		regret := Action subclasses collect: [ :a | (a vs: otherAction) - individualUtility].
		playerOne updateRegret: regret
		].
]

{ #category : #'as yet unclassified' }
Main >> updateAndSample [
	| myAction strategy |
	strategy := playerOne strategy.
	playerOne updateStrategy: strategy.
	myAction := Action sample: strategy.
	^ myAction
]
