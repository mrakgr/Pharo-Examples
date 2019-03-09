Class {
	#name : #BlottoActionInit,
	#superclass : #Object,
	#instVars : [
		'temp',
		'actions'
	],
	#category : #'CFR-BlottoVsBoba'
}

{ #category : #private }
BlottoActionInit >> loop: field and: soldiersLeft [
	field >= 1
		ifTrue: [ 
			0 to: soldiersLeft do: [ :i |
				temp at: field put: i.
				self loop: field - 1 and: soldiersLeft - i.
				]
			] 
		ifFalse: [ 
			soldiersLeft = 0
				ifTrue: [ 
					actions add: temp copy.
					]
			 ]
]

{ #category : #construction }
BlottoActionInit >> numFields: f numSoldiers: s [
	temp := BlottoAction new: f.
	actions := OrderedCollection new.
	self loop: f and: s.
	^actions asArray.
]
