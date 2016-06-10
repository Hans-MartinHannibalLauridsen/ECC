︠842abf84-c532-4929-9287-781b9f440844s︠
###################################################################
#                                                                 #
#                        Domain Parameters                        #
#                                                                 #
###################################################################
###################################################################
#         Creating the secp256k1 curve used in bitcoin            #
###################################################################

p = 2^(256) - 2^(32) - 2^(9) - 2^(8) - 2^(7) - 2^6 - 2^4 - 1
Fp = GF(p)
secp256k1 = EllipticCurve(Fp,[0,7])
secp256k1

︡fa8a6fb1-41bc-42c2-bb69-85a16ba72e19︡{"stdout":"Elliptic Curve defined by y^2 = x^3 + 7 over Finite Field of size 115792089237316195423570985008687907853269984665640564039457584007908834671663\n"}︡{"done":true}︡
︠203154a7-6140-45cf-bd80-279e306c657bs︠
###################################################################
#                                                                 #
#                         Pre-configuration                       #
#                                                                 #
###################################################################
###################################################################
#(1)                     Defining function f.                     #
###################################################################

def f( POINT ):
   return Integer(POINT[0])  #This function simply returns the x-coordinate

︡04457f30-44ca-4eea-ae67-dc923ea23abe︡{"done":true}︡
︠65a955e8-977e-4b47-add0-f9b44c5e9c7es︠
###################################################################
#(2)          Creating the base point G used in bitcoin           #
###################################################################

Px = int('79BE667EF9DCBBAC55A06295CE870B07029BFCDB2DCE28D959F2815B16F81798', 16)
Py = int('483ADA7726A3C4655DA4FBFC0E1108A8FD17B448A68554199C47D08FFB10D4B8', 16)
P = secp256k1([Px,Py])
print 'Base Point: ', P
n = P.order()
n in Primes()  #Checking that Satoshi Nakamoto did there job.

︡775030b9-ca3a-40a5-a8b5-b22e3f71c6b4︡{"stdout":"Base Point:  (55066263022277343669578718895168534326250603453777594175500187360389116729240 : 32670510020758816978083085130507043184471273380659243275938904335757337482424 : 1)\n"}︡{"stdout":"True\n"}︡{"done":true}︡
︠d3303e89-c8a7-49f2-9e38-0dfc41977f90︠
###################################################################
#(3)               Creating public + private key                  #
###################################################################
import random

d = random.randint(1, n - 1) #Creating private key. Unfortunately d is only pseudo random.
print 'Private key: ', d
Q = d*P                      #Creating public key
print 'Public key: ', Q

︡109adb3a-f8df-4d1e-b9a0-a186abcc38c3︡{"stdout":"Private key:  108187960286786181083162283957698728411142631121640342488295147892755647172188\n"}︡{"stdout":"Public key:  (75111893407980457823548144657197530767116285906787421148286255754509901173621 : 45358731886908743436032479674480513495477581644727803805257087886002720384188 : 1)\n"}︡{"done":true}︡
︠9074a522-4176-4f26-8797-19ae3933639bs︠
###################################################################
#                        Defining hashmap                         #
###################################################################
import hashlib

def HASH( M ):
    hash = hashlib.sha256()
    hash.update( M )
    OUT = hash.hexdigest()
    return int(OUT, 16)

︡db05a2db-9cf2-40c7-9ece-29e85401344c︡{"done":true}︡
︠a965e7b8-0a72-4474-8627-22ca0248bbae︠
###################################################################
#                        Creating signature                       #
###################################################################

def generateSignature( M ):
    s = 0
    while s == 0:
        r = 0
        while r == 0:
            k = random.randint(1, n - 1) #Unfortunately only pseudo random.
            R = k*P
            r = f(R).mod(n)
            m = HASH(M)
        inverse_k = inverse_mod(k, n) #findes k^-1, that is the multiplicative inverse.
        s = (inverse_k*(m+d*r)).mod(n)
    return [r, s]
