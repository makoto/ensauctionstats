# ENS short name auction stats

Please read this [blog post](https://medium.com/the-ethereum-name-service/the-most-popular-eth-names-in-the-ens-short-name-auction-5ee13bb0eace) for more detail.

## Data sources

The original data is take from the followings

- [Popular boys and girls names](https://data.world/uscensusbureau/frequently-occurring-surnames-from-the-census-2000)
- [Popular last names](https://github.com/hadley/data-baby-names)
- [Popular website](https://moz.com/top500)

The parsed data are here in the following locations.

```
$tree dataset/
dataset/
├── bids.txt
├── boys.csv
├── girls.csv
├── last.csv
└── web.csv
```

All the csv data follows the same convention so it should be relatively easy to add new datasets.

```
#rank   ,name
1       ,smith
10      ,wilson
100     ,fisher
```

The actual bidding info is in the `bids.txt` in the following format

```
brown.eth received 5 bids and sells for 0.18
milano.eth received 2 bids and sells for 0.03
tokyo.eth received 10 bids and sells for 0.05
```

## Running program

```
~/.../ens/ensauctionstats $ruby bids.rb 

## Total (3011)
bids	highest	name	___	highest	bids	name
18	0.18	invest		10.0	6	hawaii
15	1.5	crypto		8.0	6	suzuki
15	0.12	libra		5.0	3	osaka
14	1.2	casino		4.0	2	btc
14	0.21	insure		3.5	1	nft
14	0.42	coffee		3.3	1	oro
13	0.5	ether		3.3	1	tax
13	0.25	hotels		3.3	1	car
12	0.61	music		3.21	1	dao
12	0.21	games		3.2	1	god


## 4 chars (81)
bids	highest	name	___	highest	bids	name
9	1.6	love		2.5	1	bren
9	1.6	game		1.6	9	love
5	1.4	hodl		1.6	9	game
5	1.26	defi		1.5	4	porn
5	1.01	bank		1.5	1	ronb
4	1.5	porn		1.4	5	hodl
2	1.0	lend		1.37	1	dydx
2	1.0	nfts		1.26	5	defi
2	1.0	iota		1.01	1	phil
2	1.0	free		1.01	5	bank


## 3 chars (20)
bids	highest	name	___	highest	bids	name
2	4.0	btc		4.0	2	btc
1	3.5	nft		3.5	1	nft
1	3.3	oro		3.3	1	car
1	3.3	tax		3.3	1	oro
1	3.3	car		3.3	1	tax
1	3.21	dao		3.21	1	dao
1	3.2	tim		3.2	1	bnb
1	3.2	snx		3.2	1	usa
1	3.2	dkp		3.2	1	god
1	3.2	888		3.2	1	eos


## Male (189)
bids	highest	name	___	highest	bids	name
9	0.23	andrew		3.2	1	tim
8	0.08	joseph		2.0	3	daniel
8	0.14	israel		1.1	6	peter
8	0.04	alpha		1.01	1	phil
7	0.11	james		1.0	5	andres
7	0.15	robert		1.0	1	jose
6	0.05	jones		0.81	1	alex
6	0.03	green		0.8	1	jeff
6	0.04	clark		0.8	1	jack
6	0.03	lawyer		0.8	1	dave


## Female (111)
bids	highest	name	___	highest	bids	name
11	0.07	chanel		3.2	1	amy
7	0.05	summer		0.8	1	angel
7	0.07	london		0.8	1	sage
7	0.21	paris		0.8	1	lucy
5	0.06	india		0.6	4	sofia
5	0.04	grace		0.21	7	paris
5	0.03	megan		0.15	4	chloe
4	0.03	parker		0.12	2	sophie
4	0.06	april		0.1	1	hadley
4	0.05	maria		0.08	3	dylan


## Last name (149)
bids	highest	name	___	highest	bids	name
9	1.6	love		2.0	3	daniel
8	0.08	joseph		1.6	9	love
7	0.03	white		0.8	1	bell
7	0.11	james		0.8	1	cain
7	0.04	black		0.8	1	rich
6	0.03	chang		0.8	1	dean
6	0.05	jones		0.8	1	owen
6	0.06	gamble		0.3	3	chase
6	0.03	green		0.3	1	church
6	0.04	clark		0.25	1	smith


## web (35)
bids	highest	name	___	highest	bids	name
8	1.05	amazon		3.0	6	google
7	0.05	medium		1.05	8	amazon
7	0.04	cisco		0.8	1	mail
6	3.0	google		0.5	4	disney
6	0.25	yahoo		0.25	6	yahoo
6	0.05	orange		0.11	5	skype
6	0.04	office		0.11	4	nvidia
5	0.11	skype		0.1	4	airbnb
5	0.05	intel		0.06	2	github
5	0.04	adobe		0.05	6	orange
5	0.03	change		0.05	7	medium
4	0.03	house		0.05	5	intel
4	0.1	airbnb		0.05	2	nokia
4	0.03	target		0.04	6	office
4	0.04	oracle		0.04	2	gmail
4	0.5	disney		0.04	4	oracle
4	0.11	nvidia		0.04	5	adobe
3	0.03	metro		0.04	7	cisco
3	0.03	forbes		0.03	1	mirror
3	0.03	people		0.03	5	change
3	0.03	twitch		0.03	4	house
3	0.03	terra		0.03	4	target
3	0.03	unesco		0.03	3	metro
3	0.03	alexa		0.03	3	forbes
2	0.05	nokia		0.03	3	people
2	0.04	gmail		0.03	3	twitch
2	0.03	naver		0.03	3	terra
2	0.03	europa		0.03	3	unesco
2	0.03	sakura		0.03	3	alexa
2	0.06	github		0.03	2	naver
1	0.8	mail		0.03	2	europa
1	0.03	vimeo		0.03	2	sakura
1	0.03	webmd		0.03	1	vimeo
1	0.03	flickr		0.03	1	webmd
1	0.03	mirror		0.03	1	flickr
```

You can use [this site](https://senseful.github.io/text-table/) to format into nice ascii table format.