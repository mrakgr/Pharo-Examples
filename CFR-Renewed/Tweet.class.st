Class {
	#name : #Tweet,
	#superclass : #Object,
	#instVars : [
		'content',
		'sender',
		'date'
	],
	#category : #'CFR-Renewed'
}

{ #category : #'as yet unclassified' }
Tweet class >> createFromExample [
		"Method to be defined on the CLASS side"
		^ self createFromURL: 'http://agilevisualization.com/AgileVisualization/tweets.csv'
]

{ #category : #'as yet unclassified' }
Tweet class >> createFromURL: urlAsString [
	"Method to be defined on the CLASS side"
	^(ZnEasy get: urlAsString) contents lines collect: [ :l | self new set: l].
]

{ #category : #accessing }
Tweet >> content [
	^ content
]

{ #category : #accessing }
Tweet >> date [
	^ date
]

{ #category : #testing }
Tweet >> isSimilarTo: aTweet [
	^ (self words intersection: aTweet words) size >= 3
]

{ #category : #accessing }
Tweet >> sender [
	^ sender
]

{ #category : #'as yet unclassified' }
Tweet >> set: aString [
	| subs |
	subs := $, split: aString.
	sender := subs first.
	date := subs second.
	content := subs third.
]

{ #category : #'as yet unclassified' }
Tweet >> words [
		^ self content substrings
]
