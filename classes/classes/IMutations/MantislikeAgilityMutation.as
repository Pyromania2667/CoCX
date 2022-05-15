/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
    import classes.PerkClass;
    import classes.PerkType;
import classes.Player;

public class MantislikeAgilityMutation extends PerkType
    {
        //v1 contains the mutation tier
        override public function desc(params:PerkClass = null):String {
            var descS:String = "";
            var pTier:int = player.perkv1(IMutationsLib.MantislikeAgilityIM);
            if (pTier >= 1){
                descS += "Your agility is increased, and can be even further boosted if you have natural armour or thick skin.";
            }
            if (pTier >= 3){
                descS += ", (+30% max core spe as phantom spe)";
            }
            if (descS != "")descS += ".";
            return descS;
        }

        //Name. Need it say more?
        override public function name(params:PerkClass=null):String {
            var sufval:String;
            switch (player.perkv1(IMutationsLib.MantislikeAgilityIM)){
                case 2:
                    sufval = "(Primitive)";
                    break;
                case 3:
                    sufval = "(Evolved)";
                    break;
                default:
                    sufval = "";
            }
            return "Mantislike Agility" + sufval;
        }

        //Mutation Requirements
        public static function pReqs(pTier:int = 0):void{
            try{
                //This helps keep the requirements output clean.
                IMutationsLib.MantislikeAgilityIM.requirements = [];
                if (pTier == 0){
                    IMutationsLib.MantislikeAgilityIM.requireMusclesMutationSlot()
                    .requirePerk(IMutationsLib.TrachealSystemIM).requireCustomFunction(function (player:Player):Boolean {
                        return player.mantisScore() >= 12;
                    }, "Mantis race");
                }
                else{
                    var pLvl:int = pTier * 30;
                    IMutationsLib.MantislikeAgilityIM.requireLevel(pLvl);
                }
            }catch(e:Error){
                trace(e.getStackTrace());
            }
        }

        //Perk Max Level
        //Ignore the variable. Reusing the function that triggers this elsewhere and they need the int.
        public static function perkLvl(useless:int = 0):int{
            return 3;
        }

        //Mutations Buffs
        public static function pBuffs(pTier:int = 1):Object{
            var pBuffs:Object = {};
            return pBuffs;
        }

        public function MantislikeAgilityMutation() {
            super("Mantislike Agility IM", "Mantislike Agility", ".");
        }

        override public function keepOnAscension(respec:Boolean = false):Boolean {
            return true;
        }
    }
}