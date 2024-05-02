Class {
	#name : #LoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
LoadedDieTest >> testLoadedDie000 [

| aLoadedDie |
aLoadedDie:= LoadedDie new.
self assert: aLoadedDie throw equals:3.
]
