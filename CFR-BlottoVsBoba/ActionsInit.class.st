Class {
	#name : #ActionsInit,
	#superclass : #Object,
	#instVars : [
		'settings',
		'temp',
		'actions'
	],
	#category : #'CFR-BlottoVsBoba'
}

{ #category : #accessing }
ActionsInit >> actions: anObject [
	actions := anObject
]

{ #category : #'as yet unclassified' }
ActionsInit >> loop: field with: soldiersLeft [
	field <= settings numFields
		ifTrue: [ 
			0 to: soldiersLeft do: [ :i |
				temp at: field put: i.
				self loop: field + 1 with: soldiersLeft - i.
				]
			] 
		ifFalse: [ 
			soldiersLeft = 0
				ifTrue: [ 
					actions add: temp copy.
					]
			 ]
]

{ #category : #accessing }
ActionsInit >> settings: anObject [
	settings := anObject.
]

{ #category : #accessing }
ActionsInit >> temp: anObject [
	temp := anObject
]
