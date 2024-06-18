Class {
	#name : #HyperJumpCell,
	#superclass : #Cell,
	#instVars : [
		'collectionOfValues',
		'currentValue',
		'conversor',
		'previousValue'
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
	convertionOfNextValue := conversor convert: currentValue.
	previousValue := currentValue.
	self nextValue.
	^ cellPosition + convertionOfNextValue
]

{ #category : #action }
HyperJumpCell >> enterWithoutTurn: aSpaceship [

	| convertionOfNextValue |
	convertionOfNextValue := conversor convert: previousValue.
	^ cellPosition + convertionOfNextValue
]

{ #category : #initialization }
HyperJumpCell >> initializeWithPosition: aPosition Conversor: aConversor andValues: aCollection [

	cellPosition := aPosition.
	conversor := aConversor.
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
