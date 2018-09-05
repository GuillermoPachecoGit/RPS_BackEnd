DELETE FROM public.dataset;
DELETE FROM public.distance;
DELETE FROM public.ordination;
DELETE FROM public.project;
DELETE FROM public.app_user;

 
SELECT * FROM public.app_user;
SELECT * FROM public.dataset_json
SELECT * FROM public.distance
SELECT * FROM public.ordination
SELECT * FROM public.project


DROP TABLE public.ordination;
DROP TABLE public.distance;
DROP TABLE public.dataset;
DROP TABLE public.project;
DROP TABLE public.app_user;
