ALTER TABLE constituencywise_details
RENAME COLUMN "S.N." TO s_no;

ALTER TABLE constituencywise_details
RENAME COLUMN "Candidate" TO candidate;

ALTER TABLE constituencywise_details
RENAME COLUMN "Party" TO party;

ALTER TABLE constituencywise_details
RENAME COLUMN "EVM Votes" TO evm_votes;

ALTER TABLE constituencywise_details
RENAME COLUMN "Postal Votes" TO postal_votes;

ALTER TABLE constituencywise_details
RENAME COLUMN "Total Votes" TO total_votes;

ALTER TABLE constituencywise_details
RENAME COLUMN "% of Votes" TO percentage_of_votes;

ALTER TABLE constituencywise_details
RENAME COLUMN "Constituency ID" TO const_id;


ALTER TABLE constituencywise_results
RENAME COLUMN "S.No" to s_no;

ALTER TABLE constituencywise_results
RENAME COLUMN "Parliament Constituency" to parliament_constituency;

ALTER TABLE constituencywise_results
RENAME COLUMN "Constituency Name" to constituency_name;

ALTER TABLE constituencywise_results
RENAME COLUMN "Winning Candidate" to winning_candidate;

ALTER TABLE constituencywise_results
RENAME COLUMN "Total Votes" to total_votes;

ALTER TABLE constituencywise_results
RENAME COLUMN "Margin" to margin;

ALTER TABLE constituencywise_results
RENAME COLUMN "Constituency ID" to const_id;

ALTER TABLE constituencywise_results
RENAME COLUMN "Party ID" to party_id;



ALTER TABLE partywise_results
RENAME COLUMN "Party" to party;

ALTER TABLE partywise_results
RENAME COLUMN "Won" to won;

ALTER TABLE partywise_results
RENAME COLUMN "Party ID" to party_id;



ALTER TABLE statewise_results
RENAME COLUMN "Constituency" to constituency;

ALTER TABLE statewise_results
RENAME COLUMN "Const. No." to const_no;

ALTER TABLE statewise_results
RENAME COLUMN "Parliament Constituency" to parliament_constituency;

ALTER TABLE statewise_results
RENAME COLUMN "Leading Candidate" to leading_candidate;

ALTER TABLE statewise_results
RENAME COLUMN "Trailing Candidate" to trailing_candidate;

ALTER TABLE statewise_results
RENAME COLUMN "Margin" to margin;

ALTER TABLE statewise_results
RENAME COLUMN "Status" to status;

ALTER TABLE statewise_results
RENAME COLUMN "State ID" to state_id;

ALTER TABLE statewise_results
RENAME COLUMN "State" to state;



ALTER TABLE states
RENAME COLUMN "State ID" to state_id;

ALTER TABLE states
RENAME COLUMN "State" to state;