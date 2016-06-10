︠c8549f9d-a00f-4375-982e-43bae84738afs︠
E = EllipticCurve([0, 1])
︡70491e76-ccec-41c2-9b73-34d694bd217b︡︡{"done":true}
︠49479c1a-11b1-4c75-98bf-6a0bc98eaf7ds︠
E
︡fa12b3df-f9bf-49c0-ac56-72f814d7cf36︡︡{"stdout":"Elliptic Curve defined by y^2 = x^3 + 1 over Rational Field\n","done":false}︡{"done":true}
︠ebad6245-4323-4078-a6f9-ac02f0e8d04es︠
E.plot(xmax=14,ymax=8,xmin=-2,ymin=-8).show(aspect_ratio=1)
︡97daac5c-448e-4330-826e-41cf3fbf4079︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"c35139fd-eff6-4935-ae9c-c128ffeb9ee6","filename":"/projects/9bb55818-b637-45a1-a8b0-9484baaa094f/.sage/temp/compute1-us/7991/tmp_YjiXFe.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠53c7a424-dd4d-4710-a7ae-568f24c9d65fs︠
EllipticCurve([-3,0]).plot(xmax=14,ymax=8,xmin=-2,ymin=-8).show(aspect_ratio=1)
︡dc9a08c3-af48-452e-8ea6-c82ea5cace88︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"14c00712-3811-49f9-be69-2befc5807533","filename":"/projects/9bb55818-b637-45a1-a8b0-9484baaa094f/.sage/temp/compute1-us/7991/tmp_UbSUYy.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠e4f867ac-b3db-48fb-a25d-3a054f354fb6s︠
E1 = E.change_ring(GF(11))
︡3df10928-6ab0-4d54-a347-f083f24c49ce︡︡{"done":true}
︠73e8ab97-4da5-4b05-9e62-9b794f76bcb3s︠
E1.points()
︡a8c4246c-8449-4443-a370-c4f51bc21f14︡︡{"stdout":"[(0 : 1 : 0), (0 : 1 : 1), (0 : 10 : 1), (2 : 3 : 1), (2 : 8 : 1), (5 : 4 : 1), (5 : 7 : 1), (7 : 5 : 1), (7 : 6 : 1), (9 : 2 : 1), (9 : 9 : 1), (10 : 0 : 1)]\n","done":false}︡{"done":true}
︠8528e748-36bf-4605-9b22-5eff443a0fe7s︠
EllipticCurve([0,7]).plot(xmax=14,ymax=8,xmin=-2,ymin=-8).show(aspect_ratio=1)
︡8eb500a8-73ca-4955-aba1-50ee746ecba3︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"a2aac17a-8789-40c1-ab49-7cb41111e59d","filename":"/projects/9bb55818-b637-45a1-a8b0-9484baaa094f/.sage/temp/compute1-us/7991/tmp_7b4sNP.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠9033e4bf-cb70-487b-a9bd-8e2b88541d39s︠
E2 = EllipticCurve(GF(7),[0,-1])
︡6802fad8-2556-43e2-853b-064d74eaff8f︡︡{"done":true}
︠3bf9d044-e8c4-42f1-b6ea-7b9be464e014s︠
E2.points()
︡3c52fc95-ba84-46aa-8503-79ae22fbfaf5︡︡{"stdout":"[(0 : 1 : 0), (1 : 0 : 1), (2 : 0 : 1), (4 : 0 : 1)]\n","done":false}︡{"done":true}
︠4aba1354-1f27-4b0e-be98-2bdc1421bcd0s︠
EllipticCurve(GF(11),[1,1]).points()
︡a1888d06-f73a-48ac-8fdc-93c6718f00ac︡︡{"stdout":"[(0 : 1 : 0), (0 : 1 : 1), (0 : 10 : 1), (1 : 5 : 1), (1 : 6 : 1), (2 : 0 : 1), (3 : 3 : 1), (3 : 8 : 1), (4 : 5 : 1), (4 : 6 : 1), (6 : 5 : 1), (6 : 6 : 1), (8 : 2 : 1), (8 : 9 : 1)]\n","done":false}︡{"done":true}
︠b1ea8ab0-4db1-4dec-9a73-3ce7f6044fdcs︠
E3 = EllipticCurve(GF(101),[-3,0])
︡8133e1d5-d3f6-48f6-afbb-eed24b8fbd84︡︡{"done":true}
︠3212ea64-69d3-4fb4-805f-057f37064af0s︠
E3.points()
︡d6458205-2d5d-4520-b675-c83126d56fec︡︡{"stdout":"[(0 : 0 : 1), (0 : 1 : 0), (4 : 31 : 1), (4 : 70 : 1), (5 : 3 : 1), (5 : 98 : 1), (6 : 20 : 1), (6 : 81 : 1), (7 : 25 : 1), (7 : 76 : 1), (8 : 36 : 1), (8 : 65 : 1), (9 : 46 : 1), (9 : 55 : 1), (12 : 50 : 1), (12 : 51 : 1), (13 : 21 : 1), (13 : 80 : 1), (14 : 50 : 1), (14 : 51 : 1), (17 : 32 : 1), (17 : 69 : 1), (18 : 18 : 1), (18 : 83 : 1), (22 : 49 : 1), (22 : 52 : 1), (23 : 33 : 1), (23 : 68 : 1), (24 : 4 : 1), (24 : 97 : 1), (25 : 20 : 1), (25 : 81 : 1), (26 : 5 : 1), (26 : 96 : 1), (28 : 31 : 1), (28 : 70 : 1), (31 : 2 : 1), (31 : 99 : 1), (32 : 7 : 1), (32 : 94 : 1), (33 : 36 : 1), (33 : 65 : 1), (34 : 32 : 1), (34 : 69 : 1), (35 : 42 : 1), (35 : 59 : 1), (36 : 47 : 1), (36 : 54 : 1), (38 : 4 : 1), (38 : 97 : 1), (39 : 4 : 1), (39 : 97 : 1), (41 : 44 : 1), (41 : 57 : 1), (42 : 38 : 1), (42 : 63 : 1), (46 : 6 : 1), (46 : 95 : 1), (47 : 37 : 1), (47 : 64 : 1), (50 : 32 : 1), (50 : 69 : 1), (51 : 17 : 1), (51 : 84 : 1), (54 : 34 : 1), (54 : 67 : 1), (55 : 41 : 1), (55 : 60 : 1), (59 : 24 : 1), (59 : 77 : 1), (60 : 36 : 1), (60 : 65 : 1), (62 : 40 : 1), (62 : 61 : 1), (63 : 40 : 1), (63 : 61 : 1), (65 : 35 : 1), (65 : 66 : 1), (66 : 16 : 1), (66 : 85 : 1), (67 : 17 : 1), (67 : 84 : 1), (68 : 44 : 1), (68 : 57 : 1), (69 : 31 : 1), (69 : 70 : 1), (70 : 20 : 1), (70 : 81 : 1), (73 : 7 : 1), (73 : 94 : 1), (75 : 50 : 1), (75 : 51 : 1), (76 : 2 : 1), (76 : 99 : 1), (77 : 40 : 1), (77 : 61 : 1), (78 : 27 : 1), (78 : 74 : 1), (79 : 15 : 1), (79 : 86 : 1), (83 : 22 : 1), (83 : 79 : 1), (84 : 17 : 1), (84 : 84 : 1), (87 : 5 : 1), (87 : 96 : 1), (88 : 8 : 1), (88 : 93 : 1), (89 : 5 : 1), (89 : 96 : 1), (92 : 45 : 1), (92 : 56 : 1), (93 : 44 : 1), (93 : 57 : 1), (94 : 48 : 1), (94 : 53 : 1), (95 : 2 : 1), (95 : 99 : 1), (96 : 30 : 1), (96 : 71 : 1), (97 : 7 : 1), (97 : 94 : 1)]","done":false}︡{"stdout":"\n","done":false}︡{"done":true}
︠5ce4c337-c2fb-4adf-baea-8277173af416s︠
s= E3([51,17])+E3([51,17])
︡c40dbd2f-c9e9-4122-af86-6911002b0a05︡︡{"done":true}
︠516a950a-218f-4b58-b9ab-1bdecb784f79s︠
s + E3([51,17])
︡72d8a359-732a-475b-8d1d-b3427eb7969a︡︡{"stdout":"(38 : 97 : 1)\n","done":false}︡{"done":true}
︠33005bf9-2a27-40a1-b2ca-1c593a6f9566s︠
83*E3([51,17])
︡43ad3a57-2743-4fad-921f-e7d907ff1556︡︡{"stdout":"(8 : 65 : 1)\n","done":false}︡{"done":true}
︠c5eec953-ea1a-49c5-9bce-29db5b0368b9s︠
E3
︡579fabce-315d-44ac-8c7a-53d99f6a3700︡︡{"stdout":"Elliptic Curve defined by y^2 = x^3 + 98*x over Finite Field of size 101\n","done":false}︡{"done":true}
︠2da9ea30-6445-47a5-8fa1-92d513aaea52s︠
4*E3([51,17])
64*E3([51,17])
︡86e0b264-4975-4789-9476-9035156d6b2e︡︡{"stdout":"(17 : 69 : 1)\n","done":false}︡{"stdout":"(77 : 40 : 1)\n","done":false}︡{"done":true}
︠4d36cd7b-4353-492a-bdcd-59722652a0efsi︠
8*E3([51,17])
16*E3([51,17])
32*E3([51,17])
︡a2bf577e-bfde-408a-8613-26bee49db5e9︡︡{"stdout":"(22 : 49 : 1)\n","done":false}︡{"stdout":"(36 : 47 : 1)\n","done":false}︡{"stdout":"(4 : 70 : 1)\n","done":false}︡{"done":true}
︠90f5c254-b992-4d04-90aa-aeaa277f441es︠
EllipticCurve(GF(7),[0,3]).plot(xmax=6,ymax=6,xmin=-1,ymin=-1).show(aspect_ratio=1)
︡ab734385-8ac1-46f1-8367-e73efc5548ed︡︡{"once":false,"done":false,"file":{"show":true,"uuid":"9eef5033-d01b-4d77-974c-2c75e2d39096","filename":"/projects/9bb55818-b637-45a1-a8b0-9484baaa094f/.sage/temp/compute1-us/7991/tmp_gyXr0j.svg"}}︡{"html":"<div align='center'></div>","done":false}︡{"done":true}
︠3ce154d5-9f39-4625-85e7-26416343e1e2s︠
︡d49467ee-90df-42cf-b89c-0b5339183aa7︡︡{"done":true}









