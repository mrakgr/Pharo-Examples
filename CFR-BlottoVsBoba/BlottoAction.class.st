Class {
	#name : #BlottoAction,
	#superclass : #Array,
	#type : #variable,
	#category : #'CFR-BlottoVsBoba'
}

{ #category : #'as yet unclassified' }
BlottoAction class >> numFields: f numSoldiers: s [
	^BlottoActionInit new numFields: f numSoldiers: s
]

{ #category : #'as yet unclassified' }
BlottoAction >> vs: otherAction [
	^(self with: otherAction collect: [ :a :b | (a - b) sign ]) sum. 
	

]
