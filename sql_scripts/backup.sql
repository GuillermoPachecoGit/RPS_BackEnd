--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-08-26 02:24:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2164 (class 0 OID 148439)
-- Dependencies: 187
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO app_user (user_id, password, area, first_name, email_address, institution, country_id, last_name, nick) VALUES (2, '1234', 'Sistemas', 'Guillermo', 'guillermopacheco.exa@gmail.com', 'Institution', 9, 'Pacheco', 'Guillermitus');


--
-- TOC entry 2189 (class 0 OID 0)
-- Dependencies: 186
-- Name: app_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('app_user_user_id_seq', 2, true);


--
-- TOC entry 2162 (class 0 OID 49757)
-- Dependencies: 185
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO country (country_id, country_name) VALUES (1, 'Afganistan');
INSERT INTO country (country_id, country_name) VALUES (2, 'Albania');
INSERT INTO country (country_id, country_name) VALUES (3, 'Algeria');
INSERT INTO country (country_id, country_name) VALUES (4, 'American Samoa');
INSERT INTO country (country_id, country_name) VALUES (5, 'Andorra');
INSERT INTO country (country_id, country_name) VALUES (6, 'Angola');
INSERT INTO country (country_id, country_name) VALUES (7, 'Anguilla');
INSERT INTO country (country_id, country_name) VALUES (8, 'Antigua &amp; Barbuda');
INSERT INTO country (country_id, country_name) VALUES (9, 'Argentina');
INSERT INTO country (country_id, country_name) VALUES (10, 'Armenia');
INSERT INTO country (country_id, country_name) VALUES (11, 'Aruba');
INSERT INTO country (country_id, country_name) VALUES (12, 'Australia');
INSERT INTO country (country_id, country_name) VALUES (13, 'Austria');
INSERT INTO country (country_id, country_name) VALUES (14, 'Azerbaijan');
INSERT INTO country (country_id, country_name) VALUES (15, 'Bahamas');
INSERT INTO country (country_id, country_name) VALUES (16, 'Bahrain');
INSERT INTO country (country_id, country_name) VALUES (17, 'Bangladesh');
INSERT INTO country (country_id, country_name) VALUES (18, 'Barbados');
INSERT INTO country (country_id, country_name) VALUES (19, 'Belarus');
INSERT INTO country (country_id, country_name) VALUES (20, 'Belgium');
INSERT INTO country (country_id, country_name) VALUES (21, 'Belize');
INSERT INTO country (country_id, country_name) VALUES (22, 'Benin');
INSERT INTO country (country_id, country_name) VALUES (23, 'Bermuda');
INSERT INTO country (country_id, country_name) VALUES (24, 'Bhutan');
INSERT INTO country (country_id, country_name) VALUES (25, 'Bolivia');
INSERT INTO country (country_id, country_name) VALUES (26, 'Bonaire');
INSERT INTO country (country_id, country_name) VALUES (27, 'Bosnia &amp; Herzegovina');
INSERT INTO country (country_id, country_name) VALUES (28, 'Botswana');
INSERT INTO country (country_id, country_name) VALUES (29, 'Brazil');
INSERT INTO country (country_id, country_name) VALUES (30, 'British Indian Ocean Ter');
INSERT INTO country (country_id, country_name) VALUES (31, 'Brunei');
INSERT INTO country (country_id, country_name) VALUES (32, 'Bulgaria');
INSERT INTO country (country_id, country_name) VALUES (33, 'Burkina Faso');
INSERT INTO country (country_id, country_name) VALUES (34, 'Burundi');
INSERT INTO country (country_id, country_name) VALUES (35, 'Cambodia');
INSERT INTO country (country_id, country_name) VALUES (36, 'Cameroon');
INSERT INTO country (country_id, country_name) VALUES (37, 'Canada');
INSERT INTO country (country_id, country_name) VALUES (38, 'Canary Islands');
INSERT INTO country (country_id, country_name) VALUES (39, 'Cape Verde');
INSERT INTO country (country_id, country_name) VALUES (40, 'Cayman Islands');
INSERT INTO country (country_id, country_name) VALUES (41, 'Central African Republic');
INSERT INTO country (country_id, country_name) VALUES (42, 'Chad');
INSERT INTO country (country_id, country_name) VALUES (43, 'Channel Islands');
INSERT INTO country (country_id, country_name) VALUES (44, 'Chile');
INSERT INTO country (country_id, country_name) VALUES (45, 'China');
INSERT INTO country (country_id, country_name) VALUES (46, 'Christmas Island');
INSERT INTO country (country_id, country_name) VALUES (47, 'Cocos Island');
INSERT INTO country (country_id, country_name) VALUES (48, 'Colombia');
INSERT INTO country (country_id, country_name) VALUES (49, 'Comoros');
INSERT INTO country (country_id, country_name) VALUES (50, 'Congo');
INSERT INTO country (country_id, country_name) VALUES (51, 'Cook Islands');
INSERT INTO country (country_id, country_name) VALUES (52, 'Costa Rica');
INSERT INTO country (country_id, country_name) VALUES (53, 'Cote DIvoire');
INSERT INTO country (country_id, country_name) VALUES (54, 'Croatia');
INSERT INTO country (country_id, country_name) VALUES (55, 'Cuba');
INSERT INTO country (country_id, country_name) VALUES (56, 'Curaco');
INSERT INTO country (country_id, country_name) VALUES (57, 'Cyprus');
INSERT INTO country (country_id, country_name) VALUES (58, 'Czech Republic');
INSERT INTO country (country_id, country_name) VALUES (59, 'Denmark');
INSERT INTO country (country_id, country_name) VALUES (60, 'Djibouti');
INSERT INTO country (country_id, country_name) VALUES (61, 'Dominica');
INSERT INTO country (country_id, country_name) VALUES (62, 'Dominican Republic');
INSERT INTO country (country_id, country_name) VALUES (63, 'East Timor');
INSERT INTO country (country_id, country_name) VALUES (64, 'Ecuador');
INSERT INTO country (country_id, country_name) VALUES (65, 'Egypt');
INSERT INTO country (country_id, country_name) VALUES (66, 'El Salvador');
INSERT INTO country (country_id, country_name) VALUES (67, 'Equatorial Guinea');
INSERT INTO country (country_id, country_name) VALUES (68, 'Eritrea');
INSERT INTO country (country_id, country_name) VALUES (69, 'Estonia');
INSERT INTO country (country_id, country_name) VALUES (70, 'Ethiopia');
INSERT INTO country (country_id, country_name) VALUES (71, 'Falkland Islands');
INSERT INTO country (country_id, country_name) VALUES (72, 'Faroe Islands');
INSERT INTO country (country_id, country_name) VALUES (73, 'Fiji');
INSERT INTO country (country_id, country_name) VALUES (74, 'Finland');
INSERT INTO country (country_id, country_name) VALUES (75, 'France');
INSERT INTO country (country_id, country_name) VALUES (76, 'French Guiana');
INSERT INTO country (country_id, country_name) VALUES (77, 'French Polynesia');
INSERT INTO country (country_id, country_name) VALUES (78, 'French Southern Ter');
INSERT INTO country (country_id, country_name) VALUES (79, 'Gabon');
INSERT INTO country (country_id, country_name) VALUES (80, 'Gambia');
INSERT INTO country (country_id, country_name) VALUES (81, 'Georgia');
INSERT INTO country (country_id, country_name) VALUES (82, 'Germany');
INSERT INTO country (country_id, country_name) VALUES (83, 'Ghana');
INSERT INTO country (country_id, country_name) VALUES (84, 'Gibraltar');
INSERT INTO country (country_id, country_name) VALUES (85, 'Great Britain');
INSERT INTO country (country_id, country_name) VALUES (86, 'Greece');
INSERT INTO country (country_id, country_name) VALUES (87, 'Greenland');
INSERT INTO country (country_id, country_name) VALUES (88, 'Grenada');
INSERT INTO country (country_id, country_name) VALUES (89, 'Guadeloupe');
INSERT INTO country (country_id, country_name) VALUES (90, 'Guam');
INSERT INTO country (country_id, country_name) VALUES (91, 'Guatemala');
INSERT INTO country (country_id, country_name) VALUES (92, 'Guinea');
INSERT INTO country (country_id, country_name) VALUES (93, 'Guyana');
INSERT INTO country (country_id, country_name) VALUES (94, 'Haiti');
INSERT INTO country (country_id, country_name) VALUES (95, 'Hawaii');
INSERT INTO country (country_id, country_name) VALUES (96, 'Honduras');
INSERT INTO country (country_id, country_name) VALUES (97, 'Hong Kong');
INSERT INTO country (country_id, country_name) VALUES (98, 'Hungary');
INSERT INTO country (country_id, country_name) VALUES (99, 'Iceland');
INSERT INTO country (country_id, country_name) VALUES (100, 'India');
INSERT INTO country (country_id, country_name) VALUES (101, 'Indonesia');
INSERT INTO country (country_id, country_name) VALUES (102, 'Iran');
INSERT INTO country (country_id, country_name) VALUES (103, 'Iraq');
INSERT INTO country (country_id, country_name) VALUES (104, 'Ireland');
INSERT INTO country (country_id, country_name) VALUES (105, 'Isle of Man');
INSERT INTO country (country_id, country_name) VALUES (106, 'Israel');
INSERT INTO country (country_id, country_name) VALUES (107, 'Italy');
INSERT INTO country (country_id, country_name) VALUES (108, 'Jamaica');
INSERT INTO country (country_id, country_name) VALUES (109, 'Japan');
INSERT INTO country (country_id, country_name) VALUES (110, 'Jordan');
INSERT INTO country (country_id, country_name) VALUES (111, 'Kazakhstan');
INSERT INTO country (country_id, country_name) VALUES (112, 'Kenya');
INSERT INTO country (country_id, country_name) VALUES (113, 'Kiribati');
INSERT INTO country (country_id, country_name) VALUES (114, 'Korea North');
INSERT INTO country (country_id, country_name) VALUES (115, 'Korea Sout');
INSERT INTO country (country_id, country_name) VALUES (116, 'Kuwait');
INSERT INTO country (country_id, country_name) VALUES (117, 'Kyrgyzstan');
INSERT INTO country (country_id, country_name) VALUES (118, 'Laos');
INSERT INTO country (country_id, country_name) VALUES (119, 'Latvia');
INSERT INTO country (country_id, country_name) VALUES (120, 'Lebanon');
INSERT INTO country (country_id, country_name) VALUES (121, 'Lesotho');
INSERT INTO country (country_id, country_name) VALUES (122, 'Liberia');
INSERT INTO country (country_id, country_name) VALUES (123, 'Libya');
INSERT INTO country (country_id, country_name) VALUES (124, 'Liechtenstein');
INSERT INTO country (country_id, country_name) VALUES (125, 'Lithuania');
INSERT INTO country (country_id, country_name) VALUES (126, 'Luxembourg');
INSERT INTO country (country_id, country_name) VALUES (127, 'Macau');
INSERT INTO country (country_id, country_name) VALUES (128, 'Macedonia');
INSERT INTO country (country_id, country_name) VALUES (129, 'Madagascar');
INSERT INTO country (country_id, country_name) VALUES (130, 'Malaysia');
INSERT INTO country (country_id, country_name) VALUES (131, 'Malawi');
INSERT INTO country (country_id, country_name) VALUES (132, 'Maldives');
INSERT INTO country (country_id, country_name) VALUES (133, 'Mali');
INSERT INTO country (country_id, country_name) VALUES (134, 'Malta');
INSERT INTO country (country_id, country_name) VALUES (135, 'Marshall Islands');
INSERT INTO country (country_id, country_name) VALUES (136, 'Martinique');
INSERT INTO country (country_id, country_name) VALUES (137, 'Mauritania');
INSERT INTO country (country_id, country_name) VALUES (138, 'Mauritius');
INSERT INTO country (country_id, country_name) VALUES (139, 'Mayotte');
INSERT INTO country (country_id, country_name) VALUES (140, 'Mexico');
INSERT INTO country (country_id, country_name) VALUES (141, 'Midway Islands');
INSERT INTO country (country_id, country_name) VALUES (142, 'Moldova');
INSERT INTO country (country_id, country_name) VALUES (143, 'Monaco');
INSERT INTO country (country_id, country_name) VALUES (144, 'Mongolia');
INSERT INTO country (country_id, country_name) VALUES (145, 'Montserrat');
INSERT INTO country (country_id, country_name) VALUES (146, 'Morocco');
INSERT INTO country (country_id, country_name) VALUES (147, 'Mozambique');
INSERT INTO country (country_id, country_name) VALUES (148, 'Myanmar');
INSERT INTO country (country_id, country_name) VALUES (149, 'Nambia');
INSERT INTO country (country_id, country_name) VALUES (150, 'Nauru');
INSERT INTO country (country_id, country_name) VALUES (151, 'Nepal');
INSERT INTO country (country_id, country_name) VALUES (152, 'Netherland Antilles');
INSERT INTO country (country_id, country_name) VALUES (153, 'Netherlands');
INSERT INTO country (country_id, country_name) VALUES (154, 'Nevis');
INSERT INTO country (country_id, country_name) VALUES (155, 'New Caledonia');
INSERT INTO country (country_id, country_name) VALUES (156, 'New Zealand');
INSERT INTO country (country_id, country_name) VALUES (157, 'Nicaragua');
INSERT INTO country (country_id, country_name) VALUES (158, 'Niger');
INSERT INTO country (country_id, country_name) VALUES (159, 'Nigeria');
INSERT INTO country (country_id, country_name) VALUES (160, 'Niue');
INSERT INTO country (country_id, country_name) VALUES (161, 'Norfolk Island');
INSERT INTO country (country_id, country_name) VALUES (162, 'Norway');
INSERT INTO country (country_id, country_name) VALUES (163, 'Oman');
INSERT INTO country (country_id, country_name) VALUES (164, 'Pakistan');
INSERT INTO country (country_id, country_name) VALUES (165, 'Palau Island');
INSERT INTO country (country_id, country_name) VALUES (166, 'Palestine');
INSERT INTO country (country_id, country_name) VALUES (167, 'Panama');
INSERT INTO country (country_id, country_name) VALUES (168, 'Papua New Guinea');
INSERT INTO country (country_id, country_name) VALUES (169, 'Paraguay');
INSERT INTO country (country_id, country_name) VALUES (170, 'Peru');
INSERT INTO country (country_id, country_name) VALUES (171, 'Phillipines');
INSERT INTO country (country_id, country_name) VALUES (172, 'Pitcairn Island');
INSERT INTO country (country_id, country_name) VALUES (173, 'Poland');
INSERT INTO country (country_id, country_name) VALUES (174, 'Portugal');
INSERT INTO country (country_id, country_name) VALUES (175, 'Puerto Rico');
INSERT INTO country (country_id, country_name) VALUES (176, 'Qatar');
INSERT INTO country (country_id, country_name) VALUES (177, 'Republic of Montenegro');
INSERT INTO country (country_id, country_name) VALUES (178, 'Republic of Serbia');
INSERT INTO country (country_id, country_name) VALUES (179, 'Reunion');
INSERT INTO country (country_id, country_name) VALUES (180, 'Romania');
INSERT INTO country (country_id, country_name) VALUES (181, 'Russia');
INSERT INTO country (country_id, country_name) VALUES (182, 'Rwanda');
INSERT INTO country (country_id, country_name) VALUES (183, 'St Barthelemy');
INSERT INTO country (country_id, country_name) VALUES (184, 'St Eustatius');
INSERT INTO country (country_id, country_name) VALUES (185, 'St Helena');
INSERT INTO country (country_id, country_name) VALUES (186, 'St Kitts-Nevis');
INSERT INTO country (country_id, country_name) VALUES (187, 'St Lucia');
INSERT INTO country (country_id, country_name) VALUES (188, 'St Maarten');
INSERT INTO country (country_id, country_name) VALUES (189, 'St Pierre &amp; Miquelon');
INSERT INTO country (country_id, country_name) VALUES (190, 'St Vincent &amp; Grenadines');
INSERT INTO country (country_id, country_name) VALUES (191, 'Saipan');
INSERT INTO country (country_id, country_name) VALUES (192, 'Samoa');
INSERT INTO country (country_id, country_name) VALUES (193, 'Samoa American');
INSERT INTO country (country_id, country_name) VALUES (194, 'San Marino');
INSERT INTO country (country_id, country_name) VALUES (195, 'Sao Tome &amp; Principe');
INSERT INTO country (country_id, country_name) VALUES (196, 'Saudi Arabia');
INSERT INTO country (country_id, country_name) VALUES (197, 'Senegal');
INSERT INTO country (country_id, country_name) VALUES (198, 'Serbia');
INSERT INTO country (country_id, country_name) VALUES (199, 'Seychelles');
INSERT INTO country (country_id, country_name) VALUES (200, 'Sierra Leone');
INSERT INTO country (country_id, country_name) VALUES (201, 'Singapore');
INSERT INTO country (country_id, country_name) VALUES (202, 'Slovakia');
INSERT INTO country (country_id, country_name) VALUES (203, 'Slovenia');
INSERT INTO country (country_id, country_name) VALUES (204, 'Solomon Islands');
INSERT INTO country (country_id, country_name) VALUES (205, 'Somalia');
INSERT INTO country (country_id, country_name) VALUES (206, 'South Africa');
INSERT INTO country (country_id, country_name) VALUES (207, 'Spain');
INSERT INTO country (country_id, country_name) VALUES (208, 'Sri Lanka');
INSERT INTO country (country_id, country_name) VALUES (209, 'Sudan');
INSERT INTO country (country_id, country_name) VALUES (210, 'Suriname');
INSERT INTO country (country_id, country_name) VALUES (211, 'Swaziland');
INSERT INTO country (country_id, country_name) VALUES (212, 'Sweden');
INSERT INTO country (country_id, country_name) VALUES (213, 'Switzerland');
INSERT INTO country (country_id, country_name) VALUES (214, 'Syria');
INSERT INTO country (country_id, country_name) VALUES (215, 'Tahiti');
INSERT INTO country (country_id, country_name) VALUES (216, 'Taiwan');
INSERT INTO country (country_id, country_name) VALUES (217, 'Tajikistan');
INSERT INTO country (country_id, country_name) VALUES (218, 'Tanzania');
INSERT INTO country (country_id, country_name) VALUES (219, 'Thailand');
INSERT INTO country (country_id, country_name) VALUES (220, 'Togo');
INSERT INTO country (country_id, country_name) VALUES (221, 'Tokelau');
INSERT INTO country (country_id, country_name) VALUES (222, 'Tonga');
INSERT INTO country (country_id, country_name) VALUES (223, 'Trinidad &amp; Tobago');
INSERT INTO country (country_id, country_name) VALUES (224, 'Tunisia');
INSERT INTO country (country_id, country_name) VALUES (225, 'Turkey');
INSERT INTO country (country_id, country_name) VALUES (226, 'Turkmenistan');
INSERT INTO country (country_id, country_name) VALUES (227, 'Turks &amp; Caicos Is');
INSERT INTO country (country_id, country_name) VALUES (228, 'Tuvalu');
INSERT INTO country (country_id, country_name) VALUES (229, 'Uganda');
INSERT INTO country (country_id, country_name) VALUES (230, 'Ukraine');
INSERT INTO country (country_id, country_name) VALUES (231, 'United Arab Erimates');
INSERT INTO country (country_id, country_name) VALUES (232, 'United Kingdom');
INSERT INTO country (country_id, country_name) VALUES (233, 'United States of America');
INSERT INTO country (country_id, country_name) VALUES (234, 'Uraguay');
INSERT INTO country (country_id, country_name) VALUES (235, 'Uzbekistan');
INSERT INTO country (country_id, country_name) VALUES (236, 'Vanuatu');
INSERT INTO country (country_id, country_name) VALUES (237, 'Vatican City State');
INSERT INTO country (country_id, country_name) VALUES (238, 'Venezuela');
INSERT INTO country (country_id, country_name) VALUES (239, 'Vietnam');
INSERT INTO country (country_id, country_name) VALUES (240, 'Virgin Islands (Brit)');
INSERT INTO country (country_id, country_name) VALUES (241, 'Virgin Islands (USA)');
INSERT INTO country (country_id, country_name) VALUES (242, 'Wake Island');
INSERT INTO country (country_id, country_name) VALUES (243, 'Wallis &amp; Futana Is');
INSERT INTO country (country_id, country_name) VALUES (244, 'Yemen');
INSERT INTO country (country_id, country_name) VALUES (245, 'Zaire');
INSERT INTO country (country_id, country_name) VALUES (246, 'Zambia');
INSERT INTO country (country_id, country_name) VALUES (247, 'Zimbabwe');


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 184
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('country_country_id_seq', 247, true);


