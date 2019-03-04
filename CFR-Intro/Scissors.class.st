Class {
	#name : #Scissors,
	#superclass : #Action,
	#category : #'CFR-Intro'
}

{ #category : #printing }
Scissors class >> printOn: aStream [
	aStream << 'Scissors'
]

{ #category : #'as yet unclassified' }
Scissors class >> vs [ ^#vsScissors
]

{ #category : #'as yet unclassified' }
Scissors class >> vsPaper [ ^self win.
]

{ #category : #'as yet unclassified' }
Scissors class >> vsRock [ ^self loss.
]

{ #category : #'as yet unclassified' }
Scissors class >> vsScissors [ ^self tie.
]
