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

	| sortedSpaceships collectionOfRanking |
	sortedSpaceships := spaceships  asSortedCollection: [:a :b |
    | lapsA lapsB positionsA positionsB |
    lapsA := (a objectPosition lap ).
    lapsB := (b objectPosition lap).
    positionsA := (a objectPosition cell ).
    positionsB := (b objectPosition cell).
    lapsA = lapsB
        ifTrue: [positionsA > positionsB]
        ifFalse: [lapsA > lapsB]
].


	collectionOfRanking := OrderedCollection new.
	sortedSpaceships do: [ :spaceship |
		collectionOfRanking add: spaceship id ].

	^ collectionOfRanking first: 3
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

{ #category : #action }
CollectionOfSpaceships >> move: anAmountOfMovements except: aSpaceship [

	| aSpaceshipAux collectionMinusSpaceship |
	collectionMinusSpaceship := spaceships copy.
	collectionMinusSpaceship remove: aSpaceship.
	1 to: collectionMinusSpaceship size do: [ :index |
		aSpaceshipAux := (collectionMinusSpaceship at: index).
		aSpaceshipAux move: anAmountOfMovements. ]
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

{ #category : #action }
CollectionOfSpaceships >> resetToCellOne [

	| aSpaceship |
	1 to: spaceships size do: [ :index |
		aSpaceship := spaceships at: index.
		aSpaceship objectPosition resetToOne ]
]

{ #category : #accessing }
CollectionOfSpaceships >> size [

	^ spaceships size
]
