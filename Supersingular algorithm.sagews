︠b661b4b1-6f88-460c-a55d-8501128581f3︠
#Defining primes
N = 10^14 + 2367
p = 2*N - 1
#Creating fields
n = 2
q=p**n
Fq = GF(q,'z')
#Representing the field in a normal basis
zeta = Fq.primitive_element(); zeta
f = zeta.minimal_polynomial('z'); f
Fqq = GF(q, 'a', modulus=f(zeta))
#Defining curves
E = EllipticCurve(Fq,[-35,-98])
#Note that these preconfigurations are for the sake of example.
︡0a18d7d9-31ef-48f5-b789-c9ab9c073c7b︡︡{"stdout":"z + 3\n"}︡{"stdout":"z^2 + 200000000004728*z + 5\n"}︡{"stderr":"Error in lines 11-12\nTraceback (most recent call last):\n  File \"/projects/sage/sage-6.10/local/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 904, in execute\n    exec compile(block+'\\n', '', 'single') in namespace, locals\n  File \"\", line 1, in <module>\n  File \"sage/structure/factory.pyx\", line 364, in sage.structure.factory.UniqueFactory.__call__ (/projects/sage/sage-6.10/src/build/cythonized/sage/structure/factory.c:1245)\n    key, kwds = self.create_key_and_extra_args(*args, **kwds)\n  File \"/projects/sage/sage-6.10/local/lib/python2.7/site-packages/sage/rings/finite_rings/constructor.py\", line 479, in create_key_and_extra_args\n    raise ValueError(\"parameter 'conway' is required if no name given\")\nValueError: parameter 'conway' is required if no name given\n"}︡{"done":true}
︠615a6517-26cf-4cb9-bd26-ad1779ed1f9f︠
#Generating random element P and defining k
P = E.change_ring(Fq).random_element()
k = 10^100000 + 10^1000 + 5*10^100 + 7
P
#Note that this code are for the sake of example.
︡46ef3dcf-5ed3-403e-b784-c86c25e60409︡︡{"stdout":"(150786625460117*z + 74961131101257 : 29562967055119*z + 81097213484581 : 1)\n"}︡{"stdout":"z + 3\n"}︡{"done":true}
︠0f1e85c2-235b-4367-bc19-29333034bf14︠
######################################################
######### Fast supersingular algorithm ###############
######################################################
%time
#Representing k in base q
base = k.digits(base=q, digits=None, padto=0)
#Setting up variable i and result varaible
i = 0
Result = E(0 , 1 , 0)
#Creating a for loop for each factor base
for number in base:
    M = number * P
    if M[2] == 1:
        x = M[0]
        y = ((-1)^i)*M[1]
        z = M[2]
        Q = E(x , y , z)
        Result = Result + Q
        i = i + 1
Result
︡b21a5843-4bb2-4479-80fe-e449d86ca7a0︡︡{"stdout":"(7862891504619*z + 4413766124723 : 123939946824456*z + 134071775348335 : 1)\n"}︡{"stdout":"CPU time: 23.76 s, Wall time: 24.27 s\n"}︡{"done":true}
︠fdb4acdd-7d5b-4d42-8efa-2c84d0689220︠
###############################################
######## Suseccive Doubling algorithm #########
###############################################
%time
#Setting up variables
Result = E(0,1,0)
list = []
#Append P to the list, this make the code more simple. We define Q to be equal P such that we dont alter P
list.append(P)
Q = P
i = 2
#Computes integer times point by sussecive doubling 1,2,4, ... ,64, ...
while i < k:
    Q = Q+Q
    list.append(Q)
    i = i*2
#Represent k binary
base1 = k.digits(base=2, digits=None, padto=0)
d = 0
#Running trough the binary representation of k. If its a 1 add the appropiate point to the result variable if its a 0 then don't.
for number1 in base1:
    if number1 != 0:
        Result = Result + list[d]
    d = d + 1
Result

︡6067643d-dfc9-47bb-8ea7-8a4908c55f70︡︡{"stdout":"(116775979618176*z + 145699446706678 : 144089391243946*z + 46383884872101 : 1)\n"}︡{"stdout":"CPU time: 35.08 s, Wall time: 35.69 s\n"}︡{"done":true}
︠41ac6af1-95cb-41e5-90d3-b0251a44a5b2︠
####################################
####### SagmMath default ###########
####################################
%time
Result = k*P
Result
︡671452c1-a142-4e19-83bc-b9859e38d17e︡︡{"stdout":"(116775979618176*z + 145699446706678 : 144089391243946*z + 46383884872101 : 1)\n"}︡{"stdout":"CPU time: 23.92 s, Wall time: 24.28 s\n"}︡{"done":true}
︠03a69667-e8d4-43f6-b9fd-d1649301788bs︠
####################################
######### Naive method #############
####################################
%time
Result = E(0,1,0)
i = 0
while i < k:
    Result = Result + P
    i = i + 1
Result
####################################
# After running for several hours  #
# I decided to terminate this,     #
# since it became obvious that it  #
# would not finish anytime soon... #
####################################
︡bf7a3174-a7e0-4cf2-91bb-e3d3b44beab2︡︡{"done":true,"error":"killed"}
︠f671c0cb-3fca-4d4e-ae8d-9ff280574ecc︠

︡6a8b22c8-9556-4396-aa50-33b513eea53b︡









