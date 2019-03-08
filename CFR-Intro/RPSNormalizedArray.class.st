Class {
	#name : #RPSNormalizedArray,
	#superclass : #AnObsoleteNormalizedArray,
	#type : #variable,
	#category : #'CFR-Intro'
}

{ #category : #accessing }
RPSNormalizedArray >> actions [ ^RPSAction subclasses
]

{ #category : #accessing }
RPSNormalizedArray >> printElem: anIndex on: aStream [
	aStream 
		print: (self actions at: anIndex);
		nextPutAll: ': ';
		print: (self normalized at: anIndex) showingDecimalPlaces: 2;
		nextPut: $%.

]
