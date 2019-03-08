Class {
	#name : #RPSPaper,
	#superclass : #RPSAction,
	#category : #'CFR-Intro'
}

{ #category : #'as yet unclassified' }
RPSPaper class >> printOn: aStream [
	aStream << 'Paper'
]

{ #category : #'as yet unclassified' }
RPSPaper class >> vs [ ^#vsPaper
]

{ #category : #'as yet unclassified' }
RPSPaper class >> vsPaper [ ^self tie
]

{ #category : #'as yet unclassified' }
RPSPaper class >> vsRock [ ^self win
]

{ #category : #'as yet unclassified' }
RPSPaper class >> vsScissors [ ^self loss
]
