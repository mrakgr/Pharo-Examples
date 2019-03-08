Class {
	#name : #RPSRock,
	#superclass : #RPSAction,
	#category : #'CFR-Intro'
}

{ #category : #printing }
RPSRock class >> printOn: aStream [
	aStream << 'Rock'
]

{ #category : #'as yet unclassified' }
RPSRock class >> vs [ ^#vsRock
]

{ #category : #'as yet unclassified' }
RPSRock class >> vsPaper [ ^self loss
]

{ #category : #'as yet unclassified' }
RPSRock class >> vsRock [ ^self tie
]

{ #category : #'as yet unclassified' }
RPSRock class >> vsScissors [ ^self win
]
