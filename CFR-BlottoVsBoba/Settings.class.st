Class {
	#name : #Settings,
	#superclass : #Object,
	#instVars : [
		'numSoldiers',
		'numFields'
	],
	#category : #'CFR-BlottoVsBoba'
}

{ #category : #accessing }
Settings >> numFields [
	^ numFields
]

{ #category : #accessing }
Settings >> numFields: anObject [
	numFields := anObject
]

{ #category : #accessing }
Settings >> numSoldiers [
	^ numSoldiers
]

{ #category : #accessing }
Settings >> numSoldiers: anObject [
	numSoldiers := anObject
]
