Class {
	#name : #CellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
CellTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
CellTest >> test02PositionOfTheCellHasToBeGreaterThanZero [ 

	self
		should: [ Cell position: 0 ]
		raise: Error
		withMessage: 'A cell must have position greater than zero'

]
