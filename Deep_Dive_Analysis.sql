-- Winning candidate details for a specific constituency

SELECT
    cr.winning_candidate,
    pr.party,
    pr.party_alliance,
    cr.total_votes,
    cr.margin,
    s.state,
    cr.constituency_name
FROM
    constituencywise_results as cr
INNER JOIN
    partywise_results AS pr ON cr.party_id = pr.party_id
INNER JOIN
    statewise_results AS sr ON cr.parliament_constituency = sr.parliament_constituency
INNER JOIN
    states AS s ON sr.state_id = s.state_id
WHERE
    cr.constituency_name = 'KOLLAM'
    -- pr.party_alliance = 'NDA'
    -- s.state = 'Tamil Nadu'
ORDER BY
    total_votes DESC;

-- Output:
/*
[
  {
    "winning_candidate": "N K PREMACHANDRAN",
    "party": "Revolutionary Socialist Party - RSP",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 443628,
    "margin": 150302,
    "state": "Kerala",
    "constituency_name": "KOLLAM"
  }
]
*/


-- Winning candidate details for a specific state

SELECT
    cr.winning_candidate,
    pr.party,
    pr.party_alliance,
    cr.total_votes,
    cr.margin,
    s.state,
    cr.constituency_name
FROM
    constituencywise_results as cr
INNER JOIN
    partywise_results AS pr ON cr.party_id = pr.party_id
INNER JOIN
    statewise_results AS sr ON cr.parliament_constituency = sr.parliament_constituency
INNER JOIN
    states AS s ON sr.state_id = s.state_id
WHERE
    -- cr.constituency_name = 'KOLLAM'
    -- pr.party_alliance = 'NDA'
    s.state = 'Tamil Nadu'
ORDER BY
    total_votes DESC;

/*

Sample Ouput:

[
  {
    "winning_candidate": "Sasikanth Senthil",
    "party": "Indian National Congress - INC",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 796956,
    "margin": 572155,
    "state": "Tamil Nadu",
    "constituency_name": "TIRUVALLUR"
  },
  {
    "winning_candidate": "T R BAALU",
    "party": "Dravida Munnetra Kazhagam - DMK",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 758611,
    "margin": 487029,
    "state": "Tamil Nadu",
    "constituency_name": "SRIPERUMBUDUR"
  },
  {
    "winning_candidate": "SACHITHANANTHAM R",
    "party": "Communist Party of India  (Marxist) - CPI(M)",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 670149,
    "margin": 443821,
    "state": "Tamil Nadu",
    "constituency_name": "DINDIGUL"
  },
  {
    "winning_candidate": "ARUN NEHRU",
    "party": "Dravida Munnetra Kazhagam - DMK",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 603209,
    "margin": 389107,
    "state": "Tamil Nadu",
    "constituency_name": "PERAMBALUR"
  },
  {
    "winning_candidate": "SELVAM. G",
    "party": "Dravida Munnetra Kazhagam - DMK",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 586044,
    "margin": 221473,
    "state": "Tamil Nadu",
    "constituency_name": "KANCHEEPURAM"
  },
  {
    "winning_candidate": "THANGA TAMILSELVAN",
    "party": "Dravida Munnetra Kazhagam - DMK",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 571493,
    "margin": 278825,
    "state": "Tamil Nadu",
    "constituency_name": "THENI"
  },
  {
    "winning_candidate": "DM KATHIR ANAND",
    "party": "Dravida Munnetra Kazhagam - DMK",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 568692,
    "margin": 215702,
    "state": "Tamil Nadu",
    "constituency_name": "VELLORE"
  },
  {
    "winning_candidate": "GANAPATHY RAJKUMAR P",
    "party": "Dravida Munnetra Kazhagam - DMK",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 568200,
    "margin": 118068,
    "state": "Tamil Nadu",
    "constituency_name": "COIMBATORE"
  },
  {
    "winning_candidate": "SELVAGANAPATHI T M",
    "party": "Dravida Munnetra Kazhagam - DMK",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 566085,
    "margin": 70357,
    "state": "Tamil Nadu",
    "constituency_name": "SALEM"
  },
  {
    "winning_candidate": "S JAGATHRATCHAKAN",
    "party": "Dravida Munnetra Kazhagam - DMK",
    "party_alliance": "I.N.D.I.A",
    "total_votes": 563216,
    "margin": 306559,
    "state": "Tamil Nadu",
    "constituency_name": "ARAKKONAM"
  }
]
*/


-- Distribution of evm votes versus postal votes for candidates in a specific constituency

SELECT 
    cd.candidate,
    cr.constituency_name,
    cd.evm_votes,
    cd.postal_votes
FROM 
    constituencywise_details AS cd
