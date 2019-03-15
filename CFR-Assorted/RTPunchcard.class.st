Class {
	#name : #RTPunchcard,
	#superclass : #RTBuilder,
	#instVars : [
		'objects',
		'metrics'
	],
	#category : #'CFR-Assorted'
}

{ #category : #'as yet unclassified' }
RTPunchcard >> addMetric: blockOrSymbol named: aName [
		metrics add: aName -> blockOrSymbol
]

{ #category : #'as yet unclassified' }
RTPunchcard >> addObject: anObject [
	objects add: anObject
]

{ #category : #hooks }
RTPunchcard >> createShapeBuilder [
		| sb |
		sb := super createShapeBuilder.
		sb ellipse size: #yourself.
		^ sb
]

{ #category : #initialization }
RTPunchcard >> initialize [
		super initialize.
		objects := OrderedCollection new.
		metrics := OrderedCollection new.
]

{ #category : #hooks }
RTPunchcard >> renderIn: aView [
	aView add: (RTLabel elementsOn: ' ').
	objects
		do: [ :object | 
			| objElement |
			objElement := RTLabel elementOn: object.
			self setUpInteractionFor: objElement.
			aView add: objElement ].
	metrics
		do: [ :assoc | 
			aView add: (RTLabel elementOn: assoc key).
			self resetCreatedElements.
			objects
				do: [ :object | 
					| value |
					value := assoc value rtValue: object.
					aView add: (self elementOn: value) ].
			self normalizer elements: self createdElements.
			self normalizer build ].
	RTCellLayout new
		lineItemsCount: objects size + 1;
		on: aView elements
]
