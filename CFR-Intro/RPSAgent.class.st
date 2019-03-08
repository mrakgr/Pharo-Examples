Class {
	#name : #RPSAgent,
	#superclass : #BasicAgent,
	#instVars : [
		'actions'
	],
	#category : #'CFR-Intro'
}

{ #category : #'as yet unclassified' }
RPSAgent class >> fixed [ ^#( 0.4 0.3 0.3 )
]

{ #category : #actions }
RPSAgent >> actions [ ^actions
]

{ #category : #actions }
RPSAgent >> actions: x [ 
	actions := x
]
