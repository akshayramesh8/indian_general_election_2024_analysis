-- Total Seats in the General Election:

SELECT DISTINCT
    COUNT(parliament_constituency) AS Total_Seats
FROM
    constituencywise_results;

-- Total number of seats available for elections in each state:

SELECT
    s.state AS State_Name,
    count(cr.parliament_constituency) AS Total_Seats
FROM
    constituencywise_results AS cr
INNER JOIN
    statewise_results AS sr ON sr.parliament_constituency = cr.parliament_constituency
INNER JOIN
    States AS s ON s.state_id = sr.state_id
GROUP BY
    s.state
ORDER BY
    count(cr.parliament_constituency) DESC;

-- Ouput:
/*
[
  {
    "state_name": "Uttar Pradesh",
    "total_seats": "80"
  },
  {
    "state_name": "Maharashtra",
    "total_seats": "48"
  },
  {
    "state_name": "West Bengal",
    "total_seats": "42"
  },
  {
    "state_name": "Bihar",
    "total_seats": "40"
  },
  {
    "state_name": "Tamil Nadu",
    "total_seats": "39"
  },
  {
    "state_name": "Madhya Pradesh",
    "total_seats": "29"
  },
  {
    "state_name": "Karnataka",
    "total_seats": "28"
  },
  {
    "state_name": "Gujarat",
    "total_seats": "26"
  },
  {
    "state_name": "Rajasthan",
    "total_seats": "25"
  },
  {
    "state_name": "Andhra Pradesh",
    "total_seats": "25"
  },
  {
    "state_name": "Odisha",
    "total_seats": "21"
  },
  {
    "state_name": "Kerala",
    "total_seats": "20"
  },
  {
    "state_name": "Telangana",
    "total_seats": "17"
  },
  {
    "state_name": "Assam",
    "total_seats": "14"
  },
  {
    "state_name": "Jharkhand",
    "total_seats": "14"
  },
  {
    "state_name": "Punjab",
    "total_seats": "13"
  },
  {
    "state_name": "Chhattisgarh",
    "total_seats": "11"
  },
  {
    "state_name": "Haryana",
    "total_seats": "10"
  },
  {
    "state_name": "Delhi",
    "total_seats": "7"
  },
  {
    "state_name": "Uttarakhand",
    "total_seats": "5"
  },
  {
    "state_name": "Jammu and Kashmir",
    "total_seats": "5"
  },
  {
    "state_name": "Himachal Pradesh",
    "total_seats": "4"
  },
  {
    "state_name": "Manipur",
    "total_seats": "2"
  },
  {
    "state_name": "Tripura",
    "total_seats": "2"
  },
  {
    "state_name": "Dadra & Nagar Haveli and Daman & Diu",
    "total_seats": "2"
  },
  {
    "state_name": "Meghalaya",
    "total_seats": "2"
  },
  {
    "state_name": "Arunachal Pradesh",
    "total_seats": "2"
  },
  {
    "state_name": "Goa",
    "total_seats": "2"
  },
  {
    "state_name": "Chandigarh",
    "total_seats": "1"
  },
  {
    "state_name": "Lakshadweep",
    "total_seats": "1"
  },
  {
    "state_name": "Ladakh",
    "total_seats": "1"
  },
  {
    "state_name": "Sikkim",
    "total_seats": "1"
  },
  {
    "state_name": "Nagaland",
    "total_seats": "1"
  },
  {
    "state_name": "Puducherry",
    "total_seats": "1"
  },
  {
    "state_name": "Andaman & Nicobar Islands",
    "total_seats": "1"
  },
  {
    "state_name": "Mizoram",
    "total_seats": "1"
  }
]
*/


-- Total sum of seats won by the NDA:

