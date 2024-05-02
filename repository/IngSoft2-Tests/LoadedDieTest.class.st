Class {
	#name : #LoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
LoadedDieTest >> testWhenLoadedDieIsThrownThenReturnsTheAmountOfFaces [

| aLoadedDie |
aLoadedDie:= LoadedDie of: 4.
self assert: aLoadedDie throw equals:4.
]

{ #category : #tests }
LoadedDieTest >> testWhenLoadedDieIsThrownThenReturnsThree [

| aLoadedDie |
aLoadedDie:= LoadedDie of:3.
self assert: aLoadedDie throw equals:3.
]