INNER JOIN
    constituencywise_results AS cr on cd.const_id = cr.const_id
WHERE 
    cr.constituency_name = 'AMETHI'
ORDER BY
    evm_votes DESC;

/*
Sample Output:

[
  {
    "candidate": "KISHORI LAL",
    "constituency_name": "AMETHI",
    "evm_votes": 536680,
    "postal_votes": 2548
  },
  {
    "candidate": "SMRITI IRANI",
    "constituency_name": "AMETHI",
    "evm_votes": 370754,
    "postal_votes": 1278
  },
  {
    "candidate": "NANHE SINGH CHAUHAN",
    "constituency_name": "AMETHI",
    "evm_votes": 34418,
    "postal_votes": 116
  },
  {
    "candidate": "NOTA",
    "constituency_name": "AMETHI",
    "evm_votes": 9371,
    "postal_votes": 12
  },
  {
    "candidate": "SURENDRA KUMAR",
    "constituency_name": "AMETHI",
    "evm_votes": 5699,
    "postal_votes": 0
  }
]
*/


--  Parties that won the most seats in a state

SELECT
    pr.party,
    count(cr.const_id) AS Total_Votes
FROM
    constituencywise_results AS cr
INNER JOIN
    partywise_results AS pr ON pr.party_id = cr.party_id
INNER JOIN
    statewise_results AS sr on sr.parliament_constituency = cr.parliament_constituency
INNER JOIN
    states as s on s.state_id = sr.state_id
WHERE s.state = 'Uttar Pradesh'
GROUP BY 
    pr.party
ORDER BY
    Total_Votes DESC;


/*

Output:
[
  {
    "party": "Samajwadi Party - SP",
    "total_votes": "37"
  },
  {
    "party": "Bharatiya Janata Party - BJP",
    "total_votes": "33"
  },
  {
    "party": "Indian National Congress - INC",
    "total_votes": "6"
  },
  {
    "party": "Rashtriya Lok Dal - RLD",
    "total_votes": "2"
  },
  {
    "party": "Aazad Samaj Party (Kanshi Ram) - ASPKR",
    "total_votes": "1"
  },
  {
    "party": "Apna Dal (Soneylal) - ADAL",
    "total_votes": "1"
  }
]
*/


-- Total number of seats won by each party alliance in each state

SELECT DISTINCT
    cd.candidate AS Candidate_Name,
    cr.constituency_name AS Constituency,
    MAX(cd.evm_votes) AS Highest_EVM_Votes
FROM 
    constituencywise_results AS cr
INNER JOIN
    constituencywise_details AS cd ON cd.const_id = cr.const_id
GROUP BY
    cd.candidate, cr.constituency_name
ORDER BY
    Highest_EVM_Votes DESC
LIMIT 10; -- for top 10 highest EVM votes

/*
[
  {
    "candidate": "RAKIBUL HUSSAIN",
    "constituency_name": "DHUBRI",
    "highest_evm_votes": 1468549
  },
  {
    "candidate": "SHANKAR LALWANI",
    "constituency_name": "INDORE",
    "highest_evm_votes": 1223746
  },
  {
    "candidate": "SHIVRAJ SINGH CHOUHAN",
    "constituency_name": "VIDISHA",
    "highest_evm_votes": 1111556
  },
  {
    "candidate": "DR C N MANJUNATH",
    "constituency_name": "BANGALORERURAL",
    "highest_evm_votes": 1075553
  },
  {
    "candidate": "BRIJMOHAN AGRAWAL",
    "constituency_name": "RAIPUR",
    "highest_evm_votes": 1047447
  },
  {
    "candidate": "ABHISHEK BANERJEE",
    "constituency_name": "DIAMONDHARBOUR",
    "highest_evm_votes": 1043493
  },
  {
    "candidate": "C R PATIL",
    "constituency_name": "NAVSARI",
    "highest_evm_votes": 1023366
  },
  {
    "candidate": "AMIT SHAH",
    "constituency_name": "GANDHINAGAR",
    "highest_evm_votes": 999984
  },
  {
    "candidate": "SHOBHA KARANDLAJE",
    "constituency_name": "BANGALORENORTH",
    "highest_evm_votes": 982805
  },
  {
    "candidate": "EATALA RAJENDER",
    "constituency_name": "MALKAJGIRI",
    "highest_evm_votes": 980712
  }
]
*/

-- Alternate Code (for the same output):

/*
SELECT DISTINCT
    cd.candidate AS Candidate_Name,
    cr.constituency_name AS Constitutency_Name,
    cd.evm_votes AS Highest_EVM_Votes
FROM 
    constituencywise_results AS cr
INNER JOIN
    constituencywise_details AS cd ON cd.const_id = cr.const_id
WHERE
    cd.evm_votes = (
        SELECT MAX(cd1.evm_votes)
        FROM constituencywise_details cd1
        WHERE cd1.const_id = cd.const_id
    )
ORDER BY
    cd.evm_votes DESC
LIMIT 10;
*/


