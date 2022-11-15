const fs = require('fs');

const states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry",
]

const locations = [
    'Ahmedabad', 'Vadodara', 'Samakhiali', 'Narayan Sarovar',
    'Bamanbore', 'Nagpur', 'Delhi', 'Chennai',
    'Chittaurgarh', 'Dahod', 'Sitarganj', 'Vijayawada',
    'Gangotri Dham', 'Lakhnadon', 'Gulganj', 'Chaibasa',
    'Sagartola', 'Bilaspur', 'Gwalior', 'Betul',
    'Sangrur', 'Ankhola', 'Pune', 'Dhule',
    'Bhiwandi', 'Nirmal', 'Machilipatnam', 'Panvel',
    'Cape Comorin', 'Malout', 'Askot', 'Jaipur',
    'Bareilly', 'Jhansi', 'Ranchi', 'Dholpur',
    'Uncha Nagla', 'Mirzapur', 'Mangawan', 'Thoothukudi',
    'Vikravandi', 'Manamadurai', 'Vellore', 'Tindivanam',
    'Krishnagiri', 'Ulundurpettai', 'Salem', 'Sonbarsa',
    'Chandwa', 'Dehri', 'Bihar/UP Border', 'Bihar Sharif',
    'Dumraon', 'Birpur', 'Bihpur', 'Pirpainti',
    'Choupa More', 'Myajlar', 'Rewari', 'Kothun',
    'Dhaulpur', 'Barmer', 'Beawar', 'Pathankot',
    'Kenchiya', 'Fatehpur', 'Palanpur', 'Tanot',
    'Prantij', 'Munabao', 'Jodhpur', 'Pokaran',
    'Manoharpur', 'Lalsot', 'Kotputli', 'Bathinda',
    'Ajmer', 'Bheem', 'Uniara', 'Cortalim',
    'Mormugao', 'Ponda', 'Vasco', 'Belgaum',
    'Panaji', 'Atari', 'Leh', 'Fazilka',
    'Mana', 'Hamirpur', 'Ghaghas', 'Pinjore',
    'Swarghat', 'Kharar', 'Shimla'
]

