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
bids name maxbid
4 henry.eth 5000000000000000000
1 gothi.eth 26000000000000000
```

## Running program

```
~/.../ens/ensauctionstats $ruby bids.rb 

## Total (3481)
bids	highest	name	___	highest	bids	name
17	0.174	invest		10.0	5	brown
15	1.5	crypto		10.0	2	milano
14	1.2	casino		10.0	6	hawaii
13	0.4	coffee		9.9	10	tokyo
12	0.11	libra		9.0	5	nguyen
12	0.315	ether		9.0	4	korea
12	0.608	music		9.0	6	orange
12	0.23	games		8.9	9	pizza
12	0.1	insure		8.0	6	suzuki
11	1.21275	china		8.0	3	marco


## 4 chars (114)
bids	highest	name	___	highest	bids	name
9	1.6	love		3.2	3	play
8	1.6	game		2.5	1	bren
5	1.4	hodl		1.6	8	game
5	1.0605	bank		1.6	9	love
5	1.26	defi		1.5	1	ronb
3	1.5	porn		1.5	3	porn
3	3.2	play		1.4	5	hodl
2	1.0	nfts		1.37	1	dydx
2	0.84	data		1.26	5	defi
2	1.0	lend		1.0605	5	bank


## 3 chars (23)
bids	highest	name	___	highest	bids	name
2	4.0	btc		4.0	2	btc
1	3.2	888		3.5	1	nft
1	3.2	amd		3.3	1	oro
1	3.2	eos		3.3	1	tax
1	3.2	dhl		3.21	1	dao
1	3.3	oro		3.2	1	ibm
1	3.2	ibm		3.2	1	rep
1	3.2	rep		3.2	1	snx
1	3.3	tax		3.2	1	usa
1	3.2	snx		3.2	1	god


## Male (195)
bids	highest	name	___	highest	bids	name
9	1.0	andrew		7.0	3	morris
8	0.136	israel		7.0	5	joshua
8	0.043	alpha		5.0	4	parker
8	0.08	joseph		5.0	4	henry
7	0.15	robert		5.0	4	young
7	1.0	james		5.0	6	jones
6	1.0	george		3.2	1	tim
6	0.5	chris		2.0	6	clark
6	0.0336	lawyer		2.0	3	daniel
6	0.05	steve		1.12	4	philip


## Female (117)
bids	highest	name	___	highest	bids	name
11	0.07	chanel		7.77	4	maria
7	1.0	summer		7.0	7	london
7	1.0	paris		5.0	4	parker
7	7.0	london		3.2	1	amy
5	0.04	grace		3.0	2	naomi
4	0.03	logan		1.2	3	kenya
4	0.0525	india		1.12	4	sofia
4	0.03	megan		1.0	3	harper
4	1.0	hannah		1.0	7	summer
4	0.037	armani		1.0	2	aisha


## Last name (160)
bids	highest	name	___	highest	bids	name
9	1.6	love		10.0	5	brown
8	0.08	joseph		9.0	5	nguyen
7	1.0	james		7.0	6	chang
6	1.0	george		7.0	3	morris
6	0.5	white		5.0	4	young
6	0.86	glass		5.0	4	henry
6	2.0	clark		5.0	4	parker
6	5.0	jones		5.0	6	jones
6	0.055	gamble		3.0	2	farmer
6	7.0	chang		2.0	3	daniel

## web (45)
bids	highest	name	___	highest	bids	name
8	1.05	amazon		9.0	6	orange
7	0.05	medium		4.0	2	sakura
7	0.041	cisco		3.2	1	ibm
6	0.25	yahoo		3.0	6	google
6	3.0	google		1.05	8	amazon
6	9.0	orange		0.8	1	nasa
5	0.0357	adobe		0.8	4	target
5	0.11	skype		0.8	1	espn
5	0.0336	change		0.8	1	time
5	0.051	intel		0.8	1	dell
5	0.042	office		0.8	1	mail
4	0.0336	house		0.6	4	disney
4	0.6	disney		0.25	6	yahoo
4	0.035	oracle		0.2	2	europa
4	0.11	nvidia		0.11	5	skype
4	0.8	target		0.11	4	nvidia
4	0.1	airbnb		0.1	4	airbnb
3	0.03	metro		0.08	3	alexa
3	0.02835	terra		0.06	2	github
3	0.04	twitch		0.051	5	intel
3	0.035	forbes		0.05	2	nokia
3	0.03	people		0.05	7	medium
3	0.02625	unesco		0.042	5	office
3	0.08	alexa		0.041	7	cisco
2	0.06	github		0.04	2	gmail
2	0.02625	naver		0.04	3	twitch
2	0.2	europa		0.0357	5	adobe
2	4.0	sakura		0.035	4	oracle
2	0.05	nokia		0.035	3	forbes
2	0.04	gmail		0.0336	4	house
1	0.0261	mirror		0.0336	5	change
1	0.8	espn		0.03	1	webmd
1	3.2	ibm		0.03	3	people
1	0.025	youku		0.03	1	vimeo
1	0.025	stuff		0.03	1	flickr
1	0.025	about		0.03	3	metro
1	0.03	flickr		0.02835	3	terra
1	0.8	time		0.02625	3	unesco
1	0.03	vimeo		0.02625	2	naver
1	0.8	dell		0.0261	1	mirror
1	0.8	mail		0.025	1	nature
1	0.03	webmd		0.025	1	quora
1	0.025	quora		0.025	1	about
1	0.025	nature		0.025	1	stuff
1	0.8	nasa		0.025	1	youku
```

You can use [this site](https://senseful.github.io/text-table/) to format into nice ascii table format.