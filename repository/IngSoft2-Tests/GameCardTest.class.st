Class {
	#name : #GameCardTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aWormholeCreator',
		'aBoardCreator',
		'collectionOfCells'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
GameCardTest >> setUp [

	aLoadedDie := LoadedDie of: #( 6 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.

	30 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
]

{ #category : #tests }
GameCardTest >> test03WhenOneAccelerationCardIsActiveThenSpaceshipMovesOneMoreThenThrowResult [

	| result aGame |

	aGame := Game
		         numberOfSpaceshipsPlayingWithAllCards: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: AccelerationCard new.
	
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 8.


	self assert:( aGame spaceships cellsOfSpaceships )equals: result
]

{ #category : #tests }
GameCardTest >> test05SpaceshipOnePlaysOverloadToSpaceshipTwoThenTwoMovesLessTwo [

	| result aGame |
	
	aGame := Game
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	
	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 2).
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (AllyCard shareFuelWith: 2).
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (AllyCard shareFuelWith: 2).
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
		         numberOfSpaceshipsPlayingWithAllCards: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 2).
	aGame moveSpaceship.
	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 3).
	aGame moveSpaceship.

	aGame
		spaceshipId: 2
		activateInstantCard:
		(CancellationCard cancel: (OverloadCard reduceThrowOf: 3)).
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	
	aGame activatePermanentCard: (AllyCard shareFuelWith: 2).
	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard:
		(CancellationCard cancel: (AllyCard shareFuelWith: 2)).
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 2).
	aGame
		spaceshipId: 2
		activateInstantCard:
		(CancellationCard cancel: (OverloadCard reduceThrowOf: 2)).
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	
	aGame activatePermanentCard: AccelerationCard new.
	aGame
		spaceshipId: 2
		activateInstantCard: (CancellationCard cancel: AccelerationCard new).
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 8.
	self assert: aGame spaceships cellsOfSpaceships  equals: result.
]

{ #category : #tests }
GameCardTest >> test14TwoRedoCardsPlayedAfterAccelerationThenSpaceshipMovesThreeCellsMore [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 7 ).
	
	aGame := Game
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: AccelerationCard new.
	aGame spaceshipId: 2 activateInstantCard: RedoCard new.
	aGame
		spaceshipId: 1
		activateInstantCard:
		(RedoCard forSpaceshipId: 2 orCardToCancel: nil).
		
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
		         numberOfSpaceshipsPlayingWithAllCards: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 2).
	aGame
		spaceshipId: 1
		activateInstantCard:
		(RedoCard forSpaceshipId: 3 orCardToCancel: nil).
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
		         numberOfSpaceshipsPlayingWithAllCards: 4
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (AllyCard shareFuelWith: 2).
	aGame
		spaceshipId: 3
		activateInstantCard:
		(RedoCard forSpaceshipId: 4 orCardToCancel: nil).
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: AccelerationCard new.
	aGame spaceshipId: 2 activateInstantCard: RedoCard new.
	aGame
		spaceshipId: 2
		activateInstantCard: (CancellationCard cancel: AccelerationCard new).
	aGame
		spaceshipId: 1
		activateInstantCard:
		(RedoCard forSpaceshipId: nil orCardToCancel: AccelerationCard new).
		
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard: (RepeatCard repeatEffectFor: 1).
		
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard: (RepeatCard repeatEffectFor: 1).
		
	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test20RepeatCradRepeatsMoonWalkThenSpaceshipTwoIsinPositionOne [

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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard: (RepeatCard repeatEffectFor: 1).
		
	result := Dictionary new.
	result at: 1 put: 7.
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard: (RepeatCard repeatEffectFor: 1).
		
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 1
		activateInstantCard: (RepeatCard repeatEffectFor: 2).
		
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard: (RepeatCard repeatEffectFor: 2).


	self assert: (aGame cardHand: 2) amount equals: 6
]

{ #category : #tests }
GameCardTest >> test24RepeatCardRepeatsWormholeThenSpaceshipOneGoesToWormhole [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 9 1 ).

	aGame := Game
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard: (RepeatCard repeatEffectFor: 1).
	
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard: (RepeatCard repeatEffectFor: 1).
	aGame
		spaceshipId: 2
		activateInstantCard:
		(RedoCard forSpaceshipId: 1 orCardToCancel: nil).

	result := Dictionary new.
	result at: 1 put: 2.
	result at: 2 put: 2.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test26RepeatCardRepeatsHyperGravityThenSpaceshipMovesWithoutImpediment [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 7 1 1).
	aGame := Game
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 1
		activateInstantCard: (RepeatCard repeatEffectFor: 2).
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 3.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test27WhenACardThatIsNotInHandTriesToActivateThenDoesNotDoTheEffectOfIt [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 14 12 12 1).
	aGame := Game
		         numberOfSpaceshipsPlayingWithAllCards: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (AccelerationCard new).
	aGame
		spaceshipId: 1
		activateInstantCard:
		(CancellationCard cancel: (AccelerationCard new )).
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame activatePermanentCard: (AccelerationCard new).
	aGame  moveSpaceship .
	
	result := Dictionary new.
	result at: 1 put: 16.
	result at: 2 put: 13.
	result at: 3 put:13.
	
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameCardTest >> test28CancellationCardCancelsOnlyTheCardThatIsExactlyTheSameAsTheOneItWantsToCancel [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 7 7 7 7 7 7 7 7 7 7 20 ).

	aGame := Game
		         numberOfSpaceshipsPlayingWithAllCards: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 2).
	aGame moveSpaceship.
	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 3).
	aGame moveSpaceship.
	aGame moveSpaceship.
	
	aGame moveSpaceship.
	aGame
		spaceshipId: 2
		activateInstantCard:
		(CancellationCard cancel: (OverloadCard reduceThrowOf: 2)).
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 15.
	result at: 2 put: 13.
	result at: 3 put: 11.

	self assert: aGame spaceships cellsOfSpaceships equals: result. 
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 1
		activateInstantCard: (RepeatCard repeatEffectFor: 2).
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
		         numberOfSpaceshipsPlayingWithAllCards: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame
		spaceshipId: 1
		activateInstantCard: (RepeatCard repeatEffectFor: 2).
	aGame moveSpaceship.
	
	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 7.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]
