Class {
	#name : #Paper,
	#superclass : #Action,
	#category : #'CFR-Intro'
}

{ #category : #'as yet unclassified' }
Paper class >> printOn: aStream [
	aStream << 'Paper'
]

{ #category : #'as yet unclassified' }
Paper class >> vs [ ^#vsPaper
]

{ #category : #'as yet unclassified' }
Paper class >> vsPaper [ ^self tie
]

{ #category : #'as yet unclassified' }
Paper class >> vsRock [ ^self win
]

{ #category : #'as yet unclassified' }
Paper class >> vsScissors [ ^self loss
]
