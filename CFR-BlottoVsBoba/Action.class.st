Class {
	#name : #Action,
	#superclass : #Array,
	#type : #variable,
	#category : #'CFR-BlottoVsBoba'
}

{ #category : #'as yet unclassified' }
Action >> vs: otherAction [
	(self with: otherAction collect: [ :a :b | a max: b ]) sum.

]