const highways = [
    [
        "NH",
        "1",
        "93.4",
        "Ahmedabad",
        "Gujarat",
        "Vadodara",
        "Gujarat",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,300x200.png?lang=en&domain=en.wikipedia.org&title=Ahmedabad%E2%80%93Vadodara+Expressway&revid=1117511725&groups=_8e471d3425e93247c29536f44e5b00d912ab8acd",
        "https://en.wikipedia.org/wiki/Ahmedabad%E2%80%93Vadodara_Expressway#/map/0"
    ],
    [
        "NH",
        "41",
        "290",
        "Samakhiali",
        "Gujarat",
        "Narayan Sarovar",
        "Gujarat",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+41+%28India%29&revid=1057449079&groups=_bae5b70fd670630c2ef770d7387682e71e239b14",
        "https://en.wikipedia.org/wiki/National_Highway_41_(India)#/map/0"
    ],
    [
        "NH",
        "47",
        "1006",
        "Bamanbore",
        "Gujarat",
        "Nagpur",
        "Maharashtra",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x220.png?lang=en&domain=en.wikipedia.org&title=National+Highway+47+%28India%29&revid=1119961390&groups=_a5e867cd99561ec8df439b19a52c55bd5986e284",
        "https://en.wikipedia.org/wiki/National_Highway_47_(India)#/map/0"
    ],
    [
        "NH",
        "48",
        "2807",
        "Delhi",
        "Delhi",
        "Chennai",
        "Tamil Nadu",
        "https://maps.wikimedia.org/img/osm-intl,4,20.2,76.38,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+48+%28India%29&revid=1119963819&groups=_a369f39d911e4de7db9da0507eb7c5c482147320",
        "https://en.wikipedia.org/wiki/National_Highway_48_(India)#/map/0"
    ],
    [
        "NH",
        "56",
        "310",
        "Chittaurgarh",
        "Rajasthan",
        "Dahod",
        "Gujarat",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+56+%28India%29&revid=1119968170&groups=_74903c15020f1e1e69426777c9b146414de7e1c5",
        "https://en.wikipedia.org/wiki/National_Highway_56_(India)#/map/0"
    ],
    [
        "NH",
        "30",
        "1984.3",
        "Sitarganj",
        "Uttarakhand",
        "Vijayawada",
        "Andhra Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+30+%28India%29&revid=1119957742&groups=_2ca37f3db07ee760ab2238af827017f76c7f204a",
        "https://en.wikipedia.org/wiki/National_Highway_30_(India)#/map/0"
    ],
    [
        "NH",
        "34",
        "1426",
        "Gangotri Dham ",
        "Uttarakhand",
        " Lakhnadon",
        "Madhya Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,5,26.89,78.88,300x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+34+%28India%29&revid=1119999207&groups=_d2d28229441593a465b9bcaec0064c764132fbb6",
        "https://en.wikipedia.org/wiki/National_Highway_34_(India)#/map/0"
    ],
    [
        "NH",
        "43",
        "1062.5",
        "Gulganj",
        "Madhya Pradesh",
        " Chaibasa",
        "Jharkhand",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+43+%28India%29&revid=1119961216&groups=_a3cbd05c7950815c67365b233073271188b43585",
        "https://en.wikipedia.org/wiki/National_Highway_43_(India)#/map/0"
    ],
    [
        "NH",
        "45",
        "593.5",
        "Sagartola",
        "Madhya Pradesh",
        "Bilaspur",
        "Chhattisgarh",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x200.png?lang=en&domain=en.wikipedia.org&title=National+Highway+45+%28India%29&revid=1119961288&groups=_fd9b0e1f2c136179a09e2a0fde8992b424a98baa",
        "https://en.wikipedia.org/wiki/National_Highway_45_(India)#/map/0"
    ],
    [
        "NH",
        "46",
        "634",
        "Gwalior",
        "Madhya Pradesh",
        "Betul",
        "Madhya Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+46+%28India%29&revid=1073173756&groups=_9e3f4108697e32128e4ec57d869c7148f468d3c4",
        "https://en.wikipedia.org/wiki/National_Highway_46_(India)#/map/0"
    ],
    [
        "NH",
        "52",
        "2314",
        "Sangrur",
        "Punjab",
        "Ankhola",
        "Karnataka",
        "https://maps.wikimedia.org/img/osm-intl,5,a,a,290x400.png?lang=en&domain=en.wikipedia.org&title=National+Highway+52+%28India%29&revid=1117326068&groups=_1d29049d78fe585fb607e5cd09c3f3a689724e9b",
        "https://en.wikipedia.org/wiki/National_Highway_52_(India)#/map/0"
    ],
    [
        "NH",
        "60",
        "360.6",
        "Pune",
        "Maharashtra",
        "Dhule",
        "Maharashtra",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+60+%28India%29&revid=1076159463&groups=_5e068bedfd7731c55de293305bfc25070ca926aa",
        "https://en.wikipedia.org/wiki/National_Highway_60_(India)#/map/0"
    ],
    [
        "NH",
        "61",
        "758",
        "Bhiwandi",
        "Maharashtra",
        "Nirmal",
        "Telangana",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x230.png?lang=en&domain=en.wikipedia.org&title=National+Highway+61+%28India%29&revid=1119968906&groups=_e6c608dbf3dd49ec7a7b6673b1f2d29f6e455339",
        "https://en.wikipedia.org/wiki/National_Highway_61_(India)#/map/0"
    ],
    [
        "NH",
        "65",
        "926",
        "Pune",
        "Maharashtra",
        "Machilipatnam",
        "Andhra Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,5,17.44,77.42,300x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+65+%28India%29&revid=1100677425&groups=_43f20ec9eb5ef09546a9eddfbf5b999e6b4b2ac9",
        "https://en.wikipedia.org/wiki/National_Highway_65_(India)#/map/0"
    ],
    [
        "NH",
        "66",
        "1640",
        "Panvel",
        "Maharashtra",
        "Cape Comorin",
        "Tamil Nadu",
        "https://maps.wikimedia.org/img/osm-intl,5,13.574,75.35222,300x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+66+%28India%29&revid=1120535074&groups=_8f8cfe05971afe01f450be0365eb81916ce41351",
        "https://en.wikipedia.org/wiki/National_Highway_66_(India)#/map/0"
    ],
    [
        "NH",
        "9",
        "811",
        "Malout",
        "Punjab",
        "Askot",
        "Uttarakhand",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+9+%28India%29&revid=1119955406&groups=_efce2f940fc7d4edb3fcc55ea5820aa362a7f9f1",
        "https://en.wikipedia.org/wiki/National_Highway_9_(India)#/map/0"
    ],
    [
        "NH",
        "21",
        "465",
        "Jaipur",
        "Rajasthan",
        "Bareilly",
        "Uttar Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x180.png?lang=en&domain=en.wikipedia.org&title=National+Highway+21+%28India%29&revid=1119957435&groups=_bfb9f7d1b44e23c5e1294d071c13245e2a2d0dfa",
        "https://en.wikipedia.org/wiki/National_Highway_21_(India)#/map/0"
    ],
    [
        "NH",
        "39",
        "869",
        "Jhansi",
        "Uttar Pradesh",
        "Ranchi",
        "Jharkhand",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+39+%28India%29&revid=1119960433&groups=_e09d105dac616caadd4c31062add0576c9e4755e",
        "https://en.wikipedia.org/wiki/National_Highway_39_(India)#/map/0"
    ],
    [
        "NH",
        "123",
        "74",
        "Dholpur",
        "Rajasthan",
        "Uncha Nagla",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+123+%28India%29&revid=1120016440&groups=_c4d66096f8562c0ceffb716204d9fdd73d38c496",
        "https://en.wikipedia.org/wiki/National_Highway_123_(India)#/map/0"
    ],
    [
        "NH",
        "135",
        "130",
        "Mirzapur",
        "Uttar Pradesh ",
        "Mangawan",
        "Madhya Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+135+%28India%29&revid=1120062405&groups=_03634c3c0e4bcb4d716bd0afbe32d2f414cdf01c",
        "https://en.wikipedia.org/wiki/National_Highway_135_(India)#/map/0"
    ],
    [
        "NH",
        "32",
        "657",
        "Chennai",
        "Tamil Nadu",
        "Thoothukudi",
        "Tamil Nadu",
        "https://maps.wikimedia.org/img/osm-intl,6,10.95,79.168,300x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+32+%28India%29&revid=1119953361&groups=_da6e70d4b43faf80cb29f6c5951c5f28c763896e",
        "https://en.wikipedia.org/wiki/National_Highway_32_(India)#/map/0"
    ],
    [
        "NH",
        "36",
        "334",
        "Vikravandi",
        "Tamil Nadu",
        "Manamadurai",
        "Tamil Nadu",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+36+%28India%29&revid=1082964104&groups=_0e6c9cf488269437ac24d479b294f24ad42cdea3",
        "https://en.wikipedia.org/wiki/National_Highway_36_(India)#/map/0"
    ],
    [
        "NH",
        "38",
        "604",
        "Vellore",
        "Tamil Nadu",
        "Thoothukudi",
        "Tamil Nadu",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+38+%28India%29&revid=1073320950&groups=_44520af6b4e59a6ab837394148bb16574e1bbba7",
        "https://en.wikipedia.org/wiki/National_Highway_38_(India)#/map/0"
    ],
    [
        "NH",
        "77",
        "177",
        "Tindivanam",
        "Tamil Nadu",
        "Krishnagiri",
        "Tamil Nadu",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x200.png?lang=en&domain=en.wikipedia.org&title=National+Highway+77+%28India%29&revid=1083886866&groups=_633d7d675d87ea9e870f9f4278cbe0d919b5b8f4",
        "https://en.wikipedia.org/wiki/National_Highway_77_(India)#/map/0"
    ],
    [
        "NH",
        "79",
        "134.2",
        "Ulundurpettai",
        "Tamil Nadu",
        "Salem",
        "Tamil Nadu",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x200.png?lang=en&domain=en.wikipedia.org&title=National+Highway+79+%28India%29&revid=1103082536&groups=_86d6d7ca837d15eb2b22cd4a7bf3a919b69ec9a0",
        "https://en.wikipedia.org/wiki/National_Highway_79_(India)#/map/0"
    ],
    [
        "NH",
        "22",
        "416",
        "Sonbarsa",
        "Bihar",
        "Chandwa",
        "Jharkhand",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+22+%28India%29&revid=1111798388&groups=_7a0822168f314d46b801d473bc2a5c464157c15c",
        "https://en.wikipedia.org/wiki/National_Highway_22_(India)#/map/0"
    ],
    [
        "NH",
        "119",
        "93",
        "Dehri",
        "Bihar",
        "Bihar/UP Border",
        "Bihar",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+119+%28India%29&revid=1082919322&groups=_fa73bd39f65cf1ff65825da6724b9951fa87bc6e",
        "https://en.wikipedia.org/wiki/National_Highway_119_(India)#/map/0"
    ],
    [
        "NH",
        "120",
        "92",
        "Bihar Sharif",
        "Bihar",
        "Dumraon",
        "Bihar",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+120+%28India%29&revid=1120013687&groups=_c67bb028cb90d1c30201b96e5769844bf990ec6f",
        "https://en.wikipedia.org/wiki/National_Highway_120_(India)#/map/0"
    ],
    [
        "NH",
        "131",
        "132",
        "Birpur",
        "Bihar",
        "Bihpur",
        "Bihar",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+131+%28India%29&revid=1120054304&groups=_b4e0dbc30652b0fad74e0f006c61310869f18df7",
        "https://en.wikipedia.org/wiki/National_Highway_131_(India)#/map/0"
    ],
    [
        "NH",
        "133",
        "134",
        "Pirpainti",
        "Bihar",
        "Choupa More",
        "Jharkhand",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+133+%28India%29&revid=1120057101&groups=_47ac0e5feef8defa9970d8e374a6f344a1663987",
        "https://en.wikipedia.org/wiki/National_Highway_133_(India)#/map/0"
    ],
    [
        "NH",
        "11",
        "848",
        "Myajlar",
        "Rajasthan",
        "Rewari",
        "Haryana",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+11+%28India%29&revid=1114699682&groups=_a81972eab728979d88871c2af51c43f8f309d543",
        "https://en.wikipedia.org/wiki/National_Highway_11_(India)#/map/0"
    ],
    [
        "NH",
        "23",
        "228",
        "Kothun",
        "Rajasthan",
        "Dhaulpur",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x200.png?lang=en&domain=en.wikipedia.org&title=National+Highway+23+%28India%29&revid=1079717754&groups=_52d019cd0e3628a7cea35c55f4efb4f62483f6ac",
        "https://en.wikipedia.org/wiki/National_Highway_23_(India)#/map/0"
    ],
    [
        "NH",
        "25",
        "483",
        "Barmer",
        "Rajasthan",
        "Beawar",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+25+%28India%29&revid=1119956916&groups=_00453834a7e74c5557ecf9e8235ad4e456966571",
        "https://en.wikipedia.org/wiki/National_Highway_25_(India)#/map/0"
    ],
    [
        "NH",
        "54",
        "546",
        "Pathankot",
        "Punjab",
        "Kenchiya",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,7,31,75,290x290.png?lang=en&domain=en.wikipedia.org&title=National+Highway+54+%28India%29&revid=1119967495&groups=_8dda6a8ce24a9dea8e8bf8c135f00efa39395b97",
        "https://en.wikipedia.org/wiki/National_Highway_54_(India)#/map/0"
    ],
    [
        "NH",
        "58",
        "679",
        "Fatehpur",
        "Rajasthan",
        "Palanpur",
        "Gujarat",
        "https://maps.wikimedia.org/img/osm-intl,6,25.8,74.33,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+58+%28India%29&revid=1119968544&groups=_41440b5f8fa4144ca40dcac01d21e5148117988f",
        "https://en.wikipedia.org/wiki/National_Highway_58_(India)#/map/0"
    ],
    [
        "NH",
        "68",
        "689.88",
        "Tanot",
        "Rajasthan",
        "Prantij",
        "Gujarat",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+68+%28India%29&revid=1119969369&groups=_dc703dfbf428932fd16ed79be53db872b7d56872",
        "https://en.wikipedia.org/wiki/National_Highway_68_(India)#/map/0"
    ],
    [
        "NH",
        "70",
        "323",
        "Munabao",
        "Rajasthan",
        "Tanot",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+70+%28India%29&revid=1082970427&groups=_5d1a4ef87d4126997f5d3b4afcadfc37bca3f75f",
        "https://en.wikipedia.org/wiki/National_Highway_70_(India)#/map/0"
    ],
    [
        "NH",
        "125",
        "177",
        "Jodhpur",
        "Rajasthan",
        "Pokaran",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+125+%28India%29&revid=1120018273&groups=_ff73ed2951703aab917f35e3c8d6cfaeb2e25187",
        "https://en.wikipedia.org/wiki/National_Highway_125_(India)#/map/0"
    ],
    [
        "NH",
        "148",
        "105",
        "Manoharpur",
        "Rajasthan",
        "Lalsot",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,8,26.92,76.15,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+148+%28India%29&revid=1082958373&groups=_332574aa09d3affb8613b5af5b0d429c2541560a",
        "https://en.wikipedia.org/wiki/National_Highway_148_(India)#/map/0"
    ],
    [
        "NH",
        "148B",
        "425",
        "Kotputli",
        "Rajasthan",
        "Bathinda",
        "Punjab",
        "https://maps.wikimedia.org/img/osm-intl,7,29.04,76.1,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+148B+%28India%29&revid=1120316744&groups=_7b95a7358ee904adf46c69f6a398234e916d8b94",
        "https://en.wikipedia.org/wiki/National_Highway_148B_(India)#/map/0"
    ],
    [
        "NH",
        "148C",
        "150",
        "Jaipur",
        "Rajasthan",
        "Ajmer",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,9,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=Ring+Road%2C+Jaipur&revid=1063540362&groups=_612e9a0d1392605deff084a8ffece7c281dafa89",
        "https://en.wikipedia.org/wiki/Ring_Road,_Jaipur#/map/0"
    ],
    [
        "NH",
        "148D",
        "256",
        "Bheem",
        "Rajasthan",
        "Uniara",
        "Rajasthan",
        "https://maps.wikimedia.org/img/osm-intl,7,25.67,75.15,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+148D+%28India%29&revid=1057444497&groups=_62e29c633197ef1b13d1238b8ea3911c248d6c60",
        "https://en.wikipedia.org/wiki/National_Highway_148D_(India)#/map/0"
    ],
    [
        "NH",
        "366",
        "10",
        "Cortalim",
        "Goa",
        "Mormugao",
        "Goa",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+366+%28India%29&revid=1120521505&groups=_fb29123640b012ec1439bbdbd50a4827d3679e28",
        "https://en.wikipedia.org/wiki/National_Highway_366_(India)#/map/0"
    ],
    [
        "NH",
        "566",
        "12.2",
        "Ponda",
        "Goa",
        "Vasco",
        "Goa",
        "https://maps.wikimedia.org/img/osm-intl,10,a,a,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+566+%28India%29&revid=1120521530&groups=_261db22ac52b86324aa5445f8c1eb37aca0d7adc",
        "https://en.wikipedia.org/wiki/National_Highway_566_(India)#/map/0"
    ],
    [
        "NH",
        "748",
        "160",
        "Belgaum",
        "Karnataka",
        "Panaji",
        "Goa",
        "https://maps.wikimedia.org/img/osm-intl,9,15.62,74.18,300x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+748+%28India%29&revid=1087421936&groups=_526253570f175c749267d466d116b149b8abb862",
        "https://en.wikipedia.org/wiki/National_Highway_748_(India)#/map/0"
    ],
    [
        "NH",
        "3",
        "556",
        "Atari",
        "Punjab",
        "Leh",
        "Jammu and Kashmir",
        "https://maps.wikimedia.org/img/osm-intl,6,32,76,300x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+3+%28India%29&revid=1119954531&groups=_16291ab4853021a1195bdf7aa2f0258913552e62",
        "https://en.wikipedia.org/wiki/National_Highway_3_(India)#/map/0"
    ],
    [
        "NH",
        "7",
        "845",
        "Fazilka",
        "Punjab",
        "Mana",
        "Uttarakhand",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x240.png?lang=en&domain=en.wikipedia.org&title=National+Highway+7+%28India%29&revid=1119955321&groups=_aeeb8a61f6f76afdd3b93c246e6f0e1106d80b5c",
        "https://en.wikipedia.org/wiki/National_Highway_7_(India)#/map/0"
    ],
    [
        "NH",
        "103",
        "76",
        "Hamirpur",
        "Himachal Pradesh",
        "Ghaghas",
        "Himachal Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,a,a,a,290x320.png?lang=en&domain=en.wikipedia.org&title=National+Highway+103+%28India%29&revid=1119981537&groups=_b356d6e3210a0f368e814dbde3b096b6e905cd9e",
        "https://en.wikipedia.org/wiki/National_Highway_103_(India)#/map/0"
    ],
    [
        "NH",
        "105",
        "67",
        "Pinjore",
        "Haryana",
        "Swarghat",
        "Himachal Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,9,31,76.85,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+105+%28India%29&revid=1082958195&groups=_c28f90384f506454805bd35f060baf6ed093dacb",
        "https://en.wikipedia.org/wiki/National_Highway_105_(India)#/map/0"
    ],
    [
        "NH",
        "205",
        "183",
        "Kharar",
        "Chandigarh",
        "Shimla",
        "Himachal Pradesh",
        "https://maps.wikimedia.org/img/osm-intl,9,31,76.83,290x300.png?lang=en&domain=en.wikipedia.org&title=National+Highway+205+%28India%29&revid=1119982047&groups=_ab3497ed09b0f35490bf142eab96f90de706f6ac",
        "https://en.wikipedia.org/wiki/National_Highway_205_(India)#/map/0"
    ]
]