--
-- TOC entry 2168 (class 0 OID 148473)
-- Dependencies: 191
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dataset (dataset_id, project_id_ref, dataset_name, file_name, number_of_objects, number_of_landmarks, dimention, data, colors, objects_name, dataset_id_ref, show_consensus, send, pdf) VALUES (26, 2, 'GrP_Craneos2D_26', 'GrP_craneos2D.tps', 2, 65, 2, '{"data":[{"specimen0":[[-0.0893,0.7944],[-0.0155,0.7896],[0.0246,0.7816],[0.084,0.7704],[0.1369,0.7816],[0.2155,0.772],[0.2653,0.7752],[0.3327,0.7463],[0.3968,0.7222],[0.4594,0.711],[0.5284,0.6613],[0.5861,0.6452],[0.6583,0.5811],[0.7225,0.5329],[0.7642,0.472],[0.8123,0.4142],[0.8541,0.3452],[0.8894,0.2458],[0.9006,0.1848],[0.9054,0.0901],[0.8749,0.0115],[0.822,-0.019],[0.7594,-0.096],[0.6984,-0.1409],[0.5909,-0.1906],[0.5123,-0.2179],[0.4401,-0.2339],[0.384,-0.2644],[0.3166,-0.2564],[0.2556,-0.2805],[0.2091,-0.2692],[0.1594,-0.2564],[0.1048,-0.2404],[0.0728,-0.2163],[0.0294,-0.2067],[-0.0123,-0.2387],[-0.0412,-0.2724],[-0.0957,-0.4377],[-0.1567,-0.5323],[-0.2192,-0.5468],[-0.2802,-0.542],[-0.3283,-0.5275],[-0.3893,-0.489],[-0.4583,-0.4858],[-0.561,-0.4922],[-0.6428,-0.489],[-0.739,-0.481],[-0.8241,-0.4537],[-0.9011,-0.396],[-0.9829,-0.3334],[-1.0214,-0.2612],[-1.0695,-0.1762],[-1.0904,-0.0911],[-1.0262,0.0099],[-0.9155,0.0998],[-0.8465,0.1591],[-0.8193,0.2361],[-0.7551,0.3003],[-0.7053,0.342],[-0.6765,0.3934],[-0.6123,0.4431],[-0.5802,0.4752],[-0.5577,0.5377],[-0.5497,0.6099],[-0.5225,0.6613]]},{"specimen1":[[-0.087,0.7774],[-0.0317,0.7733],[0.023,0.7728],[0.072,0.7573],[0.1321,0.742],[0.1927,0.7342],[0.255,0.7267],[0.3122,0.7072],[0.3639,0.6867],[0.4149,0.6494],[0.4731,0.618],[0.5282,0.5889],[0.5859,0.5454],[0.6353,0.5014],[0.6895,0.4351],[0.7263,0.3731],[0.7441,0.3041],[0.7621,0.2332],[0.7649,0.1652],[0.7676,0.0972],[0.6701,0.0255],[0.5782,-0.0092],[0.4902,-0.0405],[0.4393,-0.0819],[0.3931,-0.114],[0.3461,-0.1362],[0.3112,-0.1479],[0.2501,-0.1476],[0.2063,-0.1562],[0.1128,-0.0987],[0.0875,-0.1124],[0.0821,-0.1606],[0.0613,-0.1948],[0.0453,-0.2401],[0.0308,-0.2945],[0.0053,-0.3758],[-0.0342,-0.5086],[-0.0983,-0.5911],[-0.1728,-0.6302],[-0.2377,-0.6398],[-0.3116,-0.6352],[-0.3873,-0.631],[-0.4642,-0.6307],[-0.5534,-0.6233],[-0.6521,-0.6249],[-0.7669,-0.6137],[-0.8854,-0.6032],[-0.9859,-0.5469],[-1.0505,-0.4796],[-1.1107,-0.406],[-1.2113,-0.3026],[-1.2707,-0.2279],[-1.2935,-0.1302],[-1.2859,-0.016],[-1.1502,0.1014],[-0.9998,0.1927],[-0.948,0.2666],[-0.855,0.3163],[-0.7707,0.3626],[-0.7131,0.4089],[-0.6788,0.4556],[-0.6461,0.5114],[-0.6102,0.5649],[-0.5902,0.6248],[-0.56,0.6949]]}],"excluded_land":["0","1","2","3","4","5","6"],"excluded_spec":["0"],"numbers_of_landmarks":72,"numbers_of_specimens":3,"root_number_landmarks":72,"root_number_specimens":3}', '["#027329","#0d33df","#0d9a8d"]', '["Object_1","Object_2"]', 23, 0, 0, '{"content":[{"text":"Procrustes Superimposition Report","style":"header"},{"text":"Type of Superimposition: Resistant Procrustes Superimposition"},{"text":"Data Dimension: 2D"},{"text":"Dataset Name: GrP_Craneos2D"},{"text":"Source Dataset: Craneos2D"},{"text":"Number of Objects: 2"},{"text":"Number of Landmarks: 65"},{"text":"Excluded Landmarks: "},{"text":"LM_1"},{"text":"LM_2"},{"text":"LM_3"},{"text":"LM_4"},{"text":"LM_5"},{"text":"LM_6"},{"text":"LM_7"},{"text":"Excluded Objects: "},{"text":"Object_1"},{"text":"Objects: ","style":"header"},{"text":"Object_1"},{"style":"tableExample","table":{"headerRows":1,"body":[["X","Y"],["-0.0893","0.7944"],["-0.0155","0.7896"],["0.0246","0.7816"],["0.084","0.7704"],["0.1369","0.7816"],["0.2155","0.772"],["0.2653","0.7752"],["0.3327","0.7463"],["0.3968","0.7222"],["0.4594","0.711"],["0.5284","0.6613"],["0.5861","0.6452"],["0.6583","0.5811"],["0.7225","0.5329"],["0.7642","0.472"],["0.8123","0.4142"],["0.8541","0.3452"],["0.8894","0.2458"],["0.9006","0.1848"],["0.9054","0.0901"],["0.8749","0.0115"],["0.822","-0.019"],["0.7594","-0.096"],["0.6984","-0.1409"],["0.5909","-0.1906"],["0.5123","-0.2179"],["0.4401","-0.2339"],["0.384","-0.2644"],["0.3166","-0.2564"],["0.2556","-0.2805"],["0.2091","-0.2692"],["0.1594","-0.2564"],["0.1048","-0.2404"],["0.0728","-0.2163"],["0.0294","-0.2067"],["-0.0123","-0.2387"],["-0.0412","-0.2724"],["-0.0957","-0.4377"],["-0.1567","-0.5323"],["-0.2192","-0.5468"],["-0.2802","-0.542"],["-0.3283","-0.5275"],["-0.3893","-0.489"],["-0.4583","-0.4858"],["-0.561","-0.4922"],["-0.6428","-0.489"],["-0.739","-0.481"],["-0.8241","-0.4537"],["-0.9011","-0.396"],["-0.9829","-0.3334"],["-1.0214","-0.2612"],["-1.0695","-0.1762"],["-1.0904","-0.0911"],["-1.0262","0.0099"],["-0.9155","0.0998"],["-0.8465","0.1591"],["-0.8193","0.2361"],["-0.7551","0.3003"],["-0.7053","0.342"],["-0.6765","0.3934"],["-0.6123","0.4431"],["-0.5802","0.4752"],["-0.5577","0.5377"],["-0.5497","0.6099"],["-0.5225","0.6613"]]},"layout":{}},{"text":"Object_2"},{"style":"tableExample","table":{"headerRows":1,"body":[["X","Y"],["-0.087","0.7774"],["-0.0317","0.7733"],["0.023","0.7728"],["0.072","0.7573"],["0.1321","0.742"],["0.1927","0.7342"],["0.255","0.7267"],["0.3122","0.7072"],["0.3639","0.6867"],["0.4149","0.6494"],["0.4731","0.618"],["0.5282","0.5889"],["0.5859","0.5454"],["0.6353","0.5014"],["0.6895","0.4351"],["0.7263","0.3731"],["0.7441","0.3041"],["0.7621","0.2332"],["0.7649","0.1652"],["0.7676","0.0972"],["0.6701","0.0255"],["0.5782","-0.0092"],["0.4902","-0.0405"],["0.4393","-0.0819"],["0.3931","-0.114"],["0.3461","-0.1362"],["0.3112","-0.1479"],["0.2501","-0.1476"],["0.2063","-0.1562"],["0.1128","-0.0987"],["0.0875","-0.1124"],["0.0821","-0.1606"],["0.0613","-0.1948"],["0.0453","-0.2401"],["0.0308","-0.2945"],["0.0053","-0.3758"],["-0.0342","-0.5086"],["-0.0983","-0.5911"],["-0.1728","-0.6302"],["-0.2377","-0.6398"],["-0.3116","-0.6352"],["-0.3873","-0.631"],["-0.4642","-0.6307"],["-0.5534","-0.6233"],["-0.6521","-0.6249"],["-0.7669","-0.6137"],["-0.8854","-0.6032"],["-0.9859","-0.5469"],["-1.0505","-0.4796"],["-1.1107","-0.406"],["-1.2113","-0.3026"],["-1.2707","-0.2279"],["-1.2935","-0.1302"],["-1.2859","-0.016"],["-1.1502","0.1014"],["-0.9998","0.1927"],["-0.948","0.2666"],["-0.855","0.3163"],["-0.7707","0.3626"],["-0.7131","0.4089"],["-0.6788","0.4556"],["-0.6461","0.5114"],["-0.6102","0.5649"],["-0.5902","0.6248"],["-0.56","0.6949"]]},"layout":{}}],"styles":{"header":{"fontSize":18,"bold":true,"margin":[0,0,0,10]},"subheader":{"fontSize":14,"bold":true,"margin":[0,10,0,5]},"tableExample":{"margin":[0,5,0,15]},"tableHeader":{"bold":true,"fontSize":13,"color":"black"}},"defaultStyle":{},"pageSize":"A4"}');
INSERT INTO dataset (dataset_id, project_id_ref, dataset_name, file_name, number_of_objects, number_of_landmarks, dimention, data, colors, objects_name, dataset_id_ref, show_consensus, send, pdf) VALUES (24, 2, 'other_dataset', 'datos_landmarks.nts', 5, 35, 3, '{"data":[{"specimen0":[[0.0662,0.1018,0.0382],[0.0686,0.0904,0.0232],[0.2196,0.0555,0.0337],[0.1826,0.0568,0.0072],[0.1614,0.0742,0.0126],[0.0258,0.0723,-0.0721],[0.0881,0.0309,-0.0476],[0.0593,0.0869,0.0188],[0.2431,0.052,0.0313],[0.2217,0.0394,-0.0021],[0.1994,0.0097,-0.0248],[0.1602,-0.034,-0.033],[0.1089,-0.0707,-0.0386],[0.0696,-0.0301,0.0526],[0.1158,-0.0144,0.0481],[0.0912,-0.048,-0.0817],[-0.0106,-0.0784,-0.1073],[0.0132,0.0734,-0.0783],[0.0299,-0.0331,-0.107],[0.0511,0.1125,0.0378],[0.0153,0.1155,0.0385],[-0.1348,0.1084,0.0487],[-0.2588,0.0294,0.066],[-0.2371,-0.0303,-0.0245],[-0.0453,-0.001,-0.0403],[-0.2286,-0.0669,0.0748],[-0.175,-0.097,0.0725],[-0.2108,-0.088,0.0444],[-0.0927,-0.0587,0.0652],[-0.1316,-0.0764,-0.0332],[-0.1646,-0.0863,-0.0331],[-0.1539,-0.0614,-0.0379],[-0.0769,-0.0533,0.0433],[-0.0969,-0.0815,-0.0044],[-0.1735,-0.0996,0.0089]]},{"specimen1":[[0.0895,0.141,0.0429],[0.1081,0.1168,0.0264],[0.2027,0.0253,0.0461],[0.1867,0.0421,0.0143],[0.1829,0.0733,0.0215],[0.0194,0.0884,-0.1139],[0.1095,0.0201,-0.0859],[0.1016,0.1066,0.0226],[0.2152,0.0039,0.047],[0.1855,0.001,0.0063],[0.1588,-0.019,-0.0106],[0.1161,-0.0457,-0.0243],[0.0651,-0.0557,-0.0227],[0.0681,-0.0178,0.0581],[0.0971,-0.0101,0.0559],[0.0466,-0.0608,-0.0692],[-0.0414,-0.0572,-0.092],[-0.0133,0.0842,-0.1083],[0.0092,-0.0409,-0.0961],[0.0751,0.1502,0.0427],[0.03,0.1578,0.0414],[-0.1435,0.1571,0.0496],[-0.3049,-0.0316,0.0765],[-0.2463,-0.0666,-0.0205],[-0.055,0.0117,-0.0599],[-0.2169,-0.0973,0.0767],[-0.1407,-0.1024,0.0753],[-0.1843,-0.1027,0.0429],[-0.0712,-0.0527,0.0681],[-0.1008,-0.0712,-0.0443],[-0.1393,-0.089,-0.0467],[-0.1299,-0.0595,-0.0492],[-0.0555,-0.0369,0.0449],[-0.072,-0.0584,-0.0159],[-0.1521,-0.1043,0.0003]]},{"specimen2":[[0.0884,0.1321,0.0325],[0.1,0.108,0.0255],[0.2024,0.0233,0.043],[0.1797,0.0316,0.0075],[0.1613,0.0603,0.0112],[0.0481,0.0929,-0.0794],[0.1007,0.0336,-0.0497],[0.0929,0.1002,0.0178],[0.2241,0.001,0.0448],[0.1935,-0.0046,-0.0001],[0.1631,-0.0341,-0.0234],[0.1084,-0.0594,-0.0258],[0.062,-0.0624,-0.0122],[0.0477,-0.0344,0.0606],[0.0976,-0.0185,0.055],[0.0469,-0.0423,-0.0939],[-0.0344,-0.057,-0.1072],[0.0358,0.1072,-0.0914],[0.0126,-0.0254,-0.11],[0.073,0.16,0.0286],[0.0384,0.1837,0.026],[-0.238,0.1392,0.0491],[-0.3043,-0.01,0.074],[-0.2344,-0.0634,-0.0316],[-0.0359,0.0125,-0.0582],[-0.2002,-0.0936,0.0825],[-0.1258,-0.092,0.0785],[-0.173,-0.1041,0.0485],[-0.0616,-0.0461,0.0681],[-0.1081,-0.0758,-0.0335],[-0.1433,-0.0917,-0.0331],[-0.1339,-0.0679,-0.0424],[-0.058,-0.0389,0.0448],[-0.0812,-0.0644,-0.0097],[-0.1443,-0.0997,0.0034]]},{"specimen3":[[0.1082,0.1367,0.0344],[0.119,0.1141,0.013],[0.1912,0.0315,0.0383],[0.1691,0.0462,0.0098],[0.167,0.0716,0.0169],[0.0461,0.0914,-0.0861],[0.0987,0.0275,-0.0564],[0.1118,0.1043,0.0111],[0.2105,0.0113,0.0407],[0.1761,-0.0002,0.0019],[0.1498,-0.0221,-0.0166],[0.1002,-0.042,-0.0272],[0.054,-0.0456,-0.0192],[0.0453,-0.0065,0.0544],[0.0972,0.0009,0.0484],[0.0653,-0.0369,-0.0645],[-0.0283,-0.0564,-0.0931],[0.0215,0.0984,-0.0893],[0.0117,-0.0338,-0.0954],[0.0972,0.1429,0.0332],[0.059,0.1528,0.0357],[-0.1654,0.1594,0.0485],[-0.3088,-0.034,0.0763],[-0.2645,-0.0531,-0.0331],[-0.041,-0.0041,-0.0547],[-0.2147,-0.11,0.0802],[-0.1386,-0.1115,0.0777],[-0.193,-0.1099,0.0451],[-0.0667,-0.0507,0.0661],[-0.107,-0.0883,-0.0478],[-0.1458,-0.1058,-0.0427],[-0.1376,-0.0735,-0.0497],[-0.0528,-0.0331,0.0485],[-0.0705,-0.061,-0.0084],[-0.164,-0.1106,0.0045]]},{"specimen4":[[0.0804,0.1296,0.0349],[0.0948,0.1092,0.0238],[0.2108,0.0357,0.0396],[0.1815,0.0499,0.0009],[0.1761,0.0707,0.0028],[0.0381,0.0866,-0.0741],[0.1011,0.0348,-0.0563],[0.0864,0.1007,0.0181],[0.2356,0.0187,0.0414],[0.2019,-0.0014,-0.0024],[0.1679,-0.0267,-0.0213],[0.1244,-0.0499,-0.0197],[0.0772,-0.0575,-0.0147],[0.0634,-0.0271,0.0567],[0.1089,-0.013,0.0529],[0.0533,-0.055,-0.0755],[-0.0449,-0.0622,-0.0979],[0.0153,0.0918,-0.0837],[0.0154,-0.0318,-0.1045],[0.065,0.1416,0.0343],[0.0259,0.147,0.0342],[-0.1936,0.1386,0.0524],[-0.2973,0.0023,0.0701],[-0.2516,-0.0498,-0.0276],[-0.0304,-0.0061,-0.046],[-0.2095,-0.0925,0.0779],[-0.1458,-0.0977,0.0751],[-0.1883,-0.1039,0.0452],[-0.071,-0.043,0.0662],[-0.1108,-0.0728,-0.0412],[-0.1518,-0.092,-0.0437],[-0.1365,-0.0618,-0.0512],[-0.0685,-0.0385,0.0433],[-0.0778,-0.0668,-0.0121],[-0.1458,-0.1077,0.0024]]}],"excluded_land":[],"excluded_spec":[],"root_number_landmarks":35,"root_number_specimens":5}', '["#042ce4","#092685","#0717e7","#0b5a08","#068a7f"]', '["Alouatta_caraya","Aotus_azarai","Cebus_apella","Callitrhix_jacchus","Pithecia_irrorata"]', NULL, 0, 0, NULL);
INSERT INTO dataset (dataset_id, project_id_ref, dataset_name, file_name, number_of_objects, number_of_landmarks, dimention, data, colors, objects_name, dataset_id_ref, show_consensus, send, pdf) VALUES (23, 2, 'Craneos2D', 'craneos2D.tps', 3, 72, 2, '{"data":[{"specimen0":[[8.36,12.93],[9.12,12.87],[9.88,12.57],[10.33,12.61],[10.71,12.68],[11.15,12.7],[11.62,12.74],[12.11,12.77],[12.47,12.8],[12.93,12.82],[13.45,12.8],[13.9,12.7],[14.31,12.7],[14.75,12.59],[15.29,12.46],[15.71,12.28],[16.15,12.15],[16.65,11.85],[17.13,11.56],[17.56,11.2],[17.88,10.77],[18.17,10.32],[18.47,9.99],[18.76,9.39],[19.08,8.87],[18.95,8.36],[18.49,7.63],[18.23,7.2],[17.77,6.81],[17.38,6.33],[16.86,5.9],[16.58,5.74],[16.19,5.5],[15.69,5.4],[15.52,5.18],[15.25,4.8],[14.72,4.88],[14.48,4.77],[14.09,4.95],[13.54,5.06],[13.41,4.82],[13.23,4.53],[12.98,3.93],[12.76,2.37],[12.24,1.3],[11.55,0.77],[10.91,0.55],[10.24,0.48],[9.6,0.59],[8.8,0.59],[7.9,0.49],[6.82,0.24],[5.67,0.2],[4.55,0.31],[3.4,0.63],[2.53,1.31],[1.82,2.09],[0.89,2.97],[0.46,3.84],[1.04,4.93],[2.87,6.41],[3.7,7.25],[4.1,7.95],[5.33,8.72],[5.95,9.12],[6.49,9.61],[6.77,10.04],[7.08,10.56],[7.26,11.03],[7.48,11.58],[7.52,12.09],[7.91,12.62]]},{"specimen1":[[9.65,11.28],[10.06,11.39],[10.38,11.54],[10.59,11.7],[11.05,11.77],[11.43,11.87],[11.73,11.82],[12.09,11.88],[12.55,11.85],[12.8,11.8],[13.17,11.73],[13.5,11.8],[13.99,11.74],[14.3,11.76],[14.72,11.58],[15.12,11.43],[15.51,11.36],[15.94,11.05],[16.3,10.95],[16.75,10.55],[17.15,10.25],[17.41,9.87],[17.71,9.51],[17.97,9.08],[18.19,8.46],[18.26,8.08],[18.29,7.49],[18.1,7],[17.77,6.81],[17.38,6.33],[17,6.05],[16.33,5.74],[15.84,5.57],[15.39,5.47],[15.04,5.28],[14.62,5.33],[14.24,5.18],[13.95,5.25],[13.64,5.33],[13.3,5.43],[13.1,5.58],[12.83,5.64],[12.57,5.44],[12.39,5.23],[12.05,4.2],[11.67,3.61],[11.28,3.52],[10.9,3.55],[10.6,3.64],[10.22,3.88],[9.79,3.9],[9.15,3.86],[8.64,3.88],[8.04,3.93],[7.51,4.1],[7.03,4.46],[6.52,4.85],[6.28,5.3],[5.98,5.83],[5.85,6.36],[6.25,6.99],[6.94,7.55],[7.37,7.92],[7.54,8.4],[7.94,8.8],[8.25,9.06],[8.43,9.38],[8.83,9.69],[9.03,9.89],[9.17,10.28],[9.22,10.73],[9.39,11.05]]},{"specimen2":[[-3.4967,4.6879],[-2.9462,4.7419],[-2.4489,4.7722],[-1.968,4.8139],[-1.5133,4.9228],[-1.0488,4.976],[-0.5851,4.9931],[-0.1837,4.9562],[0.2456,4.9242],[0.67,4.92],[1.0501,4.8003],[1.5162,4.6815],[1.9864,4.6208],[2.4706,4.5626],[2.9138,4.411],[3.3152,4.252],[3.7108,3.9627],[4.163,3.7193],[4.5906,3.4932],[5.0379,3.1556],[5.4212,2.8139],[5.8422,2.2994],[6.1281,1.8185],[6.2656,1.2827],[6.4056,0.7329],[6.4269,0.2053],[6.4481,-0.3222],[5.6919,-0.8792],[4.9783,-1.1486],[4.2958,-1.391],[3.9001,-1.7121],[3.5421,-1.9619],[3.1775,-2.1339],[2.9063,-2.2248],[2.432,-2.2223],[2.092,-2.2894],[1.367,-1.8428],[1.1704,-1.9493],[1.1285,-2.3229],[0.9671,-2.5883],[0.8425,-2.9405],[0.7303,-3.3624],[0.5327,-3.9932],[0.2262,-5.0238],[-0.2712,-5.6643],[-0.8496,-5.9674],[-1.3534,-6.0419],[-1.9269,-6.0065],[-2.5143,-5.9737],[-3.1107,-5.9712],[-3.8029,-5.9137],[-4.5689,-5.9267],[-5.4602,-5.8397],[-6.3794,-5.7577],[-7.16,-5.3209],[-7.6613,-4.799],[-8.1282,-4.2279],[-8.9088,-3.425],[-9.37,-2.8457],[-9.5468,-2.0871],[-9.4877,-1.2007],[-8.4349,-0.2899],[-7.2674,0.4186],[-6.8659,0.992],[-6.1441,1.3778],[-5.4895,1.7373],[-5.0429,2.0961],[-4.7766,2.459],[-4.5226,2.8915],[-4.244,3.3068],[-4.0891,3.7721],[-3.8547,4.316]]}],"excluded_land":[],"excluded_spec":[],"root_number_landmarks":72,"root_number_specimens":3}', '["#027329","#0d33df","#0d9a8d"]', '["Object_0","Object_1","Object_2"]', NULL, 0, 0, NULL);
INSERT INTO dataset (dataset_id, project_id_ref, dataset_name, file_name, number_of_objects, number_of_landmarks, dimention, data, colors, objects_name, dataset_id_ref, show_consensus, send, pdf) VALUES (25, 2, 'GlsP_Craneos2D_25', 'GlsP_craneos2D.tps', 3, 72, 2, '{"data":[{"specimen0":[[-0.0063,0.1081],[0.0051,0.1013],[0.0147,0.0908],[0.022,0.088],[0.0285,0.0861],[0.0355,0.0831],[0.0432,0.0801],[0.051,0.0768],[0.0569,0.0744],[0.0642,0.0712],[0.0722,0.0669],[0.0785,0.0619],[0.0849,0.0587],[0.0909,0.0536],[0.0983,0.0474],[0.1035,0.0414],[0.1094,0.0359],[0.1149,0.0274],[0.1201,0.0192],[0.1241,0.0102],[0.1258,0.001],[0.1268,-0.0082],[0.129,-0.0157],[0.1289,-0.0273],[0.1299,-0.0379],[0.1239,-0.0449],[0.1111,-0.0527],[0.1037,-0.0574],[0.0936,-0.06],[0.0838,-0.0645],[0.0723,-0.0672],[0.0667,-0.0675],[0.0588,-0.0683],[0.0502,-0.066],[0.0458,-0.0681],[0.0387,-0.0719],[0.031,-0.0666],[0.0264,-0.0665],[0.0217,-0.0607],[0.014,-0.0547],[0.0101,-0.0575],[0.005,-0.0606],[-0.0035,-0.068],[-0.0189,-0.0907],[-0.0353,-0.1034],[-0.0501,-0.1063],[-0.0618,-0.1049],[-0.0728,-0.1008],[-0.082,-0.0941],[-0.0944,-0.088],[-0.1093,-0.0826],[-0.128,-0.0782],[-0.1463,-0.07],[-0.1629,-0.0596],[-0.1784,-0.0458],[-0.1868,-0.0285],[-0.1918,-0.0108],[-0.1996,0.0101],[-0.1996,0.027],[-0.1822,0.0395],[-0.1423,0.0486],[-0.1228,0.0553],[-0.1112,0.0631],[-0.0861,0.0657],[-0.0733,0.0672],[-0.0611,0.0707],[-0.0534,0.0752],[-0.0446,0.0809],[-0.0381,0.0869],[-0.0304,0.0938],[-0.0259,0.1014],[-0.0157,0.1067]]},{"specimen1":[[-0.022,0.1047],[-0.0114,0.1028],[-0.0025,0.1027],[0.004,0.1041],[0.0152,0.1007],[0.0249,0.0989],[0.0312,0.0945],[0.04,0.0919],[0.0502,0.0863],[0.0553,0.0825],[0.063,0.0769],[0.0713,0.0749],[0.0818,0.0682],[0.089,0.0653],[0.0966,0.0567],[0.1041,0.049],[0.1122,0.0432],[0.1187,0.0315],[0.1258,0.0253],[0.1317,0.0113],[0.1375,0.0002],[0.1393,-0.0113],[0.1423,-0.0227],[0.1435,-0.0353],[0.1418,-0.0517],[0.1393,-0.0612],[0.1336,-0.0749],[0.124,-0.084],[0.1144,-0.0847],[0.1003,-0.0914],[0.0887,-0.0937],[0.0701,-0.0935],[0.0571,-0.0921],[0.0458,-0.0895],[0.0358,-0.09],[0.0268,-0.0844],[0.0166,-0.0837],[0.0107,-0.0789],[0.0045,-0.0738],[-0.0021,-0.0679],[-0.0051,-0.0623],[-0.0106,-0.0581],[-0.0186,-0.0598],[-0.025,-0.0627],[-0.0439,-0.0824],[-0.0589,-0.0917],[-0.0688,-0.0896],[-0.0771,-0.0848],[-0.083,-0.0795],[-0.089,-0.0699],[-0.0986,-0.0648],[-0.1136,-0.0588],[-0.125,-0.0528],[-0.1381,-0.0452],[-0.1484,-0.0356],[-0.1554,-0.0222],[-0.1628,-0.0078],[-0.1634,0.005],[-0.1645,0.0203],[-0.1617,0.0338],[-0.1458,0.0438],[-0.124,0.0491],[-0.1102,0.0529],[-0.1011,0.062],[-0.0877,0.0667],[-0.0778,0.0693],[-0.0703,0.0746],[-0.0578,0.0774],[-0.0511,0.0798],[-0.0437,0.0871],[-0.0377,0.0968],[-0.0304,0.1023]]},{"specimen2":[[-0.011,0.1072],[-0.0007,0.1036],[0.0085,0.1],[0.0174,0.0967],[0.0265,0.0949],[0.0352,0.092],[0.0437,0.0885],[0.0505,0.0845],[0.058,0.0804],[0.0655,0.0768],[0.0713,0.0715],[0.0787,0.0655],[0.0866,0.0605],[0.0948,0.0554],[0.1014,0.049],[0.1073,0.0429],[0.112,0.0344],[0.118,0.0263],[0.1238,0.0187],[0.129,0.009],[0.133,-0.0003],[0.1363,-0.013],[0.1374,-0.024],[0.1354,-0.0347],[0.1334,-0.0457],[0.1294,-0.0553],[0.1254,-0.0649],[0.1072,-0.0686],[0.0922,-0.0675],[0.078,-0.0662],[0.0683,-0.0687],[0.0598,-0.0702],[0.0518,-0.0702],[0.0462,-0.0696],[0.0378,-0.0656],[0.0311,-0.064],[0.0219,-0.05],[0.0175,-0.0503],[0.0136,-0.0566],[0.0085,-0.06],[0.0034,-0.0653],[-0.0021,-0.0719],[-0.0109,-0.0815],[-0.0249,-0.0974],[-0.0391,-0.1047],[-0.052,-0.1054],[-0.0616,-0.1025],[-0.0716,-0.0971],[-0.0818,-0.0917],[-0.0925,-0.0867],[-0.1044,-0.0799],[-0.1182,-0.0738],[-0.1334,-0.0648],[-0.1492,-0.0558],[-0.1595,-0.0415],[-0.1642,-0.028],[-0.1678,-0.0139],[-0.1751,0.007],[-0.1785,0.0211],[-0.1754,0.0362],[-0.1669,0.0515],[-0.1406,0.0591],[-0.1138,0.0621],[-0.1019,0.069],[-0.0858,0.0699],[-0.0711,0.0709],[-0.0601,0.0736],[-0.0523,0.0779],[-0.0442,0.0836],[-0.0358,0.0887],[-0.0291,0.0957],[-0.0204,0.1035]]}],"excluded_land":[],"excluded_spec":[],"numbers_of_landmarks":72,"numbers_of_specimens":3,"root_number_landmarks":72,"root_number_specimens":3}', '["#027329","#0d33df","#0d9a8d"]', '["Object_0","Object_1","Object_2"]', 23, 0, 0, '{"content":[{"text":"Procrustes Superimposition Report","style":"header"},{"text":"Type of Superimposition: Least-Squares Procrustes Superimposition"},{"text":"Data Dimension: 2D"},{"text":"Dataset Name: GlsP_Craneos2D"},{"text":"Source Dataset: Craneos2D"},{"text":"Number of Objects: 3"},{"text":"Number of Landmarks: 72"},{"text":"Excluded Landmarks: N/A"},{"text":"Excluded Objects: N/A"},{"text":"Objects: ","style":"header"},{"text":"Object_0"},{"style":"tableExample","table":{"headerRows":1,"body":[["X","Y"],["-0.0063","0.1081"],["0.0051","0.1013"],["0.0147","0.0908"],["0.022","0.088"],["0.0285","0.0861"],["0.0355","0.0831"],["0.0432","0.0801"],["0.051","0.0768"],["0.0569","0.0744"],["0.0642","0.0712"],["0.0722","0.0669"],["0.0785","0.0619"],["0.0849","0.0587"],["0.0909","0.0536"],["0.0983","0.0474"],["0.1035","0.0414"],["0.1094","0.0359"],["0.1149","0.0274"],["0.1201","0.0192"],["0.1241","0.0102"],["0.1258","0.001"],["0.1268","-0.0082"],["0.129","-0.0157"],["0.1289","-0.0273"],["0.1299","-0.0379"],["0.1239","-0.0449"],["0.1111","-0.0527"],["0.1037","-0.0574"],["0.0936","-0.06"],["0.0838","-0.0645"],["0.0723","-0.0672"],["0.0667","-0.0675"],["0.0588","-0.0683"],["0.0502","-0.066"],["0.0458","-0.0681"],["0.0387","-0.0719"],["0.031","-0.0666"],["0.0264","-0.0665"],["0.0217","-0.0607"],["0.014","-0.0547"],["0.0101","-0.0575"],["0.005","-0.0606"],["-0.0035","-0.068"],["-0.0189","-0.0907"],["-0.0353","-0.1034"],["-0.0501","-0.1063"],["-0.0618","-0.1049"],["-0.0728","-0.1008"],["-0.082","-0.0941"],["-0.0944","-0.088"],["-0.1093","-0.0826"],["-0.128","-0.0782"],["-0.1463","-0.07"],["-0.1629","-0.0596"],["-0.1784","-0.0458"],["-0.1868","-0.0285"],["-0.1918","-0.0108"],["-0.1996","0.0101"],["-0.1996","0.027"],["-0.1822","0.0395"],["-0.1423","0.0486"],["-0.1228","0.0553"],["-0.1112","0.0631"],["-0.0861","0.0657"],["-0.0733","0.0672"],["-0.0611","0.0707"],["-0.0534","0.0752"],["-0.0446","0.0809"],["-0.0381","0.0869"],["-0.0304","0.0938"],["-0.0259","0.1014"],["-0.0157","0.1067"]]},"layout":{}},{"text":"Object_1"},{"style":"tableExample","table":{"headerRows":1,"body":[["X","Y"],["-0.022","0.1047"],["-0.0114","0.1028"],["-0.0025","0.1027"],["0.004","0.1041"],["0.0152","0.1007"],["0.0249","0.0989"],["0.0312","0.0945"],["0.04","0.0919"],["0.0502","0.0863"],["0.0553","0.0825"],["0.063","0.0769"],["0.0713","0.0749"],["0.0818","0.0682"],["0.089","0.0653"],["0.0966","0.0567"],["0.1041","0.049"],["0.1122","0.0432"],["0.1187","0.0315"],["0.1258","0.0253"],["0.1317","0.0113"],["0.1375","0.0002"],["0.1393","-0.0113"],["0.1423","-0.0227"],["0.1435","-0.0353"],["0.1418","-0.0517"],["0.1393","-0.0612"],["0.1336","-0.0749"],["0.124","-0.084"],["0.1144","-0.0847"],["0.1003","-0.0914"],["0.0887","-0.0937"],["0.0701","-0.0935"],["0.0571","-0.0921"],["0.0458","-0.0895"],["0.0358","-0.09"],["0.0268","-0.0844"],["0.0166","-0.0837"],["0.0107","-0.0789"],["0.0045","-0.0738"],["-0.0021","-0.0679"],["-0.0051","-0.0623"],["-0.0106","-0.0581"],["-0.0186","-0.0598"],["-0.025","-0.0627"],["-0.0439","-0.0824"],["-0.0589","-0.0917"],["-0.0688","-0.0896"],["-0.0771","-0.0848"],["-0.083","-0.0795"],["-0.089","-0.0699"],["-0.0986","-0.0648"],["-0.1136","-0.0588"],["-0.125","-0.0528"],["-0.1381","-0.0452"],["-0.1484","-0.0356"],["-0.1554","-0.0222"],["-0.1628","-0.0078"],["-0.1634","0.005"],["-0.1645","0.0203"],["-0.1617","0.0338"],["-0.1458","0.0438"],["-0.124","0.0491"],["-0.1102","0.0529"],["-0.1011","0.062"],["-0.0877","0.0667"],["-0.0778","0.0693"],["-0.0703","0.0746"],["-0.0578","0.0774"],["-0.0511","0.0798"],["-0.0437","0.0871"],["-0.0377","0.0968"],["-0.0304","0.1023"]]},"layout":{}},{"text":"Object_2"},{"style":"tableExample","table":{"headerRows":1,"body":[["X","Y"],["-0.011","0.1072"],["-0.0007","0.1036"],["0.0085","0.1"],["0.0174","0.0967"],["0.0265","0.0949"],["0.0352","0.092"],["0.0437","0.0885"],["0.0505","0.0845"],["0.058","0.0804"],["0.0655","0.0768"],["0.0713","0.0715"],["0.0787","0.0655"],["0.0866","0.0605"],["0.0948","0.0554"],["0.1014","0.049"],["0.1073","0.0429"],["0.112","0.0344"],["0.118","0.0263"],["0.1238","0.0187"],["0.129","0.009"],["0.133","-0.0003"],["0.1363","-0.013"],["0.1374","-0.024"],["0.1354","-0.0347"],["0.1334","-0.0457"],["0.1294","-0.0553"],["0.1254","-0.0649"],["0.1072","-0.0686"],["0.0922","-0.0675"],["0.078","-0.0662"],["0.0683","-0.0687"],["0.0598","-0.0702"],["0.0518","-0.0702"],["0.0462","-0.0696"],["0.0378","-0.0656"],["0.0311","-0.064"],["0.0219","-0.05"],["0.0175","-0.0503"],["0.0136","-0.0566"],["0.0085","-0.06"],["0.0034","-0.0653"],["-0.0021","-0.0719"],["-0.0109","-0.0815"],["-0.0249","-0.0974"],["-0.0391","-0.1047"],["-0.052","-0.1054"],["-0.0616","-0.1025"],["-0.0716","-0.0971"],["-0.0818","-0.0917"],["-0.0925","-0.0867"],["-0.1044","-0.0799"],["-0.1182","-0.0738"],["-0.1334","-0.0648"],["-0.1492","-0.0558"],["-0.1595","-0.0415"],["-0.1642","-0.028"],["-0.1678","-0.0139"],["-0.1751","0.007"],["-0.1785","0.0211"],["-0.1754","0.0362"],["-0.1669","0.0515"],["-0.1406","0.0591"],["-0.1138","0.0621"],["-0.1019","0.069"],["-0.0858","0.0699"],["-0.0711","0.0709"],["-0.0601","0.0736"],["-0.0523","0.0779"],["-0.0442","0.0836"],["-0.0358","0.0887"],["-0.0291","0.0957"],["-0.0204","0.1035"]]},"layout":{}}],"styles":{"header":{"fontSize":18,"bold":true,"margin":[0,0,0,10]},"subheader":{"fontSize":14,"bold":true,"margin":[0,10,0,5]},"tableExample":{"margin":[0,5,0,15]},"tableHeader":{"bold":true,"fontSize":13,"color":"black"}},"defaultStyle":{},"pageSize":"A4"}');


