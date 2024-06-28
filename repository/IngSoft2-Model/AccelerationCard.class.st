Class {
	#name : #AccelerationCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
AccelerationCard >> applyEffectOn: throwResult for: spaceshipId [

	^ throwResult + 1
]

{ #category : #comparing }
AccelerationCard >> isExactlyTheSameCard:aCard [
 ^aCard =self. 
]
