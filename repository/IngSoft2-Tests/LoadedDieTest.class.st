Class {
	#name : #LoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
LoadedDieTest >> test001ALoadedDieIsCreatedWithAnAmountOfFaces [

| aLoadedDie |
aLoadedDie:= LoadedDie of: 3.
self assert: aLoadedDie throw equals:3.
]

{ #category : #tests }
LoadedDieTest >> test002WhenLoadedDieIsThrownThenReturnsTheAmountOfFaces [

| aLoadedDie |
aLoadedDie:= LoadedDie of: 4.
self assert: aLoadedDie throw equals:4.
]

{ #category : #'tests - initialization' }
LoadedDieTest >> test003ALoadedDieCannotHaveLessThanThreeFaces [

self 
	should: [ LoadedDie of:2 ]
	raise: Error
	withMessage:'A die less than three faces doesnt exist'
]

{ #category : #tests }
LoadedDieTest >> testALoadedDieCannotHaveLessThanTjreeFaces [

self 
	should: [ LoadedDie of:2 ]
	raise: Error
	withMessage:'A die less than three faces doesnt exist'
]
