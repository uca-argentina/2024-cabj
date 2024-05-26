Class {
	#name : #MoonWalkTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkTest >> test01 [
| aMoonWalkCell spaceshipOne spaceshipTwo aCollectionOfSpaceships |
aMoonWalkCell:=MoonWalkCell withValue:3 inPosition:6.
spaceshipOne:=Spaceship launchWithFuel: 50.
spaceshipTwo:=Spaceship launchWithFuel: 40.
aCollectionOfSpaceships := OrderedCollection with: spaceshipOne  with: spaceshipTwo .
spaceshipOne move:5.
spaceshipTwo move:5.
aMoonWalkCell moveTheSpaceships:aCollectionOfSpaceships except:spaceshipOne.
self assert:(( (spaceshipOne position at:1)equals: 6 )and:( (spaceshipTwo position at:1)equals:1 )).
]