--
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 190
-- Name: dataset_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dataset_dataset_id_seq', 26, true);


--
-- TOC entry 2170 (class 0 OID 148494)
-- Dependencies: 193
-- Data for Name: distance; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO distance (distance_id, dataset_id_ref, distance_name, data, objects_name, dimention, send, pdf) VALUES (5, 23, 'lsD_Craneos2D_5', '[[0,18.631,103.1767],[18.631,0,110.0721],[103.1767,110.0721,0]]', '["Object_0","Object_1","Object_2"]', 2, 0, '{"content":[{"text":"Distance Matrix Report","style":"header"},{"text":"Type of Distance: Least-Squares Distance"},{"text":"Output Name: lsD_Craneos2D_5"},{"text":"Source Dataset: Craneos2D"},{"text":"Number of Objects: 3"},{"style":"tableExample","table":{"headerRows":1,"body":[[{"text":" ","bold":true},{"text":"Object_0","bold":true},{"text":"Object_1","bold":true},{"text":"Object_2","bold":true}],[{"text":"Object_0","bold":true},"0","18.631","103.1767"],[{"text":"Object_1","bold":true},"18.631","0","110.0721"],[{"text":"Object_2","bold":true},"103.1767","110.0721","0"]]},"layout":{}}],"styles":{"header":{"fontSize":18,"bold":true,"margin":[0,0,0,10]},"subheader":{"fontSize":14,"bold":true,"margin":[0,10,0,5]},"tableExample":{"margin":[0,5,0,15]},"tableHeader":{"bold":true,"fontSize":13,"color":"black"}},"defaultStyle":{"fontSize":11},"pageSize":"A4"}');
INSERT INTO distance (distance_id, dataset_id_ref, distance_name, data, objects_name, dimention, send, pdf) VALUES (4, 26, 'rD_GrP_Craneos2D_26_4', '[[0,7.4426],[7.4426,0]]', '["Object_1","Object_2"]', 2, 0, '{"content":[{"text":"Distance Matrix Report","style":"header"},{"text":"Type of Distance: Resistant Distance"},{"text":"Output Name: rD_GrP_Craneos2D_26_4"},{"text":"Source Dataset: GrP_Craneos2D_26"},{"text":"Number of Objects: 2"},{"style":"tableExample","table":{"headerRows":1,"body":[[{"text":" ","bold":true},{"text":"Object_1","bold":true},{"text":"Object_2","bold":true}],[{"text":"Object_1","bold":true},"0","7.4426"],[{"text":"Object_2","bold":true},"7.4426","0"]]},"layout":{}}],"styles":{"header":{"fontSize":18,"bold":true,"margin":[0,0,0,10]},"subheader":{"fontSize":14,"bold":true,"margin":[0,10,0,5]},"tableExample":{"margin":[0,5,0,15]},"tableHeader":{"bold":true,"fontSize":13,"color":"black"}},"defaultStyle":{"fontSize":11},"pageSize":"A4"}');


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 192
-- Name: distance_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('distance_distance_id_seq', 5, true);


