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

	self assert: aActiveDeck cards size equals: 0
]

{ #category : #tests }
CardTest >> test05GameDeckInitializeThenSizeEqualsAllpossibleCardsToPlayWith [

	| aGameDeck |
	aGameDeck := GameDeck startGame.

	self assert: aGameDeck size equals: 6
]

{ #category : #tests }
CardTest >> test06SpaceshipCardHandGainsACardThenAmountOfCardsEqualsThree [

	| aSpaceshipCardHand |
	aSpaceshipCardHand := SpaceshipCardHand startGame.
	SpaceshipCardHand initialize.
	aSpaceshipCardHand gainACard.

	self assert: aSpaceshipCardHand amount equals: 3
]

{ #category : #tests }
CardTest >> test07ActiveDeckRemoveOverloadCardThenNoEffectOnThatId [
	| aActiveDeck |
	aActiveDeck := ActiveDeck startGame.
	aActiveDeck activate: (OverloadCard reduceThrowOf: 2).
	aActiveDeck activate: (OverloadCard reduceThrowOf: 3).
	
	aActiveDeck removeACard: (OverloadCard reduceThrowOf: 3).

	self assert: (aActiveDeck applyEffectOn: 10 withCurrentSpaceship: 3) equals: 10
]