-- Top 10 Winner vs Runner-up candidates in each constituency for a specific state

WITH RankedCandidates AS (
    SELECT 
        cd.const_id,
        cd.candidate,
        cd.party,
        cd.evm_votes,
        cd.postal_votes,
        cd.evm_votes + cd.postal_votes AS Total_Votes,
        ROW_NUMBER() OVER (PARTITION BY cd.const_id ORDER BY cd.evm_votes + cd.postal_votes DESC) AS VoteRank
    FROM 
        constituencywise_details AS cd
    JOIN 
        constituencywise_results AS cr ON cd.const_id = cr.const_id
    JOIN 
        statewise_results AS sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
    JOIN 
        states AS s ON sr.state_id = s.state_id
    WHERE 
        s.state = 'Maharashtra'
)

SELECT 
    cr.constituency_name,
    cd.margin
    MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
    MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM 
    RankedCandidates AS rc
JOIN 
    constituencywise_results AS cr ON rc.const_id = cr.const_id
GROUP BY 
    cr.constituency_name
ORDER BY 
    cr.constituency_name;

-- Alternate Shorter Code:
SELECT
    cr.constituency_name,
    cr.winning_candidate,
    sr.trailing_candidate
FROM
    constituencywise_results AS cr
INNER JOIN
    statewise_results AS sr ON sr.parliament_constituency = cr.parliament_constituency
INNER JOIN
    states AS s ON s.state_id = sr.state_id
WHERE 
    s.state = 'Maharashtra'

-- Sample Output:

/*
[
  {
    "constituency": "MUMBAINORTH",
    "winning_candidate": "PIYUSH GOYAL",
    "runnerup_candidate": "BHUSHAN PATIL",
    "victory_margin": 357608
  },
  {
    "constituency": "OSMANABAD",
    "winning_candidate": "OMPRAKASH BHUPALSINH ALIAS PAVAN RAJENIMBALKAR",
    "runnerup_candidate": "ARCHANA RANAJAGJITSINH PATIL",
    "victory_margin": 329846
  },
  {
    "constituency": "RAVER",
    "winning_candidate": "KHADSE RAKSHA NIKHIL",
    "runnerup_candidate": "SHRIRAM DAYARAM PATIL",
    "victory_margin": 272183
  },
  {
    "constituency": "CHANDRAPUR",
    "winning_candidate": "DHANORKAR PRATIBHA SURESH ALIAS BALUBHAU",
    "runnerup_candidate": "MUNGANTIWAR SUDHIR SACCHIDANAND",
    "victory_margin": 260406
  },
  {
    "constituency": "JALGAON",
    "winning_candidate": "SMITA UDAY WAGH",
    "runnerup_candidate": "KARAN BALASAHEB PATIL - PAWAR",
    "victory_margin": 251594
  },
  {
    "constituency": "THANE",
    "winning_candidate": "NARESH GANPAT MHASKE",
    "runnerup_candidate": "RAJAN BABURAO VICHARE",
    "victory_margin": 217011
  },
  {
    "constituency": "KALYAN",
    "winning_candidate": "DR SHRIKANT EKNATH SHINDE",
    "runnerup_candidate": "VAISHALI DAREKAR - RANE",
    "victory_margin": 209144
  },
  {
    "constituency": "PALGHAR",
    "winning_candidate": "DR. HEMANT VISHNU SAVARA",
    "runnerup_candidate": "BHARTI BHARAT KAMDI",
    "victory_margin": 183306
  },
  {
    "constituency": "NASHIK",
    "winning_candidate": "RAJABHAU (PARAG) PRAKASH WAJE",
    "runnerup_candidate": "GODSE HEMANT TUKARAM",
    "victory_margin": 162001
  },
  {
    "constituency": "NANDURBAR",
    "winning_candidate": "ADV GOWAAL KAGADA PADAVI",
    "runnerup_candidate": "DR HEENA VIJAYKUMAR GAVIT",
    "victory_margin": 159120
  }
]
*/

/*
For a given state, list out the following:
        1. Total number of designated seats
        2. Total number of contesting candidates
        3. Total number of contesting parties
        4. Total number of EVM votes
        5. Total number of postal Votes
        6. Total number of overall votes
*/

