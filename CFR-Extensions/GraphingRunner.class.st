Class {
	#name : #GraphingRunner,
	#superclass : #Object,
	#instVars : [
		'graph',
		'data',
		'agent',
		'normalizer'
	],
	#category : #'CFR-Extensions'
}

{ #category : #'instance creation' }
GraphingRunner class >> new: actions [
	^self new set: actions
]

{ #category : #accessing }
GraphingRunner >> agent [
	^ agent
]

{ #category : #accessing }
GraphingRunner >> data [
	^ data
]

{ #category : #accessing }
GraphingRunner >> data: anDistribution [
	data := RTVerticalMultipleData new.
	data color: normalizer.
	data points: anDistribution.

]

{ #category : #accessing }
GraphingRunner >> graph [
	^ graph
]

{ #category : #initialization }
GraphingRunner >> set: actions [
	graph := RTGrapher new.
	normalizer := RTMultiLinearColorForIdentity new objects: actions.
	agent := Agent new: actions
]
