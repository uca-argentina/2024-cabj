Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardTest >> test01SpaceshipCardHandInitializeThenAmountOfCardsEqualsTwo [

	| aSpaceshipCardHand gameDeck |
	gameDeck := EffectManager
		            manage: (OrderedCollection with: AccelerationCard with: OverloadCard).
	aSpaceshipCardHand := SpaceshipCardHand startGameWith: gameDeck.
	SpaceshipCardHand initialize.

	self assert: aSpaceshipCardHand amount equals: 2
]

{ #category : #tests }
CardTest >> test06SpaceshipCardHandGainsACardThenAmountOfCardsEqualsThree [

	| aSpaceshipCardHand gameDeck |
	gameDeck := EffectManager
		            manage: (OrderedCollection with: AccelerationCard)
		            withProbabilitiesDistribution: #( 100 ).
	aSpaceshipCardHand := SpaceshipCardHand startGameWith: gameDeck.
	SpaceshipCardHand initialize.
	aSpaceshipCardHand gainACard.

	self assert: aSpaceshipCardHand amount equals: 3
]

{ #category : #tests }
CardTest >> test07ActiveDeckRemoveOverloadCardThenNoEffectOnThatId [
	| aActiveDeck |
	aActiveDeck := ActiveDeck startGame.
	aActiveDeck activate: (OverloadCard toDoEffectFor: 2).
	aActiveDeck activate: (OverloadCard toDoEffectFor: 3).
	
	aActiveDeck removeACard: (OverloadCard toDoEffectFor: 3).

	self assert: (aActiveDeck applyEffectOn: 10 withCurrentSpaceship: 3) equals: 10
]
