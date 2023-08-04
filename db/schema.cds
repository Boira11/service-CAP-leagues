namespace appLeagues;

 

using {managed} from '@sap/cds/common';


entity Leagues : managed {

   key idLeague : UUID @(Core.Computed : true);

       name: String(100)  @assert.unique;

       country: String(100);

       level: Integer;

       fundation: Date;

       president: String(100);

       teams: Association to many Teams on teams.league =$self;

       //matches: Association to many Matches on matches.league = $self;

    };

 

entity Teams : managed {

  key idTeam : UUID @(Core.Computed : true);

      name: String(100);

      city: String(100);

      stadium: String(100);

      fundation: Date;

      logo: String(255);

      color: String(50);

      sponsor: String(100);

      ranking: Integer;

      league: Association to Leagues;

      players: Association to many Players on players.team=$self;

      //homeMatches: Association to many Matches on homeMatches.localTeam = $self;

      //awayMatches: Association to many Matches on awayMatches.awayTeam = $self;

      //coach: Association to Coaches;

};
 

entity Players  : managed {

  key idPlayer : UUID @(Core.Computed : true);

      name: String(100);

      position: String(50);

      nationality: String(50);

      birthday: Date;

      dorsalNumber: Integer;

      height: Decimal(5, 2);

      weight: Decimal(5, 2);

      skillfulFoot: SkillfulFoot; // Derecho, izquierdo,ambos

      salary: Decimal(15, 2);

      clause: Decimal(15, 2);

      yearsContract: Integer;

      typeOfContract: String(50);

      previousTeams: String(255);

      team: Association to Teams

};

 

// entity Coaches : managed {

//     key idCoach: UUID @(Core.Computed : true);

//         name: String(100);

//         nacionality: String(100);

//         age: Integer;

//         team: Association to Teams; // Asociación uno a uno

//     };

 

// entity Matches : managed {

//     key idMatch: UUID @(Core.Computed : true);

//         idJourney: Integer;

//         date: DateTime;

//         localResult: Integer;

//         awayResult: Integer;

//         league: Association to Leagues;

//         localTeam: Association to Teams;

//         awayTeam: Association to Teams;

//     };

 

  type SkillfulFoot : String(10) enum {

        Right;

        Left;

        Both;

      };