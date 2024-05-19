Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'actualPosition',
		'id'
	],
	#classInstVars : [
		'counterId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
Spaceship class >> initialize [

	counterId := 0
]

{ #category : #'instance creation' }
Spaceship class >> launch [

	counterId := counterId + 1.
	^ self new initializeLaunch: counterId
]

{ #category : #initialization }
Spaceship class >> resetCounter [

	counterId := 0
]

{ #category : #accessing }
Spaceship >> getId [
	^id.
]

{ #category : #initialization }
Spaceship >> initializeLaunch: counterId [
	actualPosition:= 0.
	id:= counterId .
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements on: aBoard [

	actualPosition:= aBoard enter: (actualPosition + aNumberOfMovements).
	^actualPosition 
]

{ #category : #accessing }
Spaceship >> position [
	^ actualPosition .
]
