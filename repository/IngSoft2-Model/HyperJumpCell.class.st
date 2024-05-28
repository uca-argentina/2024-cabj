Class {
	#name : #HyperJumpCell,
	#superclass : #RegularCell,
	#instVars : [
		'parsecsObject',
		'collectionOfValues',
		'currentValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperJumpCell class >> withPosition: aValue Parsecs: aParsecs andValues: aCollection [

	^ self new
		  initializeWithPosition: aValue
		  Parsecs: aParsecs
		  andValues: aCollection
]

{ #category : #'instance creation' }
HyperJumpCell >> enter [

	|  convertionOfNextValue |
	
	convertionOfNextValue := parsecsObject convert: currentValue.
	self nextValue.
	^ cellPosition + convertionOfNextValue.
]

{ #category : #initialization }
HyperJumpCell >> initializeWithPosition: aValue Parsecs: aParsecs andValues: aCollection [

	parsecsObject := aParsecs.
	collectionOfValues := aCollection.
	currentValue := collectionOfValues at: 1.
	cellPosition := aValue
]

{ #category : #accessing }
HyperJumpCell >> nextValue [

	| currentIndex nextIndex |
	currentIndex := collectionOfValues indexOf: currentValue.
	nextIndex := currentIndex + 1.
	nextIndex > collectionOfValues size ifTrue: [ nextIndex := 1 ].
	currentValue := collectionOfValues at: nextIndex
]