SELECT
    SUM(
        CASE
            WHEN party IN (
                'Bharatiya Janata Party - BJP',
                'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS',
                'AJSU Party - AJSUP',
                --'Pattali Makkal Katchi',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'Nationalist Congress Party - NCP',
                --'Bharath Dharma Jana Sena',
                'Janata Dal  (Secular) - JD(S)',
                --'Tamil Maanila Congress (Moopanar)',
                --'Amma Makkal Munnetra Kazhagam',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Janasena Party - JnP',
                --'National People's Party',
                'Rashtriya Lok Dal - RLD',
                --'All Jharkhand Students Union',
                'Hindustani Awam Morcha (Secular) - HAMS',
                --'Naga Peoples Front',
                --'Nationalist Democratic Progressive Party',
                'Sikkim Krantikari Morcha - SKM'
                --'Rashtriya Lok Morcha',
                --'Rashtriya Samaj Paksha',
                --'Suheldev Bharatiya Samaj Party',
                --'United People''s Party, Liberal - UPPL',
                --'Independent - IND'
                ) THEN [won]
                ELSE 0
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results;


-- Total seats won by each NDA party:

SELECT 
    party,
    won AS Total_Seats
FROM 
    partywise_results 
WHERE
     party IN (
                'Bharatiya Janata Party - BJP',
                'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS',
                'AJSU Party - AJSUP',
                --'Pattali Makkal Katchi',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'Nationalist Congress Party - NCP',
                --'Bharath Dharma Jana Sena',
                'Janata Dal  (Secular) - JD(S)',
                --'Tamil Maanila Congress (Moopanar)',
                --'Amma Makkal Munnetra Kazhagam',
                'Apna Dal (Soneylal) - ADAL',
                'Asom Gana Parishad - AGP',
                'Janasena Party - JnP',
                --'National People's Party',
                'Rashtriya Lok Dal - RLD',
                --'All Jharkhand Students Union',
                'Hindustani Awam Morcha (Secular) - HAMS',
                --'Naga Peoples Front',
                --'Nationalist Democratic Progressive Party',
                'Sikkim Krantikari Morcha - SKM'
                --'Rashtriya Lok Morcha',
                --'Rashtriya Samaj Paksha',
                --'Suheldev Bharatiya Samaj Party',
                --'United People''s Party, Liberal - UPPL',
                --'Independent - IND'
                )
ORDER BY
    won DESC;

-- Output:
/*
[
  {
    "Party": "Bharatiya Janata Party - BJP",
    "total_seats": "240"
  },
  {
    "Party": "Telugu Desam - TDP",
    "total_seats": "16"
  },
  {
    "Party": "Janata Dal  (United) - JD(U)",
    "total_seats": "12"
  },
  {
    "Party": "Shiv Sena - SHS",
    "total_seats": "7"
  },
  {
    "Party": "Lok Janshakti Party(Ram Vilas) - LJPRV",
    "total_seats": "5"
  },
  {
    "Party": "Janasena Party - JnP",
    "total_seats": "2"
  },
  {
    "Party": "Janata Dal  (Secular) - JD(S)",
    "total_seats": "2"
  },
  {
    "Party": "Rashtriya Lok Dal - RLD",
    "total_seats": "2"
  },
  {
    "Party": "AJSU Party - AJSUP",
    "total_seats": "1"
  },
  {
    "Party": "Apna Dal (Soneylal) - ADAL",
    "total_seats": "1"
  },
  {
    "Party": "Asom Gana Parishad - AGP",
    "total_seats": "1"
  },
  {
    "Party": "Hindustani Awam Morcha (Secular) - HAMS",
    "total_seats": "1"
  },
  {
    "Party": "Nationalist Congress Party - NCP",
    "total_seats": "1"
  },
  {
    "Party": "Sikkim Krantikari Morcha - SKM",
    "total_seats": "1"
  }
]
*/

 
 -- Total seats won by I.N.D.I.A

 SELECT
    SUM(
        CASE
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN won
            ELSE 0
        END) AS I_N_D_I_A_Seats_Won
FROM 
  partywise_results;


-- Total seats won by each I.N.D.I.A party

SELECT
    party as Party_Name,
    won AS Total_Seats
FROM partywise_results
WHERE
    party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            )
ORDER BY
    Total_Seats DESC;


-- Categorization of party alliance

ALTER TABLE 
    partywise_results
ADD 
    party_alliance VARCHAR(50)


-- NDA Categorization

UPDATE 
    partywise_results
SET 
    party_alliance = 'NDA'
WHERE
    party IN (
            'Bharatiya Janata Party - BJP',
            'Telugu Desam - TDP',
            'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS',
            'AJSU Party - AJSUP',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Nationalist Congress Party - NCP',
            'Janata Dal  (Secular) - JD(S)',
            'Apna Dal (Soneylal) - ADAL',
            'Asom Gana Parishad - AGP',
            'Janasena Party - JnP',
            'Rashtriya Lok Dal - RLD',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Sikkim Krantikari Morcha - SKM'
        );


-- I.N.D.I.A Categorization

UPDATE 
    partywise_results
SET 
    party_alliance = 'I.N.D.I.A'
WHERE
    party IN (
            'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
        );


-- Other Categorization

UPDATE 
    partywise_results
SET 
    party_alliance = 'Other'
WHERE 
    party_alliance IS NULL;