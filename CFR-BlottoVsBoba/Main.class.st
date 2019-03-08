Class {
	#name : #Main,
	#superclass : #Object,
	#instVars : [
		'playerOne',
		'playerTwo',
		'actions',
		'settings'
	],
	#category : #'CFR-BlottoVsBoba'
}

{ #category : #'instance creation' }
Main class >> new: numFields and: numSoldiers [
	self new 
		numFields: numFields;
		numSoldiers: numSoldiers.
]

{ #category : #'as yet unclassified' }
Main >> initalize [
	actions := OrderedCollection new.
	ActionsInit new
		settings: settings;
		temp: (Action new: settings numSoldiers);
		actions: actions;
		loop: 1 with: settings numSoldiers.

	

]

{ #category : #accessing }
Main >> settings [
	^ settings
]

{ #category : #accessing }
Main >> settings: anObject [
	settings := anObject
]

{ #category : #'as yet unclassified' }
Main >> train: numIterations [
	numIterations timesRepeat: [ 
		| actionOne actionTwo |
		actionOne := playerOne updateAndSample.
		actionTwo := playerTwo updateAndSample.
		playerOne updateRegret: actionOne and: actionTwo.
		playerTwo updateRegret: actionTwo and: actionOne.
		]
]
