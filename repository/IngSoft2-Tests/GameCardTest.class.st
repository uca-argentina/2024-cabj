Class {
	#name : #GameCardTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aWormholeCreator',
		'aBoardCreator',
		'collectionOfCells',
		'gameDeck'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
GameCardTest >> setUp [
	
	super setUp.
	aLoadedDie := LoadedDie of: #( 6 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.

	30 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
		
	gameDeck := EffectManager
		            manage: (OrderedCollection
				             with: AccelerationCard new
				             with: AllyCard new
				             with: OverloadCard new
				             with: RedoCard new
				             with: RepeatCard new
				             with: CancellationCard new).
]

{ #category : #tests }
GameCardTest >> test03WhenOneAccelerationCardIsActiveThenSpaceshipMovesOneMoreThenThrowResult [

	| result aGame |

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
					andGameDeck: gameDeck.

	aGame usePermanentCard: AccelerationCard new.
	
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 8.


	self assert:( aGame spaceships cellsOfSpaceships )equals: result
]

{ #category : #tests }
GameCardTest >> test05SpaceshipOnePlaysOverloadToSpaceshipTwoThenTwoMovesLessTwo [

	| result aGame |
	
	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
					andGameDeck: gameDeck.
	
	aGame usePermanentCard: (OverloadCard toDoEffectFor: 2).
	aGame moveSpaceship.
	
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 7.
	result at:2 put: 5.

	self assert: aGame spaceships cellsOfSpaceships  equals: result.
]

{ #category : #tests }
GameCardTest >> test06GameActivatesAllyCardThenSpaceshipOneCanUseFuelFromSpaceshipTwo [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 1 ).
	
	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
					andGameDeck: gameDeck.

	aGame usePermanentCard: (AllyCard toDoEffectFor: 2).
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	
	result := Dictionary new.
	result at: 1 put: 22.
	result at: 2 put: 4.
	
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test07BothAllysRunOutOfFuelThenBothLooseTwoTurns [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 7 ).
	
	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
					andGameDeck: gameDeck.

	aGame usePermanentCard: (AllyCard toDoEffectFor: 2).
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test10SpaceshipThreeRemovesOverloadCardThenItMovesWithoutEffect [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 7 7 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
					andGameDeck: gameDeck.

	aGame usePermanentCard: (OverloadCard toDoEffectFor: 2).
	aGame moveSpaceship.
	aGame usePermanentCard: (OverloadCard toDoEffectFor: 3).
	aGame moveSpaceship.

	aGame
		spaceshipId: 2
		useInstantCard:
		(CancellationCard toDoEffectFor: (OverloadCard toDoEffectFor: 3)).
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 6.
	result at: 3 put: 8.

	self assert: aGame spaceships cellsOfSpaceships equals: result. 
]

{ #category : #tests }
GameCardTest >> test11CancelAllyCardThenBothSpaceshipsUseOnlyTheirFuelTank [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 1 ).
	
	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
					andGameDeck: gameDeck.
	
	aGame usePermanentCard: (AllyCard toDoEffectFor: 2).
	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard:
		(CancellationCard toDoEffectFor: (AllyCard toDoEffectFor: 2)).
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 3.
	self assert: aGame spaceships cellsOfSpaceships equals: result.
]

{ #category : #tests }
GameCardTest >> test12InstancCardPlayedOnAnoterSpaceshipsTurnThenInstantCardCanDoTheEffect [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 7 ).
	
	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
					andGameDeck: gameDeck.

	aGame usePermanentCard: (OverloadCard toDoEffectFor: 2).
	aGame
		spaceshipId: 2
		useInstantCard:
		(CancellationCard toDoEffectFor: (OverloadCard toDoEffectFor: 2)).
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 8.

	
	self assert: aGame spaceships cellsOfSpaceships equals: result.
]

{ #category : #tests }
GameCardTest >> test13AccelerationCardPlayedAndCancelledThenSpaceshipMovesWithoutEffect [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 7 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame usePermanentCard: AccelerationCard new.
	aGame
		spaceshipId: 2
		useInstantCard:
		(CancellationCard toDoEffectFor: AccelerationCard new).
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 8.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test14TwoRedoCardsPlayedAfterAccelerationThenSpaceshipMovesThreeCellsMore [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 7 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame usePermanentCard: AccelerationCard new.
	aGame spaceshipId: 2 useInstantCard: RedoCard new.
	aGame spaceshipId: 1 useInstantCard: (RedoCard forCardWith: 2).

	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 11.
	result at: 2 put: 1.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test15RedoCardPlayedAfterOverloadThenSpaceshipsAffectedHaveLessMovement [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 7 7 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame usePermanentCard: (OverloadCard toDoEffectFor: 2).
	aGame spaceshipId: 1 useInstantCard: (RedoCard forCardWith: 3).
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 6.
	result at: 3 put: 6.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test16RedoCardPlayedAfterAllyThenSpaceshipsThreeAndFourShareFuelBeacuseOfIt [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 7 7 1 ).
	aGame := Game
		         numberOfSpaceships: 4
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame usePermanentCard: (AllyCard toDoEffectFor: 2).
	aGame spaceshipId: 3 useInstantCard: (RedoCard forCardWith: 4).
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.
	result at: 3 put: 15.
	result at: 4 put: 4.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test17TwoAccelerationCardsPlayThenACancellationAndARedoSoNoAccelerationEffectOccurs [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 7 7 7 1 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame usePermanentCard: AccelerationCard new.
	aGame spaceshipId: 2 useInstantCard: RedoCard new.
	aGame
		spaceshipId: 2
		useInstantCard:
		(CancellationCard toDoEffectFor: AccelerationCard new).
	aGame
		spaceshipId: 1
		useInstantCard: (RedoCard forCardWith: AccelerationCard new).

	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test18SpaceshipOneEntersBlackHoleAndSpaceshipTwoRepeatsEffectThenSpaceshipOneIsInPositionOne [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 5 ).
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.
	10 timesRepeat: [ collectionOfCells add: Cell ].

	collectionOfCells at: 6 put: BlackHoleCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard: (RepeatCard toDoEffectFor: 1).

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test19ReapeatCardRepeatsACellThenNothingChanges [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 9 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard: (RepeatCard toDoEffectFor: 1).

	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test20RepeatCardRepeatsMoonWalkThenSpaceshipOneMovesBackwards [

	| aGame result |
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.
	10 timesRepeat: [ collectionOfCells add: Cell ].

	collectionOfCells at: 7 put: MoonWalkCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard: (RepeatCard toDoEffectFor: 2).

	result := Dictionary new.
	result at: 1 put: 3.
	result at: 2 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test21RepeatCardRepeatsAtomicBombThenEverySpaceshipIsOnCellOne [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 4 ).
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.
	10 timesRepeat: [ collectionOfCells add: Cell ].

	collectionOfCells at: 5 put: AtomicBombCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard: (RepeatCard toDoEffectFor: 1).

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test22RepeatCardRepeatsHyperJumpThenBothSpaceshipsMoveSameParsecs [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 8 ).

	collectionOfCells := OrderedCollection new.
	10 timesRepeat: [ collectionOfCells add: Cell ].

	collectionOfCells at: 9 put: HyperJumpCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 1
		useInstantCard: (RepeatCard toDoEffectFor: 2).

	result := Dictionary new.
	result at: 1 put: 4.
	result at: 2 put: 5.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test23RepeatCardRepeatsCardDispenserThenSpaceshipTwoHasSixCards [

	| aGame |
	aLoadedDie := LoadedDie of: #( 3 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.
	10 timesRepeat: [ collectionOfCells add: Cell ].

	collectionOfCells at: 4 put: CardDispenserCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard: (RepeatCard toDoEffectFor: 2).


	self assert: (aGame cardHand: 2) amount equals: 6
]

{ #category : #tests }
GameCardTest >> test24RepeatCardRepeatsWormholeThenSpaceshipOneGoesToWormhole [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 9 1 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard: (RepeatCard toDoEffectFor: 1).

	result := Dictionary new.
	result at: 1 put: 3.
	result at: 2 put: 3.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test25RedoCardPlayedAfterRepeatCardThenCellEffectRepeatsTwice [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 9 5 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.
	30 timesRepeat: [ collectionOfCells add: Cell ].

	collectionOfCells at: 6 put: BlackHoleCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard: (RepeatCard toDoEffectFor: 1).
	aGame spaceshipId: 2 useInstantCard: (RedoCard forCardWith: 1).

	result := Dictionary new.
	result at: 1 put: 2.
	result at: 2 put: 2.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test26RepeatCardRepeatsHyperGravityThenSpaceshipMovesWithoutImpediment [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 7 1 1 ).
	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 1
		useInstantCard: (RepeatCard toDoEffectFor: 2).
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 3.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test27WhenACardThatIsNotInHandTriesToActivateThenDoesNotDoTheEffectOfIt [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 14 12 12 1 ).
	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame usePermanentCard: AccelerationCard new.
	aGame
		spaceshipId: 1
		useInstantCard:
		(CancellationCard toDoEffectFor: AccelerationCard new).
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame usePermanentCard: AccelerationCard new.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 16.
	result at: 2 put: 13.
	result at: 3 put: 13.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test28CancellationCardCancelsOnlyTheCardThatIsExactlyTheSameAsTheOneItWantsToCancel [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 7 7 7 7 7 7 7 7 7 7 20 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame usePermanentCard: (OverloadCard toDoEffectFor: 2).
	aGame moveSpaceship.
	aGame usePermanentCard: (OverloadCard toDoEffectFor: 3).
	aGame moveSpaceship.
	aGame moveSpaceship.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		useInstantCard:
		(CancellationCard toDoEffectFor: (OverloadCard toDoEffectFor: 2)).
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 15.
	result at: 2 put: 13.
	result at: 3 put: 11.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test29RepeatHyperGravityForSpaceshipTwoThenItCannotMoveBeacuseOfIt [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 7 2 ).

	collectionOfCells := OrderedCollection new.
	10 timesRepeat: [ collectionOfCells add: Cell ].

	collectionOfCells at: 8 put: HyperGravityCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 1
		useInstantCard: (RepeatCard toDoEffectFor: 2).
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test30RepeatHyperGravityForSpaceshipTwoThenItCanMoveBeacuseOfThrowGreaterThenValue [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 7 6 ).

	collectionOfCells := OrderedCollection new.
	10 timesRepeat: [ collectionOfCells add: Cell ].

	collectionOfCells at: 8 put: HyperGravityCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame
		spaceshipId: 1
		useInstantCard: (RepeatCard toDoEffectFor: 2).
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 7.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test31SpaceshipThreeTriesToAllyWithTwoThenItCantBecauseTwoAlreadyHasAlly [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 1 1 7 1 ).
	aGame := Game
		         numberOfSpaceships: 4
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame usePermanentCard: (AllyCard toDoEffectFor: 2).
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame usePermanentCard: (AllyCard toDoEffectFor: 2).
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 4.
	result at: 2 put: 4.
	result at: 3 put: 1.
	result at: 4 put: 4.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]
