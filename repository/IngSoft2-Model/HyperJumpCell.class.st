Class {
	#name : #HyperJumpCell,
	#superclass : #Object,
	#instVars : [
		'parsecsObject',
		'collectionOfValues',
		'currentValue',
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperJumpCell class >> withPosition: aPosition Conversor: aConversor andValues: aCollection [

	^ self new
		  initializeWithPosition: aPosition
		  Conversor: aConversor
		  andValues: aCollection
]

{ #category : #action }
HyperJumpCell >> enter [

	| convertionOfNextValue |
	convertionOfNextValue := parsecsObject convert: currentValue.
	self nextValue.
	^ cellPosition + convertionOfNextValue
]

{ #category : #action }
HyperJumpCell >> exit: aValue [

	^ true
]

{ #category : #initialization }
HyperJumpCell >> initializeWithPosition: aPosition Conversor: aConversor andValues: aCollection [

	cellPosition := aPosition.
	parsecsObject := aConversor.
	collectionOfValues := aCollection.
	currentValue := collectionOfValues at: 1
]

{ #category : #accessing }
HyperJumpCell >> nextValue [

	| currentIndex nextIndex |
	currentIndex := collectionOfValues indexOf: currentValue.
	nextIndex := currentIndex + 1.
	nextIndex > collectionOfValues size ifTrue: [ nextIndex := 1 ].
	currentValue := collectionOfValues at: nextIndex
]
