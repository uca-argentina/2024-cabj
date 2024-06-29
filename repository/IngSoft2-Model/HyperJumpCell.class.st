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
HyperJumpCell >> applyEffectTo: aSpaceship on: aGame [

	| convertionOfNextValue aNumberOfMovements |
	convertionOfNextValue := conversor convert: currentValue.
	previousValue := currentValue.
	self nextValue.
	aNumberOfMovements := aGame
		                      checkMoveIsPossible: convertionOfNextValue
		                      for: aSpaceship.
	aSpaceship move: aNumberOfMovements
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
