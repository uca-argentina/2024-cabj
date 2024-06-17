Class {
	#name : #HyperJumpCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
HyperJumpCellTest >> test01HyperJumpCreatedOnPositionFiveThenEnterReturnsNine [

	| aConversor aHyperJumpCell |
	aConversor := Conversor totalCells: 10 convertionValue: 5.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection with: (Parsecs ofValue: 2) with: (Parsecs ofValue: 1) ).

	self assert: aHyperJumpCell enter equals: 9
]

{ #category : #tests }
HyperJumpCellTest >> test02HyperJumpCellEntersASecondTimeThenReturnsSecondeValueOfCollection [

	| aConversor aHyperJumpCell |
	aConversor := Conversor totalCells: 10 convertionValue: 100.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection with: (Parsecs ofValue: 20) with: (Parsecs ofValue: 10) ).
	aHyperJumpCell enter.
	self assert: aHyperJumpCell enter equals: 6
]

{ #category : #tests }
HyperJumpCellTest >> test03HyperJumpExitThenReturnsTrue [

	| aConversor aHyperJumpCell |
	aConversor := Conversor totalCells: 10 convertionValue: 100.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection with: (Parsecs ofValue: 20) with: (Parsecs ofValue: 10) ).
	aHyperJumpCell enter.
	self assert: (aHyperJumpCell exit:5)
]

{ #category : #tests }
HyperJumpCellTest >> test04HyperJumpRecivesLightYearsThenConvertsToParsecs [

	| aConversor aHyperJumpCell |
	aConversor := Conversor totalCells: 10 convertionValue: 5.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection
				                   with: (LightYear ofValue: 6)
				                   with: (LightYear ofValue: 3)).
				
	self assert: aHyperJumpCell enter equals: 9
]

{ #category : #tests }
HyperJumpCellTest >> test05HyperJumpCreatedWithTwoMetricsThenEnterConvertsBothMetrics [

	| aConversor aHyperJumpCell |
	aConversor := Conversor totalCells: 10 convertionValue: 5.
	aHyperJumpCell := HyperJumpCell
		                  withPosition: 5
		                  Conversor: aConversor
		                  andValues: (OrderedCollection
				                   with: (Parsecs ofValue: 2)
				                   with: (LightYear ofValue: 3)).

	self assert: aHyperJumpCell enter equals: 9.
	self assert: aHyperJumpCell enter equals: 7
]