const mapLocationsToStates = () => {
    const locations = new Set();
    const locations_states = []
    let cnt = 0;
    highways.forEach((highway) => {
        const idx_s1 = states.indexOf(highway[4].trim());
        if (idx_s1 !== -1) {
            if (!locations.has(highway[3].trim())) locations_states.push(idx_s1 + 1);
            locations.add(highway[3].trim());
        }
        else {
            cnt++;
            console.log(highway[3].trim(), highway[4].trim());
        }
        const idx_s2 = states.indexOf(highway[6].trim());
        if (idx_s2 !== -1) {
            if (!locations.has(highway[5].trim())) locations_states.push(idx_s2 + 1);
            locations.add(highway[5].trim());
        }
        else {
            cnt++;
            console.log(highway[5].trim(), highway[6].trim());
        }
    });
    // set to array
    const locations_arr = Array.from(locations);
    // join array by new line
    const locations_str = locations_arr.join('\n');
    const locations_states_str = locations_states.join('\n');
    return cnt;
}

const mapHighwaysToLocationsAndStates = () => {
    const cnt = mapLocationsToStates();
    console.log(cnt);
    if(cnt !== 0) return;
    const start_location_id = [];
    const end_location_id = [];
    const state_highway_state_id = []
    const state_highway_highway_id = []
    for(let i = 0; i < highways.length; i++) {
        const highway = highways[i];
        start_location_id.push(locations.indexOf(highway[3].trim()) + 1);
        end_location_id.push(locations.indexOf(highway[5].trim()) + 1);
        const idx_s1 = states.indexOf(highway[4].trim());
        const idx_s2 = states.indexOf(highway[6].trim());
        if(idx_s1 == idx_s2){
            state_highway_state_id.push(idx_s1 + 1);
            state_highway_highway_id.push(i + 1);
        }
        else {
            state_highway_state_id.push(idx_s1 + 1);
            state_highway_highway_id.push(i + 1);
            state_highway_state_id.push(idx_s2 + 1);
            state_highway_highway_id.push(i + 1);
        }
    }
    const start_location_id_str = start_location_id.join('\n');
    const end_location_id_str = end_location_id.join('\n');
    const state_highway_state_id_str = state_highway_state_id.join('\n');
    const state_highway_highway_id_str = state_highway_highway_id.join('\n');
    console.log(state_highway_highway_id_str);
}