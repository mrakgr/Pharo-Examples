Class {
	#name : #ActionArray,
	#superclass : #NormalizedArray,
	#type : #variable,
	#instVars : [
		'actions'
	],
	#category : #'CFR-Extensions'
}

{ #category : #accessing }
ActionArray >> actions [
	^ actions
]

{ #category : #accessing }
ActionArray >> actions: anObject [
	actions := anObject
]

{ #category : #accessing }
ActionArray >> printElem: anIndex on: aStream [
	aStream 
		print: (self actions at: anIndex);
		nextPutAll: ': ';
		print: (self at: anIndex) showingDecimalPlaces: 2;
		nextPut: $%.
]
