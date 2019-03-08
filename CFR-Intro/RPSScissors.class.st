Class {
	#name : #RPSScissors,
	#superclass : #RPSAction,
	#category : #'CFR-Intro'
}

{ #category : #printing }
RPSScissors class >> printOn: aStream [
	aStream << 'Scissors'
]

{ #category : #'as yet unclassified' }
RPSScissors class >> vs [ ^#vsScissors
]

{ #category : #'as yet unclassified' }
RPSScissors class >> vsPaper [ ^self win.
]

{ #category : #'as yet unclassified' }
RPSScissors class >> vsRock [ ^self loss.
]

{ #category : #'as yet unclassified' }
RPSScissors class >> vsScissors [ ^self tie.
]
