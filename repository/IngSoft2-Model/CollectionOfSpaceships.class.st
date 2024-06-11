Class {
	#name : #CollectionOfSpaceships,
	#superclass : #Object,
	#instVars : [
		'fuel',
		'amountOfCells',
		'collection'
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

	^ collection at: anIndex
]

{ #category : #accessing }
CollectionOfSpaceships >> cellsOfSpaceships [

	| dictionaryOfCellPositions |
	dictionaryOfCellPositions := Dictionary new.
	collection do: [ :spaceship |
		dictionaryOfCellPositions
			at: spaceship getId
			put: spaceship objectPosition cell ].

	^ dictionaryOfCellPositions
]

{ #category : #initialization }
CollectionOfSpaceships >> collectSpaceships: anAmountOfSpaceships [

	| aSpaceship |
	collection := OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [
		aSpaceship := Spaceship launchWithFuel: fuel.
		collection add: aSpaceship.
		aSpaceship objectPosition setIndexWith: amountOfCells ].
	Spaceship initialize
]

{ #category : #accessing }
CollectionOfSpaceships >> getRanking [

	| sortedSpaceships collectionOfRanking |
	sortedSpaceships := collection  asSortedCollection: [:a :b |
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
		collectionOfRanking add: spaceship getId ].

	^ collectionOfRanking first: 3
]

{ #category : #accessing }
CollectionOfSpaceships >> indexOf: aSpaceship [

	^ collection indexOf: aSpaceship
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
	collection do: [ :spaceship |
		dictionaryOfCellPositions
			at: spaceship getId
			put: spaceship objectPosition lap ].

	^ dictionaryOfCellPositions
]

{ #category : #action }
CollectionOfSpaceships >> moveBackwards: anAmountOfMovements except: aSpaceship [

	| aSpaceshipPosition aPositionNewIndex aPositionNewCell collectionMinusSpaceship |
	collectionMinusSpaceship := collection copy.
	collectionMinusSpaceship remove: aSpaceship.
	1 to: collectionMinusSpaceship size do: [ :index |
		aSpaceshipPosition := (collectionMinusSpaceship at: index)
			                      objectPosition.
		aPositionNewIndex := aSpaceshipPosition getIndex
		                     - anAmountOfMovements.
		aPositionNewCell := aSpaceshipPosition cell - anAmountOfMovements.
		aSpaceshipPosition setCellAndLapWith: aPositionNewIndex ]
]

{ #category : #accessing }
CollectionOfSpaceships >> positionsOfSpaceships [

	| dictionaryOfCellPositions |
	dictionaryOfCellPositions := Dictionary new.
	collection do: [ :spaceship |
		dictionaryOfCellPositions
			at: spaceship getId
			put: spaceship objectPosition getPosition ].

	^ dictionaryOfCellPositions
]

{ #category : #action }
CollectionOfSpaceships >> resetToCellOne [

	| aSpaceship |
	1 to: collection size do: [ :index |
		aSpaceship := collection at: index.
		aSpaceship objectPosition setCell: 1 ]
]

{ #category : #accessing }
CollectionOfSpaceships >> size [

	^ collection size
]
