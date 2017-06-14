------------------------------------------------
-- 文件名    :  道具用技能.lua
-- 创建人    :  吴娟
-- 创建时间  :  2009-4-9
-- 用途(模块):  浩气盟场景任务
            

------------------------------------------------


--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
   		"Map/浩气盟/skill/火毒技能.lua",								-- 属性值1
   		0															-- 属性值2
   	);
--	skill.BindBuff(1,tSkillData[dwSkillLevel].nDebuffID, tSkillData[dwSkillLevel].nDebuffLevel)

    
    
	
    ----------------- 设置CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--公共CD
	skill.SetNormalCoolDown(1, 230);
	--破绽段位
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	----------------- 打退打断落马相关 -------------------------------------------------
    --skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
   -- skill.nBrokenRate         = 0 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	--Skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
    ----------------- 设置杂项参数 ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 5 * LENGTH_BASE;		-- 技能施放的最大距离
    skill.nAngleRange       = 256; 									--施放角度
    skill.nAreaRadius       = 8 * LENGTH_BASE;
	--skill.nPrepareFrames  	= 24;					-- 吟唱帧数
   -- skill.nPrepareFrames    = 0;										--吟唱帧数,16帧等于1秒
    
 	--skill.nBulletVelocity   = 0;										--子弹速度,点/帧
    --skill.nWeaponDamagePercent		= 0;
    --skill.nBreakRate        = 0;									--被打断的概率,默认1024表示一定被打断
	--skill.nTargetCountLimit	= 5;
    return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(npc, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能

    
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end
function Apply(dwCharacterID)
end
function OnSkillLevelUp(skill, player)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com