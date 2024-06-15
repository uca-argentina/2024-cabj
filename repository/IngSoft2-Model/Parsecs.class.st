Class {
	#name : #Parsecs,
	#superclass : #Object,
	#instVars : [
		'oneToOneRatio'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Parsecs class >> totalCells: anAmountOfCells convertionValue: aConvertionValue [

	^ self new
		  initializeTotalCells: anAmountOfCells
		  convertionValue: aConvertionValue
]

{ #category : #actions }
Parsecs >> convert: aValue [

	^ aValue * oneToOneRatio
]

{ #category : #initialization }
Parsecs >> initializeTotalCells: anAmountOfCells convertionValue: aConvertionValue [

	oneToOneRatio := anAmountOfCells / aConvertionValue
]
