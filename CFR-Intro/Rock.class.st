Class {
	#name : #Rock,
	#superclass : #Action,
	#category : #'CFR-Intro'
}

{ #category : #printing }
Rock class >> printOn: aStream [
	aStream << 'Rock'
]

{ #category : #'as yet unclassified' }
Rock class >> vs [ ^#vsRock
]

{ #category : #'as yet unclassified' }
Rock class >> vsPaper [ ^self loss
]

{ #category : #'as yet unclassified' }
Rock class >> vsRock [ ^self tie
]

{ #category : #'as yet unclassified' }
Rock class >> vsScissors [ ^self win
]
