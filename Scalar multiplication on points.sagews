︠b661b4b1-6f88-460c-a55d-8501128581f3s︠
#Defining primes
N = 10^14 + 2367
p = 2*N - 1
#Creating fields
q=p
Fq = GF(q,'z')
#Defining curves
E = EllipticCurve(Fq,[-35,-98])
#Note that these preconfigurations are for the sake of example.
︡b9c2d7df-6d68-4898-893d-3902f38c14d2︡{"done":true}︡
︠615a6517-26cf-4cb9-bd26-ad1779ed1f9fs︠
#Generating random element P and defining k
P = E.change_ring(Fq).random_element()
k = 10^100000 + 10^1000 + 5*10^100 + 7
P
#Note that this code are for the sake of example.
︡2deee3be-90d6-44ae-bc7e-fd590658903b︡{"stdout":"(78979082091325 : 85452276342521 : 1)\n"}︡{"done":true}︡
︠0f1e85c2-235b-4367-bc19-29333034bf14s︠
###################################################################
#                   Fast supersingular algorithm                  #
###################################################################
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
︡2b0001b4-f4c9-4a0b-9183-be4a8f85ea9c︡{"stdout":"(55914705410516 : 157647831303087 : 1)\n"}︡{"stdout":"CPU time: 12.97 s, Wall time: 13.05 s\n"}︡{"done":true}︡
︠fdb4acdd-7d5b-4d42-8efa-2c84d0689220s︠
###################################################################
#                  Suseccive Doubling algorithm                   #
###################################################################
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

︡3c435f48-2f86-4603-9596-74c5fc17450e︡{"stdout":"(55914705410516 : 157647831303087 : 1)\n"}︡{"stdout":"CPU time: 21.56 s, Wall time: 21.94 s\n"}︡{"done":true}︡
︠41ac6af1-95cb-41e5-90d3-b0251a44a5b2s︠
###################################################################
#                         Sagemath default                        #
###################################################################
%time
Result = k*P
Result
︡224c5357-c3d5-4d29-9e8f-dc0937a5962c︡{"stdout":"(55914705410516 : 157647831303087 : 1)\n"}︡{"stdout":"CPU time: 18.14 s, Wall time: 18.46 s\n"}︡{"done":true}︡
︠03a69667-e8d4-43f6-b9fd-d1649301788b︠


###################################################################
#                             Naive method                        #
###################################################################
%time
Result = E(0,1,0)
i = 0
while i < k:
    Result = Result + P
    i = i + 1
Result
###################################################################
# After running for several hours I decided to terminate this,    #
# since it became obvious that it would not finish anytime soon.. #
###################################################################









