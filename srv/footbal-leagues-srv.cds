using {appLeagues as rm} from '../db/schema';


/**

 * For serving end users

 */

service leagueService @(path : 'service/league') {

   entity Leagues as projection on rm.Leagues;

   entity Teams as projection on rm.Teams;

   entity Players as projection on rm.Players;

   //entity Coaches as projection on rm.Coaches;

  // entity Matches as projection on rm.Matches;

 }