︡3bad036f-6921-4d0a-92e8-4ca4c3fbd907︡{"done":true}︡
︠c48b17cd-7e84-42b2-88f9-6c700ed06394s︠
###################################################################
#                       Validating signature                      #
###################################################################
def validateSignature (M, r, s):
    if (1 <= r <= n-1) and (1 <= s <= n-1):
        m = HASH(M)
        inverse_s = inverse_mod(s, n) #findes k^-1, that is the multiplicative inverse.
        w = inverse_s.mod(n)
        u1 = (m*w).mod(n)
        u2 = (r*w).mod(n)
        V = u1*P + u2*Q
        if Integer(V[2]) == 0:
            return False
        v = f(V).mod(n)
        if v == r:
            return True
        else:
            return False
    else:
        return False

︡0ce4a59f-4a6e-4c2e-b3c6-77db26627272︡{"done":true}︡
︠7d8c8941-a8a0-46bc-9266-224def8a0518s︠
###################################################################
#                                                                 #
#                              EXAMPLE                            #
#                                                                 #
###################################################################
###################################################################
#                      DOCUMENT TO BE SIGNED                      #
###################################################################

M = 'Elliptic curves are awesome!'
print 'The message M to be signed: ', M
print ''
###################################################################
#                        Creating signature                       #
###################################################################

signature = generateSignature( M )
print 'The signature, for the message M: ', signature
print ''
###################################################################
#                      Sending data to Bob...                     #
###################################################################
print 'The following data is send to Bob: '
print 'Message: ', M
print 'Signature: ', signature
print ''
###################################################################
#                       Validating signature                      #
###################################################################
#    We assume that the domain parameteres are shared, as it      #
#    is in this SAGE worksheet.                                   #
###################################################################

if validateSignature( M , Integer(signature[0]) ,Integer(signature[1])):
    print 'Bob accepts the signature.'
else:
    print 'Bob rejects the signature.'

︡30d33665-1e55-4b10-b6a1-a2114b2c3603︡{"stdout":"The message M to be signed:  Elliptic curves are awesome!\n"}︡{"stdout":"\n"}︡{"stdout":"The signature, for the message M:  [33277198040271906705721464218550787020346967959027834415927833575186454038209, 39102306408750912537682296351502564307037127361234078247451978346209745067138]\n"}︡{"stdout":"\n"}︡{"stdout":"The following data is send to Bob: \n"}︡{"stdout":"Message:  Elliptic curves are awesome!\n"}︡{"stdout":"Signature:  [33277198040271906705721464218550787020346967959027834415927833575186454038209, 39102306408750912537682296351502564307037127361234078247451978346209745067138]\n"}︡{"stdout":"\n"}︡{"stdout":"Bob accepts the signature.\n"}︡{"done":true}︡
︠9d3e4aac-a3ce-461c-8895-3a6e0faa7140︠
###################################################################
#                        Tampering signature                      #
###################################################################
#    It is easy enough to say that Bob accepts, thus assume       #
#    that Eve had snatched up the signature and tampert with      #
#    the message M. Such a scenario, could look like this:        #
###################################################################

print 'Eve snatch up the signature: ', signature
M = 'Elliptic curves are dull...'
print 'Eve alters the message M to: ', M
print ''
###################################################################
#                      Sending data to Bob...                     #
###################################################################
print 'The following data is send to Bob: '
print 'Message: ', M
print 'Signature: ', signature
print ''
###################################################################
#                       Validating signature                      #
###################################################################
#    We assume that the domain parameteres are shared, as it      #
#    is in this SAGE worksheet.                                   #
###################################################################

if validateSignature( M , Integer(signature[0]) ,Integer(signature[1])):
    print 'Bob accepts the signature.'
else:
    print 'Bob rejects the signature.'
︡01bcb3c2-1eca-48f8-818a-c58fb9187a62︡{"stdout":"Eve snatch up the signature:  [33277198040271906705721464218550787020346967959027834415927833575186454038209, 39102306408750912537682296351502564307037127361234078247451978346209745067138]\n"}︡{"stdout":"Eve alters the message M to:  Elliptic curves are dull...\n"}︡{"stdout":"\n"}︡{"stdout":"The following data is send to Bob: \n"}︡{"stdout":"Message:  Elliptic curves are dull...\n"}︡{"stdout":"Signature:  [33277198040271906705721464218550787020346967959027834415927833575186454038209, 39102306408750912537682296351502564307037127361234078247451978346209745067138]\n"}︡{"stdout":"\n"}︡{"stdout":"Bob rejects the signature.\n"}︡{"done":true}︡









