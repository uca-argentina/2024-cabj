Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardTest >> test01SpaceshipCardHandInitializeThenAmountOfCardsEqualsTwo [

	| aSpaceshipCardHand |
	aSpaceshipCardHand := SpaceshipCardHand startGame.
	SpaceshipCardHand initialize.

	self assert: aSpaceshipCardHand amount equals: 2
]

{ #category : #tests }
CardTest >> test02ActiveDeckInitializeThenActiveCardsEqualsZero [

	| aActiveDeck |
	aActiveDeck := ActiveDeck startGame.

	self assert: aActiveDeck activeCards equals: 0
]

{ #category : #tests }
CardTest >> test04SpaceshipCardHandInitializeThenIdEqualsOne [

	| aSpaceshipCardHand |
	aSpaceshipCardHand := SpaceshipCardHand startGame.
	SpaceshipCardHand initialize.
	self assert: aSpaceshipCardHand id equals: 1
]

{ #category : #tests }
CardTest >> test05GameDeckInitializeThenSizeEqualsAllpossibleCardsToPlayWith [

	| aGameDeck |
	aGameDeck := GameDeck startGame.

	self assert: aGameDeck size equals: 3
]

{ #category : #tests }
CardTest >> test06SpaceshipCardHandGainsACardThenAmountOfCardsEqualsThree [

	| aSpaceshipCardHand |
	aSpaceshipCardHand := SpaceshipCardHand startGame.
	SpaceshipCardHand initialize.
	aSpaceshipCardHand gainACard.

	self assert: aSpaceshipCardHand amount equals: 3
]
