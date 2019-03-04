Class {
	#name : #Main,
	#superclass : #Object,
	#instVars : [
		'playerOne'
	],
	#category : #'CFR-Intro'
}

{ #category : #initialization }
Main >> initialize [ 
	playerOne := Agent new.
]

{ #category : #'as yet unclassified' }
Main >> train: numIterations [
	| strategy myAction otherAction regret individualUtility |
	1 to: numIterations do: [ :i |
		strategy := playerOne strategy.
		playerOne updateStrategy: strategy.
		myAction := Action sample: strategy.
		otherAction := Action sample: Agent fixed.
		individualUtility := myAction vs: otherAction.
		regret := Action subclasses collect: [ :a | (a vs: otherAction) - individualUtility].
		playerOne updateRegret: regret
		].

]
