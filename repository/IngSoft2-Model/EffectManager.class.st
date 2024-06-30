Class {
	#name : #EffectManager,
	#superclass : #Object,
	#instVars : [
		'dictionary',
		'probabilities',
		'objects'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
EffectManager class >> manage: aCollectionOfObjects [

	^ self new
		  initializeManage: aCollectionOfObjects
		  withProbabilitiesDistribution: 100
]

{ #category : #'instance creation' }
EffectManager class >> manage: aCollectionOfObjects withProbabilitiesDistribution: collectionOfProbabilities [
	
	collectionOfProbabilities sum = 100 ifFalse: [ Error signal: 'Sum of probabilities must be equal to one hundred'].
	aCollectionOfObjects size = collectionOfProbabilities size ifFalse: [ Error signal: 'Size of objects to manage must be equal to size of distribution probabilities'].

	^ self new
		  initializeManage: aCollectionOfObjects
		  withProbabilitiesDistribution: collectionOfProbabilities
]

{ #category : #creating }
EffectManager >> createCollectionSize: aNumber [

	| collectionOfObjects |
	probabilities = 100 ifTrue:[^objects copy].
	collectionOfObjects := OrderedCollection new.
	aNumber timesRepeat: [
		collectionOfObjects add: (dictionary at: 100 atRandom) ].
	^ collectionOfObjects
]

{ #category : #creating }
EffectManager >> giveOneObject [

	| objectToGive |
	probabilities = 100 ifTrue: [ ^ objects at: 1 ].
	objectToGive := dictionary at: 100 atRandom.
	^ objectToGive
]

{ #category : #initialization }
EffectManager >> initializeManage: aCollectionOfObjects withProbabilitiesDistribution: collectionOfProbabilities [

	| index totalCount |
	dictionary := Dictionary new.
	index := 1.
	totalCount := 0.
	probabilities := collectionOfProbabilities.

	collectionOfProbabilities = 100 ifTrue: [
		objects := aCollectionOfObjects.
		^ self ].
	aCollectionOfObjects
		with: collectionOfProbabilities
		do: [ :object :count |
			| remaining |
			remaining := 100 - totalCount.

			count timesRepeat: [
				dictionary at: index put: object.
				index := index + 1 ].

			totalCount := totalCount + count ]
]
