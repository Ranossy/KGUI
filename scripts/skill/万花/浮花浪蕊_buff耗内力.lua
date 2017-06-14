------------------------------------------------
-- 文件名    :  浮花浪蕊_buff耗内力.lua
-- 创建人    :  CBG
-- 创建时间  :  2010-12-1
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  招式
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nDamageBase = 69, 	nDamageRand = 07,  	nCostMana = 73}, 	--level 1
    { nDamageBase = 93, 	nDamageRand = 09,  	nCostMana = 109},	--level 2
    { nDamageBase = 119, 	nDamageRand = 12,  	nCostMana = 162},	--level 3
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.EXECUTE_SCRIPT, 
        "skill/万花/浮花浪蕊_buff耗内力.lua", 			
        0
    );
    
	--skill.BindBuff(1, 687, 1)	
	
    skill.nMinRadius		= 0											--技能施放最小半径
    skill.nMaxRadius        = 25 * LENGTH_BASE;						--技能施放最大半径
    skill.nAngleRange       = 256; 		

    return true;
end
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	if not IsPlayer(dwCharacterID) then
		return
	end
	local target = GetPlayer(dwCharacterID)
	if not target then
		return
	end

	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	if target then
		local MaxMP = target.nMaxMana
		local CurrentMP = target.nCurrentMana
		local nAP = player.nNeutralAttackPower
		local cof = math.floor(nAP/5,1)
		if CurrentMP > (2000+cof) * (1 - target.nDecriticalDamagePower * 0.000175) then
			target.nCurrentMana = CurrentMP - (2000 + cof) * (1 - target.nDecriticalDamagePower * 0.000175)
		else
			target.nCurrentMana = 0
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com