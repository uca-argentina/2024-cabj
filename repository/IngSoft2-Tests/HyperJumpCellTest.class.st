Class {
	#name : #HyperJumpCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
HyperJumpCellTest >> test01HyperJumpCreatedOnPositionFiveThenEnterReturnsNine [

	| aConversor aHyperJumpCell aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aConversor := Conversor totalCells: 10 convertionValue: 5.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection with: (Parsecs ofValue: 2) with: (Parsecs ofValue: 1) ).

	self assert: (aHyperJumpCell enterOn:aGame) equals: 9
]

{ #category : #tests }
HyperJumpCellTest >> test02HyperJumpCellEntersASecondTimeThenReturnsSecondeValueOfCollection [

	| aConversor aHyperJumpCell aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie. 
	aConversor := Conversor totalCells: 10 convertionValue: 100.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection with: (Parsecs ofValue: 20) with: (Parsecs ofValue: 10) ).
	aHyperJumpCell enterOn:aGame.
	self assert: (aHyperJumpCell enterOn:aGame )equals: 6
]

{ #category : #tests }
HyperJumpCellTest >> test03HyperJumpExitThenReturnsTrue [

	| aConversor aHyperJumpCell aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aConversor := Conversor totalCells: 10 convertionValue: 100.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection with: (Parsecs ofValue: 20) with: (Parsecs ofValue: 10) ).
	aHyperJumpCell enterOn:aGame.
	self assert: (aHyperJumpCell exit:5)
]

{ #category : #tests }
HyperJumpCellTest >> test04HyperJumpRecivesLightYearsThenConvertsToParsecs [

	| aConversor aHyperJumpCell aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aConversor := Conversor totalCells: 10 convertionValue: 5.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection
				                   with: (LightYear ofValue: 6)
				                   with: (LightYear ofValue: 3)).
				
	self assert: (aHyperJumpCell enterOn:aGame) equals: 9
]

{ #category : #tests }
HyperJumpCellTest >> test05HyperJumpCreatedWithTwoMetricsThenEnterConvertsBothMetrics [

	| aConversor aHyperJumpCell aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aConversor := Conversor totalCells: 10 convertionValue: 5.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection
				                   with: (Parsecs ofValue: 2)
				                   with: (LightYear ofValue: 3)).

	self assert: (aHyperJumpCell enterOn:aGame) equals: 9.
	self assert: (aHyperJumpCell enterOn:aGame)equals: 7
]
