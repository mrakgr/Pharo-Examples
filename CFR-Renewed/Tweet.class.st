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
		| content |
		content := (ZnEasy get: urlAsString) contents readStream.
		^content contents lines collect: [ :l | 
			| firstCommaIndex secondCommaIndex |
			firstCommaIndex := l indexOf: $,.
			secondCommaIndex := l indexOf: $, startingAt: (firstCommaIndex + 1).
			self new
				sender: (l copyFrom: 1 to: (firstCommaIndex - 1));
				date: (l copyFrom: (firstCommaIndex + 1) to: (secondCommaIndex - 1));
				content: (l copyFrom: (secondCommaIndex + 1))
		].
]

{ #category : #accessing }
Tweet >> content [
	^ content
]

{ #category : #accessing }
Tweet >> content: anObject [
	content := anObject
]

{ #category : #accessing }
Tweet >> date [
	^ date
]

{ #category : #accessing }
Tweet >> date: anObject [
	date := anObject
]

{ #category : #testing }
Tweet >> isSimilarTo: aTweet [
			^ (self words intersection: aTweet words) size >= 6
]

{ #category : #accessing }
Tweet >> sender [
	^ sender
]

{ #category : #accessing }
Tweet >> sender: anObject [
	sender := anObject
]

{ #category : #'as yet unclassified' }
Tweet >> words [
		^ self content substrings
]
