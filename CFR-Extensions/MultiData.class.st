Class {
	#name : #MultiData,
	#superclass : #Object,
	#instVars : [
		'b'
	],
	#category : #'CFR-Extensions'
}

{ #category : #accessing }
MultiData >> b [
	^ b
]

{ #category : #accessing }
MultiData >> b: anObject [
	b := anObject
]

{ #category : #initialization }
MultiData >> initialize [
	b := RTGrapher new.

	b add: (self makeD: #('hello' 1 2 1)).
	b add: (self makeD: #('test' 1 2 11)).

	b
]

{ #category : #'as yet unclassified' }
MultiData >> makeD: first [
	| d points |
	d := RTVerticalMultipleData new.
	d barShape color: Color blue.
	points := OrderedCollection new.
	points add: first.
	d points: points.
	d addMetric: #second.
	d addMetric: #third.
	d addMetric: #fourth.
	
	"Rotated text"
	d barChartWithBarTitle: #first rotation: -30.
	^d
]
