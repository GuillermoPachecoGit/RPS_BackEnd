--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

-- Started on 2018-08-23 20:03:29

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2165 (class 0 OID 148439)
-- Dependencies: 187
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO app_user (user_id, password, area, first_name, email_address, institution, country_id, last_name, nick) VALUES (1, '1234', 'Sistemas', 'Guillermo', 'guillermopacheco.exa@gmail.com', 'UNICEN', 9, 'Pacheco', 'Guille');


--
-- TOC entry 2190 (class 0 OID 0)
-- Dependencies: 186
-- Name: app_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('app_user_user_id_seq', 1, true);


--
-- TOC entry 2163 (class 0 OID 49757)
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
-- TOC entry 2191 (class 0 OID 0)
-- Dependencies: 184
-- Name: country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('country_country_id_seq', 247, true);


--
-- TOC entry 2169 (class 0 OID 148473)
-- Dependencies: 191
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO dataset (dataset_id, project_id_ref, dataset_name, file_name, number_of_objects, number_of_landmarks, dimention, data, colors, objects_name, dataset_id_ref, show_consensus, send, pdf) VALUES (2, 1, 'craneos', 'craneos2D.tps', 3, 72, 2, '{"data":[{"specimen0":[[8.36,12.93],[9.12,12.87],[9.88,12.57],[10.33,12.61],[10.71,12.68],[11.15,12.7],[11.62,12.74],[12.11,12.77],[12.47,12.8],[12.93,12.82],[13.45,12.8],[13.9,12.7],[14.31,12.7],[14.75,12.59],[15.29,12.46],[15.71,12.28],[16.15,12.15],[16.65,11.85],[17.13,11.56],[17.56,11.2],[17.88,10.77],[18.17,10.32],[18.47,9.99],[18.76,9.39],[19.08,8.87],[18.95,8.36],[18.49,7.63],[18.23,7.2],[17.77,6.81],[17.38,6.33],[16.86,5.9],[16.58,5.74],[16.19,5.5],[15.69,5.4],[15.52,5.18],[15.25,4.8],[14.72,4.88],[14.48,4.77],[14.09,4.95],[13.54,5.06],[13.41,4.82],[13.23,4.53],[12.98,3.93],[12.76,2.37],[12.24,1.3],[11.55,0.77],[10.91,0.55],[10.24,0.48],[9.6,0.59],[8.8,0.59],[7.9,0.49],[6.82,0.24],[5.67,0.2],[4.55,0.31],[3.4,0.63],[2.53,1.31],[1.82,2.09],[0.89,2.97],[0.46,3.84],[1.04,4.93],[2.87,6.41],[3.7,7.25],[4.1,7.95],[5.33,8.72],[5.95,9.12],[6.49,9.61],[6.77,10.04],[7.08,10.56],[7.26,11.03],[7.48,11.58],[7.52,12.09],[7.91,12.62]]},{"specimen1":[[9.65,11.28],[10.06,11.39],[10.38,11.54],[10.59,11.7],[11.05,11.77],[11.43,11.87],[11.73,11.82],[12.09,11.88],[12.55,11.85],[12.8,11.8],[13.17,11.73],[13.5,11.8],[13.99,11.74],[14.3,11.76],[14.72,11.58],[15.12,11.43],[15.51,11.36],[15.94,11.05],[16.3,10.95],[16.75,10.55],[17.15,10.25],[17.41,9.87],[17.71,9.51],[17.97,9.08],[18.19,8.46],[18.26,8.08],[18.29,7.49],[18.1,7],[17.77,6.81],[17.38,6.33],[17,6.05],[16.33,5.74],[15.84,5.57],[15.39,5.47],[15.04,5.28],[14.62,5.33],[14.24,5.18],[13.95,5.25],[13.64,5.33],[13.3,5.43],[13.1,5.58],[12.83,5.64],[12.57,5.44],[12.39,5.23],[12.05,4.2],[11.67,3.61],[11.28,3.52],[10.9,3.55],[10.6,3.64],[10.22,3.88],[9.79,3.9],[9.15,3.86],[8.64,3.88],[8.04,3.93],[7.51,4.1],[7.03,4.46],[6.52,4.85],[6.28,5.3],[5.98,5.83],[5.85,6.36],[6.25,6.99],[6.94,7.55],[7.37,7.92],[7.54,8.4],[7.94,8.8],[8.25,9.06],[8.43,9.38],[8.83,9.69],[9.03,9.89],[9.17,10.28],[9.22,10.73],[9.39,11.05]]},{"specimen2":[[-3.4967,4.6879],[-2.9462,4.7419],[-2.4489,4.7722],[-1.968,4.8139],[-1.5133,4.9228],[-1.0488,4.976],[-0.5851,4.9931],[-0.1837,4.9562],[0.2456,4.9242],[0.67,4.92],[1.0501,4.8003],[1.5162,4.6815],[1.9864,4.6208],[2.4706,4.5626],[2.9138,4.411],[3.3152,4.252],[3.7108,3.9627],[4.163,3.7193],[4.5906,3.4932],[5.0379,3.1556],[5.4212,2.8139],[5.8422,2.2994],[6.1281,1.8185],[6.2656,1.2827],[6.4056,0.7329],[6.4269,0.2053],[6.4481,-0.3222],[5.6919,-0.8792],[4.9783,-1.1486],[4.2958,-1.391],[3.9001,-1.7121],[3.5421,-1.9619],[3.1775,-2.1339],[2.9063,-2.2248],[2.432,-2.2223],[2.092,-2.2894],[1.367,-1.8428],[1.1704,-1.9493],[1.1285,-2.3229],[0.9671,-2.5883],[0.8425,-2.9405],[0.7303,-3.3624],[0.5327,-3.9932],[0.2262,-5.0238],[-0.2712,-5.6643],[-0.8496,-5.9674],[-1.3534,-6.0419],[-1.9269,-6.0065],[-2.5143,-5.9737],[-3.1107,-5.9712],[-3.8029,-5.9137],[-4.5689,-5.9267],[-5.4602,-5.8397],[-6.3794,-5.7577],[-7.16,-5.3209],[-7.6613,-4.799],[-8.1282,-4.2279],[-8.9088,-3.425],[-9.37,-2.8457],[-9.5468,-2.0871],[-9.4877,-1.2007],[-8.4349,-0.2899],[-7.2674,0.4186],[-6.8659,0.992],[-6.1441,1.3778],[-5.4895,1.7373],[-5.0429,2.0961],[-4.7766,2.459],[-4.5226,2.8915],[-4.244,3.3068],[-4.0891,3.7721],[-3.8547,4.316]]}],"excluded_land":[],"excluded_spec":[],"numbers_of_landmarks":72,"numbers_of_specimens":3,"root_number_landmarks":72,"root_number_specimens":3}', '["#096a21","#0dd8e3","#087721"]', '["Object_0","Object_1","Object_2"]', NULL, 0, 0, NULL);


--
-- TOC entry 2192 (class 0 OID 0)
-- Dependencies: 190
-- Name: dataset_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dataset_dataset_id_seq', 2, true);


--
-- TOC entry 2171 (class 0 OID 148494)
-- Dependencies: 193
-- Data for Name: distance; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2193 (class 0 OID 0)
-- Dependencies: 192
-- Name: distance_distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('distance_distance_id_seq', 1, false);


--
-- TOC entry 2173 (class 0 OID 148510)
-- Dependencies: 195
-- Data for Name: ordination; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2194 (class 0 OID 0)
-- Dependencies: 194
-- Name: ordination_ordination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ordination_ordination_id_seq', 1, false);


--
-- TOC entry 2167 (class 0 OID 148457)
-- Dependencies: 189
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO project (project_id, description, creation_date, project_name, user_id) VALUES (1, '-', '2018-08-22 21:27:22.189362', 'Test', 1);


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 188
-- Name: project_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('project_project_id_seq', 1, true);


-- Completed on 2018-08-23 20:03:29

--
-- PostgreSQL database dump complete
--

