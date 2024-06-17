Class {
	#name : #EffectManager,
	#superclass : #Object,
	#instVars : [
		'boardCreator',
		'dictionaryOfProbabilities',
		'atomicBombCeilOfDistribution',
		'blackHoleCeilOfDistribution',
		'cardDispenserCellCeilOfDistribution',
		'hyperGravityCeilOfDistribution',
		'hyperJumpCeilOfDistribution',
		'moonWalkCeilOfDistribution',
		'regularCellCeilOfDistribution'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
EffectManager class >> for: aBoardCreator probabilitiesDistribution: collectionOfProbabilities [

	^ self new
		  initializeFor: aBoardCreator
		  probabilitiesDistribution: collectionOfProbabilities
]

{ #category : #initialization }
EffectManager >> addAtomicBombToDictionary [

	hyperJumpCeilOfDistribution+1 to: atomicBombCeilOfDistribution do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createAtomicBombCells ] ]
]

{ #category : #initialization }
EffectManager >> addBlackHoleToDictionary [

	cardDispenserCellCeilOfDistribution+1 to: blackHoleCeilOfDistribution do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createBlackHoleCells ] ]
]

{ #category : #initialization }
EffectManager >> addCardDispenserToDictionary [

	1 to: cardDispenserCellCeilOfDistribution do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createCardDispenserCells ] ]
]

{ #category : #initialization }
EffectManager >> addHyperGravityToDictionary [

	blackHoleCeilOfDistribution+1 to: hyperGravityCeilOfDistribution do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createHyperGravityCells ] ]
]

{ #category : #initialization }
EffectManager >> addHyperJumpToDictionary [

	moonWalkCeilOfDistribution+1 to: hyperJumpCeilOfDistribution do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createHyperJumpCells ] ]
]

{ #category : #initialization }
EffectManager >> addMoonWalkToDictionary [

	hyperGravityCeilOfDistribution+1 to: moonWalkCeilOfDistribution do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createMoonWalkCells ] ]
]

{ #category : #initialization }
EffectManager >> addRegularCellToDictionary [

	atomicBombCeilOfDistribution+1 to: regularCellCeilOfDistribution do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createRegularCells ] ]
]

{ #category : #creating }
EffectManager >> createEffect: aNumber [

	^ dictionaryOfProbabilities at: aNumber
]

{ #category : #'set and get' }
EffectManager >> dictionaryOfProbabilities [

	^ dictionaryOfProbabilities
]

{ #category : #initialization }
EffectManager >> initializeFor: aBoardCreator probabilitiesDistribution: collectionOfProbabilities [

	boardCreator := aBoardCreator.
	cardDispenserCellCeilOfDistribution := collectionOfProbabilities at: 1.
	blackHoleCeilOfDistribution := (collectionOfProbabilities at: 2) + cardDispenserCellCeilOfDistribution.
	hyperGravityCeilOfDistribution := (collectionOfProbabilities at: 3) + blackHoleCeilOfDistribution.
	moonWalkCeilOfDistribution := (collectionOfProbabilities at: 4) + hyperGravityCeilOfDistribution.
	hyperJumpCeilOfDistribution := (collectionOfProbabilities at: 5) + moonWalkCeilOfDistribution.
	atomicBombCeilOfDistribution := (collectionOfProbabilities at: 6) + hyperJumpCeilOfDistribution.
	regularCellCeilOfDistribution := 100.
	dictionaryOfProbabilities := Dictionary new.
	self addCardDispenserToDictionary.
	self addBlackHoleToDictionary.
	self addHyperGravityToDictionary.
	self addMoonWalkToDictionary.
	self addHyperJumpToDictionary.
	self addAtomicBombToDictionary.
	self addRegularCellToDictionary.
]
