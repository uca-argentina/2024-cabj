Class {
	#name : #EffectManager,
	#superclass : #Object,
	#instVars : [
		'boardCreator',
		'dictionaryOfProbabilities',
		'regularCellProbability',
		'blackHoleProbability',
		'hyperGravityProbability',
		'moonWalkProbability',
		'hyperJumpProbability',
		'atomicBombProbability'
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

	hyperJumpProbability+1 to: atomicBombProbability do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createAtomicBombCells ] ]
]

{ #category : #initialization }
EffectManager >> addBlackHoleToDictionary [

	regularCellProbability+1 to: blackHoleProbability do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createBlackHoleCells ] ]
]

{ #category : #initialization }
EffectManager >> addHyperGravityToDictionary [

	blackHoleProbability+1 to: hyperGravityProbability do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createHyperGravityCells ] ]
]

{ #category : #initialization }
EffectManager >> addHyperJumpToDictionary [

	moonWalkProbability+1 to: hyperJumpProbability do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createHyperJumpCells ] ]
]

{ #category : #initialization }
EffectManager >> addMoonWalkToDictionary [

	hyperGravityProbability+1 to: moonWalkProbability do: [ :key |
		dictionaryOfProbabilities
			at: key
			put: [ boardCreator createMoonWalkCells ] ]
]

{ #category : #initialization }
EffectManager >> addRegularCellToDictionary [

	1 to: regularCellProbability do: [ :key |
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
	regularCellProbability := collectionOfProbabilities at: 1.
	blackHoleProbability := (collectionOfProbabilities at: 2) + regularCellProbability.
	hyperGravityProbability := (collectionOfProbabilities at: 3) + blackHoleProbability.
	moonWalkProbability := (collectionOfProbabilities at: 4) + hyperGravityProbability.
	hyperJumpProbability := (collectionOfProbabilities at: 5) + moonWalkProbability.
	atomicBombProbability := (collectionOfProbabilities at: 6) + hyperJumpProbability.
	dictionaryOfProbabilities := Dictionary new.
	self addRegularCellToDictionary.
	self addBlackHoleToDictionary.
	self addHyperGravityToDictionary.
	self addMoonWalkToDictionary.
	self addHyperJumpToDictionary.
	self addAtomicBombToDictionary.
]