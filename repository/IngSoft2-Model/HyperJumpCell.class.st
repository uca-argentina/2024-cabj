Class {
	#name : #HyperJumpCell,
	#superclass : #RegularCell,
	#instVars : [
		'parsecsObject',
		'collectionOfValues',
		'currentValue',
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperJumpCell class >> newOn: aGame withPosition: aPosition Parsecs: aParsecs andValues: aCollection [

	^ self new
		  initializeNewOn: aGame
		  withPosition: aPosition
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
HyperJumpCell >> initializeNewOn: aGame withPosition: aPosition Parsecs: aParsecs andValues: aCollection [

	game := aGame.
	cellPosition := aPosition.
	parsecsObject := aParsecs.
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
