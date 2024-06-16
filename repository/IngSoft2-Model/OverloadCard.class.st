Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'spaceshipId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
OverloadCard >> = aCard [

	^ self class == aCard class
]

{ #category : #activation }
OverloadCard >> activate [

	^ [
	  spaceshipId := UIManager default request:
		                 'Please enter id of spaceship to activate overload:'.
	  Transcript
		  show: 'User input: ' , spaceshipId;
		  cr ]
]
