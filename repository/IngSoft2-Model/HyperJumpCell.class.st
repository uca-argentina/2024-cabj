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
HyperJumpCell class >> withConversor: aConversor andValues: aCollection [

	^ self new initializeWithConversor: aConversor andValues: aCollection
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
	aSpaceship move: aNumberOfMovements.
	aSpaceship position adjustPositionWith: aGame finishLine.
	aGame checkAndHandleFuelDepletion: aSpaceship
]

{ #category : #initialization }
HyperJumpCell >> initializeWithConversor: aConversor andValues: aCollection [

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
