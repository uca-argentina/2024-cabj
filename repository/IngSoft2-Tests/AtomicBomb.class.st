Class {
	#name : #AtomicBomb,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AtomicBomb >> test01WhenAnAtomicBombCellsEnterThenReturnsOne [

	| anAtomicBombCell |
	anAtomicBombCell := AtomicBombCell new.

	self assert: anAtomicBombCell enter equals: 1
]
