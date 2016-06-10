︠acdb583b-642e-45ec-b093-6b1edcaad9a0︠
#Defining preconditions
N = 10^14 + 2367
p =2*N - 1
Fp = GF(p)
Fp2 = GF(p**2,'z')
E = EllipticCurve(Fp,[-35,-98])
︡62f02cd7-bbee-443a-8f99-34c498295f55︡︡{"done":true}
︠33e4cef8-697f-4ba2-a49f-f987715c5b0f︠
#Prints of the preconditions
N
p
Fp
Fp2
E
︡b69850ba-003e-4b37-8b2a-d0bfa011132d︡︡{"stdout":"100000000002367\n","done":false}︡{"stdout":"200000000004733\n","done":false}︡{"stdout":"Finite Field of size 200000000004733\n","done":false}︡{"stdout":"Finite Field in z of size 200000000004733^2\n","done":false}︡{"stdout":"Elliptic Curve defined by y^2 = x^3 + 200000000004698*x + 200000000004635 over Finite Field of size 200000000004733\n","done":false}︡{"done":true}
︠833fb7b4-16bc-47bc-99bd-4a2e0577b30d︠
#We are here checking that N and p indeed are primes and that #E=p+1, thus that E is supersingular
N in Primes()
p in Primes()
E.cardinality()
︡2fcc2024-9817-4abb-913f-ef852fc182d6︡︡{"stdout":"True\n","done":false}︡{"stdout":"True\n","done":false}︡{"stdout":"200000000004734\n","done":false}︡{"done":true}
︠5515287e-1cdf-4375-aca1-3e4ffe16c6eb︠
#We generate random points on E over F_p
P0 = E.change_ring(Fp).random_element()
Q0 = E.change_ring(Fp).random_element()
P0
Q0
︡2e36821d-e751-4559-92a9-bd71065243f6︡︡{"stdout":"(135254491483676 : 175314087997908 : 1)\n","done":false}︡{"stdout":"(49061813781879 : 91211085493117 : 1)\n","done":false}︡{"done":true}
︠f79d6446-0a8e-4f30-9835-785b77bac5a9︠
#We are adding P0 and Q0 to them self to obtain points with order N
P = 2*P0
Q = 2*Q0
P
Q
︡4edc2970-b9b1-408b-8c4d-666e907004f2︡︡{"stdout":"(150990531815392 : 124270024722216 : 1)\n","done":false}︡{"stdout":"(166773418036732 : 98175291440177 : 1)\n","done":false}︡{"done":true}
︠c6952bab-a66c-41fa-aed6-ab9acc4898d4︠
#We generate a random element on E and makes sure that it has order N.
#Then we computes the weil pairings.
T = E.change_ring(Fp2).random_element()
T
S = 2*T
s1 = (S.weil_pairing(P.change_ring(Fp2),N))
s2 = (S.weil_pairing(Q.change_ring(Fp2),N))
S
s1
s2
︡4be2c23c-dc5d-41e6-bb26-907a61163b3a︡︡{"stdout":"(166456005634470*z + 92469128935983 : 27589418115865*z + 164018284033686 : 1)\n","done":false}︡{"stdout":"(125324144572015*z + 48542713015342 : 8140553822855*z + 134195418575580 : 1)\n","done":false}︡{"stdout":"96580176192311*z + 141464011326069\n","done":false}︡{"stdout":"177915989192706*z + 23719869133774\n","done":false}︡{"done":true}
︠05b30397-5c1b-41a6-8322-88f0e087b316︠
#We compute the discrete log over F_p^2
k = s2.log(s1)
k
︡b5a5423b-0dc5-42e9-9851-ea893f122a9e︡︡{"stdout":"94532394513913\n","done":false}︡{"done":true}
︠42ec8cc4-a61b-4da5-b7b0-2118a6444429︠
#We compute kP to obtain Q
k*P
︡1528df25-187c-498f-80da-b9d60a8d63fc︡︡{"stdout":"(166773418036732 : 98175291440177 : 1)\n","done":false}︡{"done":true}
︠16580924-3d0d-485b-b511-ef4f35cd5bce︠