--
-- TOC entry 2172 (class 0 OID 148510)
-- Dependencies: 195
-- Data for Name: ordination; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ordination (ordination_id, distance_id_ref, ordination_name, data, objects_name, colors, send, pdf) VALUES (12, 4, 'rUMDS_rD_GrP_Craneos2D_26_4_12', '[[-5.0459,-3.4887],[0.9914,0.8637]]', '["Object_1","Object_2"]', '["#027329","#0d33df","#0d9a8d"]', 0, '{"content":[{"text":"Ordination Report","style":"header"},{"text":"Type of Universal MDS: Resistant UMDS"},{"text":"Output Name: rUMDS_rD_GrP_Craneos2D_26_4_12"},{"text":"Source Distance Matrix: rD_GrP_Craneos2D_26_4"},{"text":"Cartesian Coordinates: ","style":"subheader"},{"text":"Object_1 -->  (-5.0459,-3.4887)","bold":true},{"text":"Object_2 -->  (0.9914,0.8637)","bold":true}],"styles":{"header":{"fontSize":18,"bold":true,"margin":[0,0,0,10]},"subheader":{"fontSize":14,"bold":true,"margin":[0,10,0,5]},"tableExample":{"margin":[0,5,0,15]},"tableHeader":{"bold":true,"fontSize":13,"color":"black"}},"defaultStyle":{},"pageSize":"A4"}');
INSERT INTO ordination (ordination_id, distance_id_ref, ordination_name, data, objects_name, colors, send, pdf) VALUES (10, 4, 'rUMDS_rD_GrP_Craneos2D_26_4', '[[5.0991,5.6507],[0.2011,0.0469]]', '["Object_1","Object_2"]', '["#027329","#0d33df","#0d9a8d"]', 0, NULL);
INSERT INTO ordination (ordination_id, distance_id_ref, ordination_name, data, objects_name, colors, send, pdf) VALUES (11, 4, 'rUMDS_rD_GrP_Craneos2D_26_4', '[[7.4307,-1.7401],[0.3526,0.5605]]', '["Object_1","Object_2"]', '["#027329","#0d33df","#0d9a8d"]', 0, NULL);
INSERT INTO ordination (ordination_id, distance_id_ref, ordination_name, data, objects_name, colors, send, pdf) VALUES (13, 5, 'lsUMDS_lsD_Craneos2D_5_13', '[[-33.4895,-12.045],[-40.5433,5.1991],[69.253,-2.5889]]', '["Object_0","Object_1","Object_2"]', '["#027329","#0d33df","#0d9a8d"]', 0, '{"content":[{"text":"Ordination Report","style":"header"},{"text":"Type of Universal MDS: Least-Squeares UMDS"},{"text":"Output Name: lsUMDS_lsD_Craneos2D_5_13"},{"text":"Source Distance Matrix: lsD_Craneos2D_5"},{"text":"Cartesian Coordinates: ","style":"subheader"},{"text":"Object_0 -->  (-33.4895,-12.045)","bold":true},{"text":"Object_1 -->  (-40.5433,5.1991)","bold":true},{"text":"Object_2 -->  (69.253,-2.5889)","bold":true}],"styles":{"header":{"fontSize":18,"bold":true,"margin":[0,0,0,10]},"subheader":{"fontSize":14,"bold":true,"margin":[0,10,0,5]},"tableExample":{"margin":[0,5,0,15]},"tableHeader":{"bold":true,"fontSize":13,"color":"black"}},"defaultStyle":{},"pageSize":"A4"}');


--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 194
-- Name: ordination_ordination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ordination_ordination_id_seq', 13, true);


--
-- TOC entry 2166 (class 0 OID 148457)
-- Dependencies: 189
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO project (project_id, description, creation_date, project_name, user_id) VALUES (2, '-', '2018-08-25 11:17:21.073149', 'Test', 2);


--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 188
-- Name: project_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('project_project_id_seq', 2, true);


-- Completed on 2018-08-26 02:24:05

--
-- PostgreSQL database dump complete
--

