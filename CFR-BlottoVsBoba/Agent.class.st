Class {
	#name : #Agent,
	#superclass : #BasicAgent,
	#instVars : [
		'actions'
	],
	#category : #'CFR-BlottoVsBoba'
}

{ #category : #accessing }
Agent >> actions [
	^ actions
]

{ #category : #accessing }
Agent >> actions: anObject [
	actions := anObject
]
