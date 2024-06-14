Class {
	#name : #CollectionOfSpaceships,
	#superclass : #Object,
	#instVars : [
		'fuel',
		'amountOfCells',
		'spaceships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CollectionOfSpaceships class >> numberOfSpaceships: anAmountOfSpaceships withAmountOfFuel: anAmountOfFuel indexCalculateWith: anAmountOfCells [

	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships
		  withAmountOfFuel: anAmountOfFuel
		  indexCalculateWith: anAmountOfCells
]

{ #category : #accessing }
CollectionOfSpaceships >> at: anIndex [

	^ spaceships at: anIndex
]

{ #category : #accessing }
CollectionOfSpaceships >> cellsOfSpaceships [

	| dictionaryOfCellPositions |
	dictionaryOfCellPositions := Dictionary new.
	spaceships do: [ :spaceship |
		dictionaryOfCellPositions
			at: spaceship id
			put: spaceship objectPosition cell ].

	^ dictionaryOfCellPositions
]

{ #category : #initialization }
CollectionOfSpaceships >> collectSpaceships: anAmountOfSpaceships [

	| aSpaceship |
	spaceships := OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [
		aSpaceship := Spaceship launchWithFuel: fuel.
		spaceships add: aSpaceship.
		aSpaceship objectPosition setIndexWith: amountOfCells ].
	Spaceship initialize
]

{ #category : #accessing }
CollectionOfSpaceships >> getRanking [

	| sortedSpaceships |
	sortedSpaceships := spaceships.
	sortedSpaceships sort: [ :a :b | a > b ].
	
	^sortedSpaceships collect: [ :spaceship | spaceship id ]
]

{ #category : #accessing }
CollectionOfSpaceships >> indexOf: aSpaceship [

	^ spaceships indexOf: aSpaceship
]

{ #category : #initialization }
CollectionOfSpaceships >> initializeNumberOfSpaceships: anAmountOfSpaceships withAmountOfFuel: anAmountOfFuel indexCalculateWith: anAmountOfCells [

	fuel := anAmountOfFuel.
	amountOfCells := anAmountOfCells.
	self collectSpaceships: anAmountOfSpaceships
]

{ #category : #accessing }
CollectionOfSpaceships >> lapsOfSpaceships [

	| dictionaryOfCellPositions |
	dictionaryOfCellPositions := Dictionary new.
	spaceships do: [ :spaceship |
		dictionaryOfCellPositions
			at: spaceship id
			put: spaceship objectPosition lap ].

	^ dictionaryOfCellPositions
]

{ #category : #accessing }
CollectionOfSpaceships >> positionsOfSpaceships [

	| dictionaryOfCellPositions |
	dictionaryOfCellPositions := Dictionary new.
	spaceships do: [ :spaceship |
		dictionaryOfCellPositions
			at: spaceship id
			put: spaceship objectPosition getPosition ].

	^ dictionaryOfCellPositions
]

{ #category : #accessing }
CollectionOfSpaceships >> size [

	^ spaceships size
]

{ #category : #accessing }
CollectionOfSpaceships >> spaceships [

	^ spaceships
]
