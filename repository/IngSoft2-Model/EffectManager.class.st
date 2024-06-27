Class {
	#name : #EffectManager,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
EffectManager class >> for: aBoardCreator probabilitiesDistribution: collectionOfProbabilities [

	^ self new
		  initializeFor: aBoardCreator
		  probabilitiesDistribution: collectionOfProbabilities
]

{ #category : #'instance creation' }
EffectManager class >> manage: aCollectionOfObjects withProbabilitiesDistribution: collectionOfProbabilities [

	^ self new
		  initializeManage: aCollectionOfObjects
		  withProbabilitiesDistribution: collectionOfProbabilities
]

{ #category : #creating }
EffectManager >> createCollectionSize: aNumber [

	| collectionOfObjects |
	collectionOfObjects := OrderedCollection new.
	aNumber timesRepeat: [
		collectionOfObjects add: (dictionary at: 100 atRandom) ].
	^ collectionOfObjects
]

{ #category : #initialization }
EffectManager >> initializeManage: aCollectionOfObjects withProbabilitiesDistribution: collectionOfProbabilities [

	| index totalCount |
	dictionary := Dictionary new.
	index := 1.
	totalCount := 0.

	aCollectionOfObjects
		with: collectionOfProbabilities
		do: [ :object :count |
			| remaining |
			remaining := 100 - totalCount.

			count timesRepeat: [
				dictionary at: index put: object.
				index := index + 1 ].

			totalCount := totalCount + count.]
]
