Class {
	#name : #AtomicBombCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AtomicBombCellTest >> test01WhenAnAtomicBombCellsEnterThenReturnsOne [

	| anAtomicBombCell |
	
	anAtomicBombCell := AtomicBombCell new.

	self assert: anAtomicBombCell enter equals: 1
]