WITH state_view AS
    (SELECT
        s.state,
        count(DISTINCT cr.const_id) AS Total_Seats,
        count(DISTINCT cd.candidate) AS Total_Candidates,
        count(DISTINCT pr.party) AS Total_Parties,
        sum(cd.evm_votes) AS Total_EVM_Votes,
        sum(cd.postal_votes) AS Total_Postal_Votes,
        sum(cd.evm_votes + cd.postal_votes) AS Total_Votes
    FROM 
        constituencywise_results AS cr
    INNER JOIN
        constituencywise_details AS cd ON cd.const_id = cr.const_id
    INNER JOIN
        statewise_results AS sr ON sr.parliament_constituency = cr.parliament_constituency
    INNER JOIN 
        states AS s ON s.state_id = sr.state_id

    INNER JOIN
        partywise_results AS pr ON pr.party_id = cr.party_id
    
    GROUP BY
        s.state
    )

SELECT
    sv.state,
    Total_Seats,
    Total_Candidates,
    Total_Parties,
    Total_EVM_Votes,
    Total_Postal_Votes,
    Total_Votes
FROM 
    state_view AS sv
WHERE 
    sv.state = 'Bihar'

-- Output:
/*
[
  {
    "state": "Bihar",
    "total_seats": "40",
    "total_candidates": "481",
    "total_parties": "8",
    "total_evm_votes": "43309971",
    "total_postal_votes": "138978",
    "total_votes": "43448949"
  }
]
*/

-- Table to verify statewise numbers:

SELECT
    s.state,
    count(DISTINCT cr.const_id) AS Total_Seats,
    count(DISTINCT cd.candidate) AS Total_Candidates,
    count(DISTINCT pr.party) AS Total_Parties,
    sum(cd.evm_votes) AS Total_EVM_Votes,
    sum(cd.postal_votes) AS Total_Postal_Votes,
    sum(cd.evm_votes + cd.postal_votes) AS Total_Votes
FROM 
    constituencywise_results AS cr
INNER JOIN
    statewise_results AS sr ON sr.parliament_constituency = cr.parliament_constituency
INNER JOIN
    states AS s ON s.state_id = sr.state_id
INNER JOIN
    constituencywise_details AS cd ON cd.const_id = cr.const_id
INNER JOIN
    partywise_results AS pr ON pr.party_id = cr.party_id
GROUP BY
    s.state
ORDER BY
    Total_Seats DESC;

/*

Output:
[
  {
    "state": "Uttar Pradesh",
    "total_seats": "80",
    "total_candidates": "825",
    "total_parties": "6",
    "total_evm_votes": "87675134",
    "total_postal_votes": "236508",
    "total_votes": "87911642"
  },
  {
    "state": "Maharashtra",
    "total_seats": "48",
    "total_candidates": "1114",
    "total_parties": "7",
    "total_evm_votes": "56969710",
    "total_postal_votes": "209423",
    "total_votes": "57179133"
  },
  {
    "state": "West Bengal",
    "total_seats": "42",
    "total_candidates": "502",
    "total_parties": "3",
    "total_evm_votes": "60235089",
    "total_postal_votes": "248598",
    "total_votes": "60483687"
  },
  {
    "state": "Bihar",
    "total_seats": "40",
    "total_candidates": "481",
    "total_parties": "8",
    "total_evm_votes": "43309971",
    "total_postal_votes": "138978",
    "total_votes": "43448949"
  },
  {
    "state": "Tamil Nadu",
    "total_seats": "39",
    "total_candidates": "934",
    "total_parties": "7",
    "total_evm_votes": "43409425",
    "total_postal_votes": "264623",
    "total_votes": "43674048"
  },
  {
    "state": "Madhya Pradesh",
    "total_seats": "29",
    "total_candidates": "363",
    "total_parties": "1",
    "total_evm_votes": "37838466",
    "total_postal_votes": "101785",
    "total_votes": "37940251"
  },
  {
    "state": "Karnataka",
    "total_seats": "28",
    "total_candidates": "473",
    "total_parties": "3",
    "total_evm_votes": "38643669",
    "total_postal_votes": "149948",
    "total_votes": "38793617"
  },
  {
    "state": "Gujarat",
    "total_seats": "26",
    "total_candidates": "266",
    "total_parties": "2",
    "total_evm_votes": "28839373",
    "total_postal_votes": "276226",
    "total_votes": "29115599"
  },
  {
    "state": "Rajasthan",
    "total_seats": "25",
    "total_candidates": "265",
    "total_parties": "5",
    "total_evm_votes": "32832464",
    "total_postal_votes": "332413",
    "total_votes": "33164877"
  },
  {
    "state": "Andhra Pradesh",
    "total_seats": "25",
    "total_candidates": "455",
    "total_parties": "4",
    "total_evm_votes": "33258505",
    "total_postal_votes": "470837",
    "total_votes": "33729342"
  }
]
*/