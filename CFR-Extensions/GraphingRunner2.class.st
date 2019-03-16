Class {
	#name : #GraphingRunner2,
	#superclass : #Object,
	#instVars : [
		'graph',
		'data',
		'agent',
		'points'
	],
	#category : #'CFR-Extensions'
}

{ #category : #'instance creation' }
GraphingRunner2 class >> new: actions [
	^self new set: actions
]

{ #category : #accessing }
GraphingRunner2 >> agent [
	^ agent
]

{ #category : #accessing }
GraphingRunner2 >> data [
	^ data
]

{ #category : #accessing }
GraphingRunner2 >> data: anDistribution [
	data := RTVerticalMultipleData new.
	data color: normalizer.
	data points: anDistribution.

]

{ #category : #accessing }
GraphingRunner2 >> graph [
	^ graph
]

{ #category : #initialization }
GraphingRunner2 >> set: actions [
	| normalizer |
	graph := RTGrapher new.
	points := OrderedCollection new.
	data := RTVerticalMultipleData new.
	data points: points.
	normalizer := RTMultiLinearColorForIdentity new objects: actions.
	actions do: [ :action | data addMetric: action color: normalizer ].
	graph add: data.
	
	agent := Agent new: actions.
]
