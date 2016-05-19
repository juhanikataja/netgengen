# netgengen
## Netgen algebraic3d CSG `.geo`-file generator for Julia. 

[![Build Status](https://travis-ci.org/juhanikataja/netgengen.jl.svg?branch=master)](https://travis-ci.org/juhanikataja/netgengen.jl)

*What?* CSG `.geo` file generator for NETGEN (http://www.hpfem.jku.at/netgen/)

*Why?* Because the native `.geo` format is cumbersome when it comes to parametrizing and keeping track that objects are declared.

## Exported types and functions

Documented ones:

* torus
* plane
* brick
* cylinder
* sphere
* csgunion
* not
* intersection
* tlo

Undocumented

* CSGObject, csgstring, declare, curve2d, LineObject, revolution, CurveObject

## Example use

        laatikko = brick("laatikko", [0.0,0.0,0.0],[1.0,1.0,1.0])
        loota = brick("loota", [0.0,0.0,0.0],[1.0,0.5,2.0])

        unioni2 = csgunion("unioni2", [not(brick([0.0,0.0,0.0],[1.0,1.0,1.0])), cylinder([0.0,0.0,0.0],[1.0,1.0,1.0], 1)])

        unioni = csgunion("unioni", [laatikko, loota])
        println("algebraic3d")
        tlo(unioni2, col=[1, 0, 0])
        tlo(unioni, col=[0, 1, 0])
